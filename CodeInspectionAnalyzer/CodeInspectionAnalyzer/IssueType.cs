using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace CodeInspectionAnalyzer
{
    [Serializable()]
    public class IssueType
    {
        [XmlAttribute("Id")]
        public string Id { get; set; }
        [XmlAttribute("Category")]
        public string Category { get; set; }
        [XmlAttribute("CategoryId")]
        public string CategoryId { get; set; }
        [XmlAttribute("Description")]
        public string Description { get; set; }
        [XmlAttribute("Severity")]
        public string Severity { get; set; }
    }
}
