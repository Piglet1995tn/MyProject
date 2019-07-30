using FreedomeF.Business;
using FreedomeF.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF.UI
{
    public partial class distribution : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)

        {
            string check = Request.QueryString["check"];
            if (check != null)
            {
                btnRecomment.Enabled = true;
            }
            
            if ((Session["role"]) == null || (Session["account"]) == null)
            {
                Response.Redirect("~/UI/Login.aspx");
            }
            Business.ScsBO sbo = new Business.ScsBO();
            Business.RankDAL rdal = new Business.RankDAL();
            Business.StudentDAL stdl = new Business.StudentDAL();
            string checkrole = (string)(Session["role"]);
            string account = (string)(Session["account"]);
            lbUserName.Text = account;
           
            if (checkrole == "HeadStaff" )
            {
                logCare.Visible = true;
                control.Visible = true;
                divide.Visible = true;
                

            }
            else
            {
                logCare.Visible = false;
                control.Visible = true;
                divide.Visible = true;
                
            }
           

            //ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            //FreedomeF.ServiceReference1.ListStudentID[] listStudent = ws.getStudentID();

            DataTable dt = sbo.tableDistri();
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table id='list1' class='table table-striped table-bordered table-list'>");
            html.Append("<thead>");
            //Building the Header row.
            html.Append("<tr>");
            //foreach (DataColumn column in dt.Columns)
            //{
            html.Append("<th>");
            html.Append("Mssv");
            html.Append("</th>");
            html.Append("<th>");
            html.Append("Nhân viên chăm sóc");


            //}

            html.Append("</tr>");
            html.Append("</thead>");
            html.Append("<tbody>");
            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                string url = "";
                html.Append("<tr>");
                html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                for (int i = 1; i < 2; i++)
                {
                    //    if (i == 2)
                    //    {
                    //        html.Append("< td align = 'left' valign = 'top' >< a href = '#' > Edit </ a ></ td >");
                    //    }
                    //    else
                    //    {
                    html.Append("<td>");
                    html.Append(row[i]);

                    html.Append("</td>");/*}*/

                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");
            html.Append("</tbody>");
            //Append the HTML string to Placeholder.
            Panel1.Controls.Add(new Literal { Text = html.ToString() });

            //********************************************



            DataTable dt2 = stdl.tableListOldStudent();

            //Building an HTML string.
            StringBuilder html2 = new StringBuilder();

            //Table start.
            html2.Append("<table id='list2' class='table table-striped table-bordered table-list'>");
            html2.Append("<thead>");
            //Building the Header row.
            html2.Append("<tr>");
            foreach (DataColumn column in dt2.Columns)
            {
                html2.Append("<th>");
                html2.Append(column.ColumnName);
                html2.Append("</th>");
            }
            html2.Append("<th>");
            html2.Append("Trạng thái chăm sóc");
            html2.Append("</th>");
            html.Append("</tr>");
            html2.Append("</thead>");
            html2.Append("<tbody>");
            //Building the Data rows.
            foreach (DataRow row in dt2.Rows)
            {
                html2.Append("<tr>");
                foreach (DataColumn column in dt2.Columns)
                {

                    html2.Append("<td>");
                    html2.Append(row[column.ColumnName]);
                    html2.Append("</td>");

                }
                html2.Append("<td>");
                html2.Append("<a href=" + "/UI/Move.aspx?studentID=" + row[0] + " class='button'>Di chuyển</a>");
                html2.Append("</td>");
                html2.Append("</tr>");
            }

            //Table end.
            html2.Append("</table>");
            html2.Append("</tbody>");
            //Append the HTML string to Placeholder.
            Panel2.Controls.Add(new Literal { Text = html2.ToString() });

        }





        protected void btnReUpdate_Click(object sender, EventArgs e)
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            Business.ScsBO sbo = new Business.ScsBO();


            List<Student> stFAP = new List<Student>();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            string stf = fap.GetStudenK10JS();
            stFAP = JsonConvert.DeserializeObject<List<Student>>(stf);
            List<StaffTakeCare> listfromDB = sbo.showListTable();
            List<String> listStudentIdDub = new List<String>();


            Business.RankDAL rdal = new Business.RankDAL();
            Business.StudentDAL stdl = new Business.StudentDAL();
            //Entity.Rank r = null;
            var tasks = new Task[stFAP.Count];
            for (int i = 0; i < stFAP.Count; i++)
            {

                string rollNumber = stFAP[i].rollNumber;
                tasks[i] = Task.Factory.StartNew(() =>
                {
                    List<StudentProfile> stp = new List<StudentProfile>();
                    string inf = fap.GetStudentById(rollNumber);
                    stp = JsonConvert.DeserializeObject<List<StudentProfile>>(inf);
                    bool flag = false;

                    for (int j = 0; j < listfromDB.Count; j++)
                    {
                        if (rollNumber.ToString().Equals(listfromDB[j].studentID.ToString()))
                        {
                            flag = true;
                            break;
                        }
                    }
                    if (!flag)
                    {
                        stdl.insertStudentToTakeCare(rollNumber.ToString(), stp[0].fullName);
                    }
                });


            }
            Task.WaitAll(tasks);
            rdal.rankking();
            stdl.filterStudent();
            string check = "";
            Response.Redirect("~/UI/distribution.aspx?check="+check);
          
        }

        protected void logOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }

        protected void btnRecomment_Click(object sender, EventArgs e)
        {
            Business.ScsBO sbo = new Business.ScsBO();
            StaffDAL stal = new StaffDAL();
            List<TakeCare> listTakeCare = stal.listStaff();
            if (listTakeCare.Count != 0)
            {
                sbo.autoDistribution();
                btnRecomment.Enabled = false;
                Response.Redirect("~/UI/distribution.aspx");
            }

            lbError.Text = "Hiện tại chưa có nhân viên chăm sóc !";

        }

    }
}