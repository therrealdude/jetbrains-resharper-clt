using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace CodeInspectionAnalyzer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Evaluating the inspection report...");
            Console.WriteLine("...");
            Console.WriteLine("...");

            var filePath = args[0];
            var failureSeverityLevel = args[1]?.ToUpper();

            using (XmlReader reader = XmlReader.Create(filePath))
            {
                Console.WriteLine("Reading the xml");
                var document = XElement.Load(reader);


                var issueTypeSerializer = new XmlSerializer(typeof(IssueType));
                var issueTypes =
                    document?.Element("IssueTypes")?.Elements("IssueType")
                        .Select(issueTypeXml => issueTypeSerializer.Deserialize(issueTypeXml.CreateReader()) as IssueType);

                var issueSerializer = new XmlSerializer(typeof(Issue));
                var issues =
                    document?.Element("Issues")?.Elements("Project").Elements("Issue")
                        .Select(issueXml => issueSerializer.Deserialize(issueXml.CreateReader()) as Issue)
                        .GroupBy(issue => issueTypes?.FirstOrDefault(type => issue?.TypeId == type.Id)?.Severity);

                var breakingIssues = new List<Issue>();
                switch (failureSeverityLevel)
                {
                    case SeverityLevels.HINT:
                        breakingIssues = issues?.SelectMany(issue => issue).ToList();
                        break;
                    case SeverityLevels.SUGGESTION:
                        breakingIssues = issues?
                            .Where(issue => issue.Key != SeverityLevels.HINT)
                            .SelectMany(issue => issue).ToList();
                        break;
                    case SeverityLevels.WARNING:
                        breakingIssues = issues?
                            .Where(issue => issue.Key != SeverityLevels.HINT && issue.Key != SeverityLevels.SUGGESTION)
                            .SelectMany(issue => issue).ToList();
                        break;
                    case SeverityLevels.ERROR:
                        breakingIssues = issues?
                            .Where(issue =>
                                issue.Key != SeverityLevels.HINT && issue.Key != SeverityLevels.SUGGESTION &&
                                issue.Key != SeverityLevels.WARNING)
                            .SelectMany(issue => issue).ToList();
                        break;
                }

                if (breakingIssues?.Any() ?? false)
                {
                    var errorMessage = GetErrorMessage(breakingIssues);
                    Console.Error.WriteLine(errorMessage);
                    throw new Exception(errorMessage);
                }
                else
                {
                    Console.WriteLine($"No issues of type {failureSeverityLevel} or greater were found!");
                }
            }
        }

        public static string GetErrorMessage(IEnumerable<Issue> issues)
        {
            StringBuilder sb = new StringBuilder($"The code inspection found the following errors: \n ");
            foreach (var issue in issues)
            {
                sb.Append($"{issue.TypeId} {issue.File} {issue.Line} {issue.Message} {issue.Offset} \n");
            }
            return sb.ToString();
        }
    }
}
