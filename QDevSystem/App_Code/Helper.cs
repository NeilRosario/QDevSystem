using System;
using System.Collections.Generic;
using System.Configuration;

namespace QDevSystem.App_Code
{
    public class Helper
    {
        public static string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        }
    }
}