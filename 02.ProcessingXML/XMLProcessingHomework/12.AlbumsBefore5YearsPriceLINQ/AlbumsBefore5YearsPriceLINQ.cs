using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _12.AlbumsBefore5YearsPriceLINQ
{
    class AlbumsBefore5YearsPriceLINQ
    {
        static void Main()
        {
            XDocument doc = XDocument.Load("../../../catalog.xml");
            var albums =
                from album in doc.Descendants("album")
                select new
                {
                    Price = album.Element("price").Value,
                    Year = album.Element("year").Value,
                    Name = album.Element("name").Value
                };
            foreach (var album in albums)
            {
                if (Int32.Parse(album.Year) < (2016 - 5))
                {
                    Console.WriteLine("{0} ({1}) has price {2}.", album.Name, album.Year, album.Price);
                }
            }
        }
    }
}
