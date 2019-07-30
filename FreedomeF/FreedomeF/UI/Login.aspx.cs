using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string check = Request.QueryString["status"];
            if (check != null)
            {
                lbNoitice.Text ="Đăng nhập thất bại";
            }
        }

   

        protected void loginButton_Click1(object sender, EventArgs e)
        {
  //your client id  
            string clientid = "513687959532-rad6mtucv7vj8jnqug75p8pgce0scvf5.apps.googleusercontent.com";
            //your client secret  
            string clientsecret = "8A2ImjU13loEIa4TnPEreIS2";
            //your redirection url  
            string redirection_url = Request.Url.GetLeftPart(UriPartial.Authority) + "/UI/Homepage.aspx";
            string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=email&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
            Response.Redirect(url);
        }
    }
}