using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using FreedomeF.Entity;
using FreedomeF.Business;
using System.Globalization;

namespace FreedomeF
{
    public partial class Homepage : System.Web.UI.Page
    {

        //your client id  
        string clientid = "513687959532-rad6mtucv7vj8jnqug75p8pgce0scvf5.apps.googleusercontent.com";
        //your client secret  
        string clientsecret = "8A2ImjU13loEIa4TnPEreIS2";
        //your redirection url  
        string redirection_url = "";
        string url = "https://accounts.google.com/o/oauth2/token";

        public class Tokenclass
        {
            public string access_token
            {
                get;
                set;
            }
            public string token_type
            {
                get;
                set;
            }
            public int expires_in
            {
                get;
                set;
            }
            public string refresh_token
            {
                get;
                set;
            }
        }

        public class Userclass
        {
            public string id
            {
                get;
                set;
            }
            public string email
            {
                get;
                set;
            }
            public string verified_email
            {
                get;
                set;
            }
            public string name
            {
                get;
                set;
            }
            public string given_name
            {
                get;
                set;
            }
            public string family_name
            {
                get;
                set;
            }
            public string link
            {
                get;
                set;
            }
            public string picture
            {
                get;
                set;
            }
            public string locale
            {
                get;
                set;
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            this.redirection_url = Request.Url.GetLeftPart(UriPartial.Authority) + "/UI/Homepage.aspx";
            ScsBO sbo = new ScsBO();
            StaffDAL stdal = new StaffDAL();
            if (!IsPostBack)
            {
                if (Request.QueryString["code"] != null)
                {
                    GetToken(Request.QueryString["code"].ToString());
                }
            }
            if ((string)(Session["role"]) == null)
            {
                Response.Redirect("~/UI/Login.aspx");
            }
            string staffName = (string)(Session["account"]);
            string usermail = (string)(Session["usermail"]);
         

            string checkrole = (string)(Session["role"]);
            string account = (string)(Session["account"]);
            
            if (checkrole == "HeadStaff")
            {
                divide.Visible = true;
                logCare.Visible = true;
                control.Visible = true;
              

            }
            else
            {
                divide.Visible = false;
                logCare.Visible = false;
                control.Visible = false;
                
            }




          
            int accountID = (int)(Session["accountID"]);




            //DateTime tm;
            DateTime today = DateTime.Now;/*DateTime.ParseExact("10/06/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture); //Convert.ToDateTime("10/06/2018");*/
            //if (!Page.IsPostBack)
            //{
            //    for (int td = 0; td < 7; td++)
            //    {
            //        tm = today.AddDays(-td);
            //        DropDownList1.Items.Add(tm.ToString("dd/MM/yyyy"));
            //    }
            //}
            if (!IsPostBack) { 
            if (checkrole.Equals("CareStaff"))
            {
                DataTable dt = sbo.todayReport(accountID.ToString(), today);
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table id='example' class='table table-striped table-bordered table-list'>");
                //Building the Header row.
                html.Append("<thead>");
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");

                }
                html.Append("</tr>");
                html.Append("</thead>");
                //Building the Data rows.
                html.Append("<tbody>");
                foreach (DataRow row in dt.Rows)
                {

                    html.Append("<tr>");
                    string url = "";
                    html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                    for (int i = 1; i < dt.Columns.Count; i++)
                    {
                        List<StatusCheck> stl = new List<StatusCheck>();
                        stl = sbo.loadCheck();
                        if (i == 1)
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            foreach (StatusCheck sc in stl)
                            {
                                if (sc.attention == true && sc.studentID.Equals(row[0].ToString()))
                                {
                                    html.Append(" <span style='color: red; ' class='glyphicon'>&#xe086;</span>");
                                    break;
                                }
                            }
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            html.Append("</td>");
                        }

                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");
                html.Append("</tbody");
                //Append the HTML string to Placeholder.
                Panel1.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                DataTable dt = sbo.todayReportForHead(today);
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table id='example'  class='table table-striped table-bordered table-list'>");
                //Building the Header row.
                html.Append("<thead>");
                html.Append("<tr class='info'>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");

                }
                html.Append("</tr>");
                html.Append("</thead>");
                //Building the Data rows.
                html.Append("<tbody>");
                foreach (DataRow row in dt.Rows)
                {

                    html.Append("<tr>");
                    string url = "";
                    html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                    for (int i = 1; i < dt.Columns.Count; i++)
                    {
                        List<StatusCheck> stl = new List<StatusCheck>();
                        stl = sbo.loadCheck();
                        if (i == 1)
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            foreach (StatusCheck sc in stl)
                            {
                                if (sc.attention == true && sc.studentID.Equals(row[0].ToString()))
                                {
                                    html.Append(" <span style='color: red; ' class='glyphicon'>&#xe086;</span>");
                                    break;
                                }
                            }
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            html.Append("</td>");
                        }

                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");
                html.Append("</tbody");
                //Append the HTML string to Placeholder.
                Panel1.Controls.Add(new Literal { Text = html.ToString() });
            }
            }
            string name = (string)(Session["account"]);
            lbUserName.Text = name;

        }
        public void GetToken(string code)
        {
            string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlencoded";
            request.Method = "POST";
            UTF8Encoding utfenc = new UTF8Encoding();
            byte[] bytes = utfenc.GetBytes(poststring);
            Stream outputstream = null;
            try
            {
                request.ContentLength = bytes.Length;
                outputstream = request.GetRequestStream();
                outputstream.Write(bytes, 0, bytes.Length);
            }
            catch { }
            if (Session["accountID"] == null)
            {


                var response = (HttpWebResponse)request.GetResponse();
                var streamReader = new StreamReader(response.GetResponseStream());
                string responseFromServer = streamReader.ReadToEnd();
                JavaScriptSerializer js = new JavaScriptSerializer();
                Tokenclass obj = js.Deserialize<Tokenclass>(responseFromServer);
                GetuserProfile(obj.access_token);

            }



        }

        public void GetuserProfile(string accesstoken)
        {
            string url = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=" + accesstoken + "";
            WebRequest request = WebRequest.Create(url);
            request.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response = request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            response.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Userclass userinfo = js.Deserialize<Userclass>(responseFromServer);
            Business.ScsBO sbo = new Business.ScsBO();
            Entity.Staff st = sbo.login(userinfo.email);
            if (st == null || (st.account != userinfo.email || !st.status.Equals("active"))||st.role.Equals("Admin"))
            {
                Response.Redirect("~/UI/Login.aspx?status=error");
            }
            Session["account"] = st.staffName;
            Session["usermail"] = userinfo.email;

            lbUserName.Text = st.staffName;

            //set session to check table
            Session["accountID"] = st.accountID;

            Session["role"] = st.role;







        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }

        //protected void Button4_Click(object sender, EventArgs e)
        //{
        //   
        //}

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Result.aspx?result=" + tbSearch.Text);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            ScsBO sbo = new ScsBO();
            int accountID = (int)(Session["accountID"]);
            string checkrole = (string)(Session["role"]);
            if (checkrole.Equals("CareStaff"))
            {
                DataTable dt = sbo.todayReport(accountID.ToString(), Calendar1.SelectedDate);
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table id='example' class='table table-striped table-bordered table-list'>");
                //Building the Header row.
                html.Append("<thead>");
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");

                }
                html.Append("</tr>");
                html.Append("</thead>");
                //Building the Data rows.
                html.Append("<tbody>");
                foreach (DataRow row in dt.Rows)
                {

                    html.Append("<tr>");
                    string url = "";
                    html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                    for (int i = 1; i < dt.Columns.Count; i++)
                    {
                        List<StatusCheck> stl = new List<StatusCheck>();
                        stl = sbo.loadCheck();
                        if (i == 1)
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            foreach (StatusCheck sc in stl)
                            {
                                if (sc.attention == true && sc.studentID.Equals(row[0].ToString()))
                                {
                                    html.Append(" <span style='color: red; ' class='glyphicon'>&#xe086;</span>");
                                    break;
                                }
                            }
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            html.Append("</td>");
                        }

                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");
                html.Append("</tbody");
                //Append the HTML string to Placeholder.
                Panel1.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                DataTable dt = sbo.todayReportForHead(Calendar1.SelectedDate);
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table id='example'  class='table table-striped table-bordered table-list'>");
                //Building the Header row.
                html.Append("<thead>");
                html.Append("<tr class='info'>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");

                }
                html.Append("</tr>");
                html.Append("</thead>");
                //Building the Data rows.
                html.Append("<tbody>");
                foreach (DataRow row in dt.Rows)
                {

                    html.Append("<tr>");
                    string url = "";
                    html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                    for (int i = 1; i < dt.Columns.Count; i++)
                    {
                        List<StatusCheck> stl = new List<StatusCheck>();
                        stl = sbo.loadCheck();
                        if (i == 1)
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            foreach (StatusCheck sc in stl)
                            {
                                if (sc.attention == true && sc.studentID.Equals(row[0].ToString()))
                                {
                                    html.Append(" <span style='color: red; ' class='glyphicon'>&#xe086;</span>");
                                    break;
                                }
                            }
                            html.Append("</td>");
                        }
                        else
                        {
                            html.Append("<td>");
                            html.Append(row[i]);
                            html.Append("</td>");
                        }

                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");
                html.Append("</tbody");
                //Append the HTML string to Placeholder.
                Panel1.Controls.Add(new Literal { Text = html.ToString() });
            }
        }
    }
}