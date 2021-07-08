using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace CodeInspectionAnalyzer
{
    [Serializable()]
    public class Issue
    {
        [XmlAttribute("TypeId")]
        public string TypeId { get; set; }
        [XmlAttribute("File")]
        public string File { get; set; }
        [XmlAttribute("Offset")]
        public string Offset { get; set; }
        [XmlAttribute("Line")]
        public string Line { get; set; }
        [XmlAttribute("Message")]
        public string Message { get; set; }
    }
}
