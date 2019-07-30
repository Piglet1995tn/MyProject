using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class UpdateNotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
            string checkrole = (string)(Session["role"]);
            string account = (string)(Session["account"]);
            lbUserName.Text = account;
            if (account == null)
            {
                Response.Redirect("~/UI/Login.aspx");
            }
            if (checkrole == "HeadStaff" )
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
            Business.ScsBO sbo = new Business.ScsBO();
            DataTable dt = sbo.updateNotes(); ;
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table id='example' class='table table-striped table-bordered table-list'>");
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
                    List<Entity.StatusCheck> stl = new List<Entity.StatusCheck>();
                    stl = sbo.loadCheck();
                    if (i == 1)
                    {
                        html.Append("<td>");
                        html.Append(row[i]);
                        foreach (Entity.StatusCheck sc in stl)
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
            Panel3.Controls.Add(new Literal { Text = html.ToString() });
            }catch(Exception ee)
            {
                Response.Redirect("~/UI/Error.aspx");
            }

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }

      
    }
}