using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace _08.AlbumsCatalogWithXmlReaderWriter
{
    class AlbumsCatalogWithXmlReaderWriter
    {
        static void Main()
        {
            string newXmlPath = "../../albums.xml";
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.Encoding = encoding;

            using (XmlWriter writer = XmlWriter.Create(newXmlPath, settings))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("listofalbums");

                using (XmlReader reader = XmlReader.Create("../../catalog.xml"))
                {
                    while (reader.Read())
                    {
                        if (reader.Name == "name")
                        {
                            writer.WriteStartElement("album");
                            writer.WriteElementString("name", reader.ReadElementContentAsString());
                        }
                        else if (reader.Name == "artist")
                        {
                            writer.WriteElementString("artist", reader.ReadElementContentAsString());
                            writer.WriteEndElement();
                        }
                    }
                }
            }
            Console.WriteLine("New XML file was created.");
        }
    }
}
