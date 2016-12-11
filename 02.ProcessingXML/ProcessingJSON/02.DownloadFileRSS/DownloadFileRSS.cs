using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace _02.DownloadFileRSS
{
    class DownloadFileRSS
    {
        static void Main()
        {
            string url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";
            string fileName = "../../youtube.xml";
            var webClient = new WebClient();
            webClient.DownloadFile(url, fileName);
            Console.WriteLine("Download has been finished");
        }
    }
}
