using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;

namespace _03.XMLToJSON
{
    class XMLToJSON
    {
        static void Main()
        {
            string fileName = "../../../youtube.xml";
            XDocument xDoc = XDocument.Load(fileName);
            string jsonToXml = JsonConvert.SerializeXNode(xDoc, Newtonsoft.Json.Formatting.Indented);
            Console.WriteLine(jsonToXml);
        }
    }
}
