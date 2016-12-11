using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace _13.TransformXMLwithXSLtoHTML
{
    class TransformXMLwithXSLtoHTML
    {
        static void Main()
        {
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load("../../../catalog.xslt");
            xslt.Transform("../../../catalog.xml", "../../../catalog.html");
        }
    }
}
