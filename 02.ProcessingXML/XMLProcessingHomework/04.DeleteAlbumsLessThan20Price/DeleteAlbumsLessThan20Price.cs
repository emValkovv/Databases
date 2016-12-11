using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace _04.DeleteAlbumsLessThan20Price
{
    class DeleteAlbumsLessThan20Price
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../catalog.xml");
            XmlNode root = doc.DocumentElement;

            foreach (XmlNode album in root.SelectNodes("album"))
            {
                if (Int32.Parse(album["price"].InnerText) < 20)
                {
                    root.RemoveChild(album);
                    Console.WriteLine("{0} has been removed.", album["name"].InnerText);
                }
            }

            doc.Save("../../catalogWithoutPrice20.xml");
        }
    }
}
