using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace _11.AlbumsBefore5YearsPrice
{
    class AlbumsBefore5YearsPrice
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalog.xml");

            string xPath = "listofalbums/album[year<(2016-5)]";
            XmlNodeList albumsList = doc.SelectNodes(xPath);
            foreach (XmlNode album in albumsList)
            {
                Console.WriteLine("{0} ({1}) has price {2}.", album["name"].InnerText, album["year"].InnerText, album["price"].InnerText);
            }
        }
    }
}
