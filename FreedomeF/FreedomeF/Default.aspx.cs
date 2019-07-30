using FreedomeF.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Default : System.Web.UI.Page
    {
        ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
        ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Homepage.aspx");
    }
    }
}