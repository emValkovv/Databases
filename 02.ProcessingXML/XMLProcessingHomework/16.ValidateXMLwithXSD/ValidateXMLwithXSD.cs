using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.Schema;

namespace _16.ValidateXMLwithXSD
{
    class ValidateXMLwithXSD
    {
        static void Main()
        {
            string schemaNamespace = "http://www.w3.org/2001/XMLSchema";
            var xDocFalse = XDocument.Load("../../../catalogFalse.xml");
            var xDocTrue = XDocument.Load("../../../catalog.xml");
            var schemas = new XmlSchemaSet();
            schemas.Add(schemaNamespace, "../../../catalog.xsd");

            CheckXML(schemas, xDocFalse);
            CheckXML(schemas, xDocTrue);


        }
        public static void CheckXML(XmlSchemaSet schema, XDocument xDoc)
        {
            bool result = false;
            xDoc.Validate(schema, (obj, error) =>
            {
                Console.WriteLine("{0}", error.Message);
                result = true;
            });
            Console.WriteLine("XML document {0}", result ? "not validated" : "validated");
            //xDoc.Validate(schema, (obj, error) =>
            //{
            //    result = false;
            //});
            //return result;
        }
    }
}
