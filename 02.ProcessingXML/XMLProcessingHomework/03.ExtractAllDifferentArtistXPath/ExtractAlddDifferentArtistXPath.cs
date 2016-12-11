using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace _03.ExtractAllDifferentArtistXPath
{
    class ExtractAlddDifferentArtistXPath
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../catalog.xml");
            string xmlPath = "listofalbums/album";
            XmlNodeList albumsList = doc.SelectNodes(xmlPath);
            var dict = new Dictionary<string, int>();

            foreach (XmlNode album in albumsList)
            {
                var artist = album["artist"].InnerText;
                if (dict.ContainsKey(artist))
                {
                    dict[artist]++;
                }
                else
                {
                    dict.Add(artist, 1);
                }
            }

            foreach (var artist in dict)
            {
                Console.WriteLine("{0} has {1} albums.", artist.Key, artist.Value);
            }
        }
    }
}
