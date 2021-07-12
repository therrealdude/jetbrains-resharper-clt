<#
.Synopsis
    Performs code analysis using the ReSharper CLT, InspectCode & DupFinder.
.DESCRIPTION
    Takes file path to solution file, output directory for reports and excluded file extensions as parameters, and then exports HTML report of code analysis for the solution.

.EXAMPLE
    . .\Code_Analysis.ps1 -SolutionFilePath "..\WebApp.sln" -ExcludedExtensions "js,css,html"; DupFinder-Analysis

.EXAMPLE
    . .\Code_Analysis.ps1 -SolutionFilePath "..\WebApp.sln" -ExcludedExtensions "js,css,html,xml,xslt,xlsx,pdf,asmx,ascx,ashx"; InspectCode-Analysis

#>

[CmdletBinding()]
Param
(
    [Parameter(Mandatory = $true,
        Position = 0)]
    [string]$SolutionFilePath,       
      
    [Parameter(Mandatory = $false,
        Position = 1)]
    [string]$OutputDirPath = '..\a\codeinspectionoutput\',
       
    [Parameter(Mandatory = $false,
        Position = 2)]
    [string]$ExcludedExtensions = 'js,css',
   
   [Parameter(Mandatory = $false,
	Position = 3)]
   [string]$FailureSeverityLevel = 'ERROR'
)
[string[]]$SolutionPathList = $SolutionFilePath.Split('\', [System.StringSplitOptions]::RemoveEmptyEntries)
[string[]]$ExcludedList = $ExcludedExtensions.Split(',', [System.StringSplitOptions]::RemoveEmptyEntries)
[string]$SolutionDirPath = ($SolutionPathList[0..$($SolutionPathList.Count - 2)] -join '\')
[string]$JetBrainsDirPath = 'jetbrains-resharper-clt-master/jetbrains-resharper-clt'

function Invoke-InspectCode {
    $OutputFileName = '$($OutputDirPath)resharper-inspectcode-report.xml';
    Invoke-Expression ".\$($JetBrainsDirPath)\InspectCode.exe $($SolutionFilePath) --o=$($OutputFileName) --profile=$($SolutionFilePath).DotSettings"
}

function Invoke-DupFinder {
    $OutputFileName = '$($OutputDirPath)resharper-dupfinder-report.xml';
    Invoke-Expression ".\$($JetBrainsDirPath)\DupFinder.exe $($SolutionFilePath) --o=$($OutputFileName)"
}

function Export-DupFinder-Report {
    $xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
    $xslt.Load(".\$($JetBrainsDirPath)\Templates\dupfinder.xslt"); 
    $XmlFileName = "$($OutputDirPath)\resharper-dupfinder-report.xml";
    $HtmlFileName = "$($OutputDirPath)\resharper-dupfinder-report.html";
    $xslt.Transform("$($XmlFileName)", "$($HtmlFileName)");
}

function Export-InspectCode-Report {
    $xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
    $xslt.Load(".\$($JetBrainsDirPath)\Templates\inspectcode.xslt"); 
    $XmlFileName = "$($OutputDirPath)\resharper-inspectcode-report.xml";
    $HtmlFileName = "$($OutputDirPath)\resharper-inspectcode-report.html";
    $xslt.Transform("$($XmlFileName)", "$($HtmlFileName)");
    Get-Content $($XmlFileName);
    .\jetbrains-resharper-clt-master\CodeInspectionAnalyzer\CodeInspectionAnalyzer\bin\Release\CodeInspectionAnalyzer.exe $($XmlFileName) $($FailureSeverityLevel);
    Write-Host "Finished analyzing the report.";
}

function Publish-DupFinder-Analysis {
    Invoke-DupFinder
    Export-DupFinder-Report
}

function Publish-InspectCode-Analysis {
    Invoke-InspectCode
    Export-InspectCode-Report
}

