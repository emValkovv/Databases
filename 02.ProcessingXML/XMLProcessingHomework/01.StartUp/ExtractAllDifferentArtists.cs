using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading.Tasks;
using System.Xml;

namespace StartUp
{
    class ExtractAllDifferentArtists
    { 
        static void Main(string[] args)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("catalog.xml");
            XmlNode root = doc.DocumentElement;
            var dict = new Dictionary<string, int>();

            foreach (XmlNode node in root.ChildNodes)
            {
                var artist = node["artist"].InnerText;
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
