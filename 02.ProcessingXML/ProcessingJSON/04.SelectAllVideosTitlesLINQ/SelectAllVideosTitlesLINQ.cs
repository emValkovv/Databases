using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _04.SelectAllVideosTitlesLINQ
{
    class SelectAllVideosTitlesLINQ
    {
        static void Main()
        {
            string fileName = "../../../youtube.xml";
            XDocument xDoc = XDocument.Load(fileName);
            string jsonToXml = JsonConvert.SerializeXNode(xDoc, Newtonsoft.Json.Formatting.Indented);
            //Console.WriteLine(jsonToXml);
            var jsonObj = JObject.Parse(jsonToXml);
            var jsonObjVideos = jsonObj["feed"]["entry"];
            var titles = jsonObjVideos
                .Select(x => x["title"].Value<string>());
            foreach (var title in titles)
            {
                Console.WriteLine(title);
            }            
        }
    }
}
