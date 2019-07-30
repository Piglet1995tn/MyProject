using FreedomeF.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Overview : System.Web.UI.Page
    {

        public double compare;
        public double compare2;

        public string url;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                if ((Session["account"]) == null || (Session["role"]) == null || (Session["accountID"]) == null)
                {
                    Response.Redirect("~/UI/Login.aspx");
                }
                if (this.IsPostBack) return;
                Business.ScsBO sbo = new Business.ScsBO();
                int accountID = (int)(Session["accountID"]);
                string checkrole = (string)(Session["role"]);
                string account = (string)(Session["account"]);
                lbUserName.Text = account;

                if (checkrole.Equals("HeadStaff"))
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
                //**********************

                List<StatusCheck> stl = new List<StatusCheck>();
                stl = sbo.loadCheck();
                if (checkrole.Equals("CareStaff"))
                {
                    DataTable dt = sbo.myStudent(accountID);


                    //Building an HTML string.
                    System.Text.StringBuilder html = new System.Text.StringBuilder();

                    //Table start.
                    html.Append("<table id='overview' class='table table-striped table-bordered table-list'>");
                    html.Append("<thead>");
                    //Building the Header row.
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<th>");
                        html.Append(column.ColumnName);
                        html.Append("</th>");
                    }
                    html.Append("</tr>");
                    html.Append("</thead>");
                    html.Append("<tbody>");
                    //Building the Data rows.
                    int gpaFlag = 0;
                    int behaviorFlag = 0;
                    int attenFalg = 0;
                    int failFlag = 0;
                    //int checkFlag = 0;
                    List<Compare> cp = new List<Compare>();
                    cp = sbo.takeDataCompare(accountID.ToString());
                    foreach (DataRow row in dt.Rows)
                    {
                        html.Append("<tr>");
                        string url = "";
                        html.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row[0] + ">" + row[0] + "</a></td>");
                        for (int i = 1; i < dt.Columns.Count; i++)
                        {
                            //Rank r =sbo.GetDataToCompare(semester,row[0].ToString());

                            //stl = sbo.loadCheck();
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
                            else if (i == 2)
                            {
                                for (int j = gpaFlag; j < cp.Count; j++)
                                {

                                    html.Append("<td>");
                                    html.Append(row[i]);

                                    if ((double)cp[j].gpa > (double)cp[j].gpa2)
                                    {
                                        html.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");

                                    }
                                    else if ((double)cp[j].gpa == (double)cp[j].gpa2 || (double)cp[j].gpa2 == 0)
                                    {

                                    }
                                    else
                                    {
                                        html.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html.Append("</td>");
                                    gpaFlag++;
                                    break;
                                }


                            }
                            else if (i == 3)
                            {

                                for (int j = behaviorFlag; j < cp.Count; j++)
                                {

                                    html.Append("<td>");
                                    html.Append(row[i]);

                                    if ((double)cp[j].behavior > (double)cp[j].behavior2)
                                    {
                                        html.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    }
                                    else if ((double)cp[j].behavior == (double)cp[j].behavior2 || (double)cp[j].behavior2 == 0)
                                    {

                                    }
                                    else
                                    {
                                        html.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html.Append("</td>");
                                    behaviorFlag++;
                                    break;
                                }
                            }
                            else if (i == 4)
                            {

                                for (int j = attenFalg; j < cp.Count; j++)
                                {

                                    html.Append("<td>");
                                    html.Append(row[i]);

                                    if ((double)cp[j].atten > (double)cp[j].atten2)
                                    {
                                        html.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    }
                                    else if ((double)cp[j].atten == (double)cp[j].atten2 || (double)cp[j].atten2 == 0)
                                    {

                                    }
                                    else
                                    {
                                        html.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html.Append("</td>");
                                    attenFalg++;
                                    break;
                                }
                            }
                            else if (i == 5)
                            {

                                //for (int j = failFlag; j < cp.Count; j++)
                                //{

                                    html.Append("<td>");
                                    html.Append(row[i]);

                                    //if ((double)cp[j].failcourse < (double)cp[j].failcourse2)
                                    //{
                                    //    html.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    //}
                                    //else if ((double)cp[j].failcourse == (double)cp[j].failcourse2)
                                    //{

                                    //}
                                    //else
                                    //{
                                    //    html.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    //}

                                    html.Append("</td>");
                                //    failFlag++;
                                //    break;
                                //}
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
                    html.Append("<tbody>");
                    //Append the HTML string to Placeholder.
                    Panel1.Controls.Add(new Literal { Text = html.ToString() });
                }
                else
                {
                    DataTable dt2 = sbo.myStudentForHead();


                    //Building an HTML string.
                    System.Text.StringBuilder html2 = new System.Text.StringBuilder();

                    //Table start.
                    html2.Append("<table id='overview' class='table table-striped table-bordered table-list'>");
                    html2.Append("<thead>");
                    //Building the Header row.
                    html2.Append("<tr>");
                    foreach (DataColumn column2 in dt2.Columns)
                    {
                        html2.Append("<th>");
                        html2.Append(column2.ColumnName);
                        html2.Append("</th>");
                    }
                    html2.Append("</tr>");
                    html2.Append("</thead>");
                    html2.Append("<tbody>");
                    //Building the Data rows.
                    int gpaFlag = 0;
                    int behaviorFlag = 0;
                    int attenFalg = 0;
                    ////int failFlag = 0;
                    //int checkFlag = 0;
                    List<Compare> cp = new List<Compare>();
                    cp = sbo.takeDataCompareForHead();
                    foreach (DataRow row2 in dt2.Rows)
                    {
                        html2.Append("<tr>");
                        string url = "";
                        html2.Append("<td align='left' valign='top'><a href=" + url + "Profile.aspx?studentID=" + row2[0] + ">" + row2[0] + "</a></td>");

                        for (int i = 1; i < dt2.Columns.Count; i++)
                        {
                            //Rank r =sbo.GetDataToCompare(semester,row[0].ToString());
                            //stl = sbo.loadCheck();
                            if (i == 1)
                            {
                                html2.Append("<td>");
                                html2.Append(row2[i]);
                                foreach (StatusCheck sc in stl)
                                {
                                    if (sc.attention == true && sc.studentID.Equals(row2[0].ToString()))
                                    {
                                        html2.Append(" <span style='color: red; ' class='glyphicon'>&#xe086;</span>");
                                        break;
                                    }
                                }
                                html2.Append("</td>");
                            }
                            else if (i == 2)
                            {
                                for (int j = gpaFlag; j < cp.Count; j++)
                                {

                                    html2.Append("<td>");
                                    html2.Append(row2[i]);

                                    if ((double)cp[j].gpa > (double)cp[j].gpa2)
                                    {
                                        html2.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");

                                    }
                                    else
                                    {
                                        html2.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html2.Append("</td>");
                                    gpaFlag++;
                                    break;
                                }


                            }
                            else if (i == 3)
                            {

                                for (int j = behaviorFlag; j < cp.Count; j++)
                                {

                                    html2.Append("<td>");
                                    html2.Append(row2[i]);

                                    if ((double)cp[j].behavior > (double)cp[j].behavior2)
                                    {
                                        html2.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    }
                                    else
                                    {
                                        html2.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html2.Append("</td>");
                                    behaviorFlag++;
                                    break;
                                }
                            }
                            else if (i == 4)
                            {

                                for (int j = attenFalg; j < cp.Count; j++)
                                {

                                    html2.Append("<td>");
                                    html2.Append(row2[i]);

                                    if ((double)cp[j].atten > (double)cp[j].atten2)
                                    {
                                        html2.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    }
                                    else
                                    {
                                        html2.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    }

                                    html2.Append("</td>");
                                    attenFalg++;
                                    break;
                                }
                            }
                            else if (i == 5)
                            {

                                //for (int j = failFlag; j < cp.Count; j++)
                                //{

                                    html2.Append("<td>");
                                    html2.Append(row2[i]);

                                    //if ((double)cp[j].failcourse < (double)cp[j].failcourse2)
                                    //{
                                    //    html2.Append("<span style='color:green;' class='glyphicon'>&#xe093;</span>");
                                    //}
                                    //else if ((double)cp[j].failcourse == (double)cp[j].failcourse2)
                                    //{

                                    //}
                                    //else
                                    //{
                                    //    html2.Append("<span style='color:red;' class='glyphicon'>&#xe094;</span>");
                                    //}

                                    html2.Append("</td>");
                                    //failFlag++;
                                    //break;
                                //}
                            }



                            else
                            {
                                html2.Append("<td>");
                                html2.Append(row2[i]);
                                html2.Append("</td>");
                            }
                        }


                        html2.Append("</tr>");
                    }



                    //Table end.
                    html2.Append("</table>");
                    html2.Append("<tbody>");
                    //Append the HTML string to Placeholder.
                    Panel1.Controls.Add(new Literal { Text = html2.ToString() });
                }
            }
            catch (Exception ee)
            {
                Response.Redirect("~/UI/Error.aspx");
            }
            


            //******************

                
            }





        protected void btnLogOut_Click(object sender, EventArgs e)
        {
                 Session.RemoveAll();
               Response.Redirect("~/UI/Login.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Result.aspx?result=" + tbSearch.Text);
        }
    }
    }

