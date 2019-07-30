using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FreedomeF.Business
{
    public class DbConnect
    {
        public static SqlConnection GetConnection()
        {
            System.Configuration.Configuration rootWebConfig =
                System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/configuration");

            if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            {
                System.Configuration.ConnectionStringSettings conStringSettings;
                conStringSettings =
                    rootWebConfig.ConnectionStrings.ConnectionStrings["FnProject3"];
                SqlConnection con = new SqlConnection(conStringSettings.ConnectionString);

                return con;
            }
            else return null;
        }
    }
}