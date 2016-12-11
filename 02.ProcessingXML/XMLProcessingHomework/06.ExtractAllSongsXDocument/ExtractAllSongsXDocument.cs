﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _06.ExtractAllSongsXDocument
{
    class ExtractAllSongsXDocument
    {
        static void Main()
        {
            XDocument doc = XDocument.Load("../../catalog.xml");
            var songs =
                from song in doc.Descendants("song")       
                select new
                {
                    Title = song.Element("title").Value 
                };

            foreach (var song in songs)
            {
                Console.WriteLine(song.Title);
            }
        }
    }
}
