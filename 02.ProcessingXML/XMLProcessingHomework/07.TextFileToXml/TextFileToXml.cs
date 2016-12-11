using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _07.TextFileToXml
{
    class TextFileToXml
    {
        static void Main()
        {
            string[] textFile = File.ReadAllLines("../../person.txt");
            XElement xmlFile = new XElement("person",
                new XElement("name", textFile[0]),
                new XElement("adress", textFile[1]),
                new XElement("phonenumber", textFile[2]));

            xmlFile.Save("../../person.xml");
        }
    }
}
