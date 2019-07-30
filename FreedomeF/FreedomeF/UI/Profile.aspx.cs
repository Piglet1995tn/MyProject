using FreedomeF.Business;
using FreedomeF.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Profile1 : System.Web.UI.Page
    {
        

        public int tab = 0;
        public void Page_Load(object sender, EventArgs e)
        {
            Label10.Text = "";
            lbNoitice.Text = "";
            Label1.Text = "";
            Label11.Text = "";
            lbResult.Text = "";
          
            upLabel.Text = "";

            try
            {
                if ((Session["account"]) == null || (Session["role"]) == null || (Session["accountID"]) == null)
            {
                Response.Redirect("~/UI/Login.aspx");
            }
            string selected = Request.QueryString["studentID"];
            string checkrole = (string)(Session["role"]);
            string account = (string)(Session["account"]);
            int staffID = (int)(Session["accountID"]);

            lbUserName.Text = account;

            if (checkrole == "HeadStaff")
            {
                divide.Visible = true;
                logCare.Visible = true;
                control.Visible = true;
                btnUpdateStaff.Visible = true;
                lbGuide.Visible = true;
                drpStaff.Visible = true;


            }
            else
            {
                divide.Visible = false;
                logCare.Visible = false;
                control.Visible = false;
                btnUpdateStaff.Visible = false;
                lbGuide.Visible = false;
                drpStaff.Visible = false;

            }
            Business.ScsBO sbo = new Business.ScsBO();
            //int staffID = (int)(Session["accountID"]);

            //ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            //ServiceReference1.Student s = ws.getStudentInf(selected);
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            List<StudentProfile> stp = new List<StudentProfile>();
            string inf = fap.GetStudentById(selected);
            stp = JsonConvert.DeserializeObject<List<StudentProfile>>(inf);
            decimal t = fap.CheckBlance(selected);


            stImage.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(fap.RetriveImage(selected));
            currrentTerm.Text = stp[0].currentTermNo;
            finance.Text = t.ToString("00.##" + "VND");
            dob.Text = stp[0].dateOfBirth.ToString("dd/MM/yyyy");
            addr.Text = stp[0].address;
            name.Text = stp[0].fullName;
            rollnumb.Text = stp[0].rollNumber;
            phonenumb.Text = stp[0].phone;
            mail.Text = stp[0].email;
            curr.Text = stp[0].batch;
            member.Text = stp[0].membercode;
            ktx.Text = stp[0].termPaid;
            dateofissue.Text = stp[0].dateOfIsue.ToString("dd/MM/yyyy");
            major.Text = stp[0].major;
            mode.Text = stp[0].chuuyenNganh;
            status.Text = stp[0].statusCode;
            limit7year.Text = stp[0].HanBayNam;
            dropout.Text = stp[0].QD_ThoiHoc;
            changeCampus.Text = stp[0].QD_BaoLuu_Exchange;
            changeMajor.Text = stp[0].qd_chuyennganh;
            getDiscipline.Text = stp[0].qD_kyluat;
            gruadation.Text = stp[0].qD_Tn;
            svcq.Text = stp[0].QD_SV_ChinhQuy;
            rejoin.Text = stp[0].qD_rejoin;
            contact.Text = stp[0].parentPhone;
            parent.Text = stp[0].parentName;

            if (!Page.IsPostBack)
            {
                string currentSemester = "Spring2018";
                RankDAL rdal = new RankDAL();
                //Comment cm = sbo.getComment(selected);
                StatusCheck stk = sbo.loadTickCheckProfile(selected);
                Rank r = rdal.loadRank(selected, currentSemester);

                Student st = sbo.loadTakecareStaff(selected);
                if (!string.IsNullOrEmpty(st.StaffName))
                {
                    drpStaff.SelectedValue = st.StaffName;

                }
                else
                {
                    Label24.Text = "Chưa có người chăm sóc , vui lòng chọn NV";
                }


                //TextArea1.Value = cm.content+"  bởi  "+cm.staffName;
                drpChangeRank.SelectedValue = r.rank;

                cbAttent.Checked = stk.attention;

            }




            Series series = Chart1.Series["Series1"];


            List<GpaTerm> list = sbo.listGpa(selected);
            Chart1.ChartAreas[0].AxisY.Title = "Điểm trung bình (GPA)";

            for (int i = 0; i < list.Count; i++)
            {

                series.Points.AddXY(list[i].semester.ToString(), Math.Round(list[i].gpa, 2));
                series.ToolTip = " #VALX  #VALY";



            }

            List<BehaviorTerm> beList = sbo.beList(selected);
            Series series2 = Chart2.Series["Series2"];
            Chart2.ChartAreas[0].AxisY.Title = "Điểm hành vi (Behavior)";
            for (int b = 0; b < beList.Count; b++)
            {
                series2.Points.AddXY(beList[b].semester.ToString(), Math.Round(beList[b].behavior, 2));
                series2.ToolTip = " #VALX  #VALY";
            }


            List<Curricurlum> listFail = new List<Curricurlum>();
            string failcourse = fap.getFailCourse(selected);
            if(!failcourse.Equals("Data not found"))
            {
                listFail = JsonConvert.DeserializeObject<List<Curricurlum>>(failcourse);
            }
            
            for (int f = 0; f < listFail.Count; f++)
            {
                pnStudy.Controls.Add(new LiteralControl(listFail[f].subjectCode + "</br>"));

            }
            this.lbFailnumb.Text = listFail.Count.ToString();

            //**********************
            //string currentSemester = "Spring2018";
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            ServiceReference1.ArrayOfGetTeacherComment flist = ws.getCommentBehavior(selected);
            for (int be = 0; be < flist.Count; be++)
            {
                Panel3.Controls.Add(new LiteralControl(flist[be].contentComment + "  " + flist[be].teacherID + "</br>"));
            }
            //*****************

            DataTable dt = sbo.curriculum(selected);

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table id='curi' class='table table-hover'>");
            html.Append("<thead>");
            //Building the Header row.
            html.Append("<tr class='info'>");
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
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");
            html.Append("</tbody>");
            //Append the HTML string to Placeholder.
            Panel1.Controls.Add(new Literal { Text = html.ToString() });

            //***************************************

            DataTable dt2 = sbo.getTimetable(selected);

            //Building an HTML string.
            StringBuilder html2 = new StringBuilder();

            //Table start.
            html2.Append("<table id='time' class='table table-hover'>");
            html2.Append("<thead>");
            //Building the Header row.
            html2.Append("<tr class='info'>");
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
            foreach (DataRow row2 in dt2.Rows)
            {
                html2.Append("<tr>");
                foreach (DataColumn column2 in dt2.Columns)
                {
                    html2.Append("<td>");
                    html2.Append(row2[column2.ColumnName]);
                    html2.Append("</td>");
                }
                html2.Append("</tr>");
            }

            //Table end.
            html2.Append("</table>");
            html2.Append("</tbody>");
            //Append the HTML string to Placeholder.
            scheduleStudy.Controls.Add(new Literal { Text = html2.ToString() });

            //********************************************************

            DataTable dt3 = sbo.scheduleExam(selected);

            //Building an HTML string.
            StringBuilder html3 = new StringBuilder();

            //Table start.
            html3.Append("<table id='exam' class='table table-hover'>");
            html3.Append("<thead>");
            //Building the Header row.
            html3.Append("<tr class='info'>");
            foreach (DataColumn column3 in dt3.Columns)
            {
                html3.Append("<th>");
                html3.Append(column3.ColumnName);
                html3.Append("</th>");
            }
            html3.Append("</tr>");
            html3.Append("</thead>");
            html3.Append("<tbody>");
            //Building the Data rows.
            foreach (DataRow row3 in dt3.Rows)
            {
                html3.Append("<tr>");
                foreach (DataColumn column3 in dt3.Columns)
                {
                    html3.Append("<td>");
                    html3.Append(row3[column3.ColumnName]);
                    html3.Append("</td>");
                }
                html3.Append("</tr>");
            }

            //Table end.
            html3.Append("</table>");
            html3.Append("</tbody>");
            //Append the HTML string to Placeholder.
            scheduleExam.Controls.Add(new Literal { Text = html3.ToString() });
                //grOtherComment.DataBind();

            }
            catch (Exception ee)
            {
                Response.Redirect("~/UI/Error.aspx");
            }
        }


        protected void btnUpdateRank_Click(object sender, EventArgs e)
        {

            tab = 3;
            string selected = Request.QueryString["studentID"];
            Business.ScsBO sbo = new Business.ScsBO();
            Rank rt = new Rank();
            rt.studentID = selected;
            rt.rank = drpChangeRank.SelectedValue;
            RankDAL rdal = new RankDAL();

            rdal.isUpdateRank(rt.studentID, rt.rank);
            lbNoitice.Text = "Cập nhật thành công !";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddComment_Click(object sender, EventArgs e)

        {

            Business.ScsBO sb = new Business.ScsBO();
            StaffDAL stdal = new StaffDAL();
            tab = 3;
            string selected = Request.QueryString["studentID"];
            int staffID = (int)(Session["accountID"]);
            if (this.comment.Value != "")
            {


                if (FileUploadSave.HasFile)
                {
                    string imagefile = Path.GetFileName(FileUploadSave.PostedFile.FileName);
                    int fileSize = FileUploadSave.PostedFile.ContentLength;
                    if (fileSize < 409600)
                    {
                        if (sb.canUpfile(imagefile))
                        {
                            FileUploadSave.SaveAs(Server.MapPath("~/Images/") + FileUploadSave.PostedFile.FileName);
                            //sbo.insertFile(imagefile, "Images/" + imagefile, selected, staffID);
                            stdal.insertComment(selected, comment.Value, staffID.ToString(), imagefile);
                            //upLabel.Text = "Tải lên thành công!";
                            //grMyComment.DataBind();
                        }
                        else
                        {
                            Label1.Text = "File tải lên trùng tên !";
                        }

                    }
                    else
                    {
                        Label1.Text = "File tải lên không quá 4MB !";
                    }


                }
                else
                {
                    stdal.insertComment(selected, comment.Value, staffID.ToString(), "");
                }

                Label10.Text = "Thêm nhận xét thành công !";
                grMyComment.DataBind();
            }
            else if (FileUploadSave.HasFile)
            {

                string imagefile = Path.GetFileName(FileUploadSave.PostedFile.FileName);
                int fileSize = FileUploadSave.PostedFile.ContentLength;
                if (fileSize < 409600)
                {
                    if (sb.canUpfile(imagefile))
                    {
                        FileUploadSave.SaveAs(Server.MapPath("~/Images/") + FileUploadSave.PostedFile.FileName);
                        //sbo.insertFile(imagefile, "Images/" + imagefile, selected, staffID);
                        stdal.insertComment(selected, comment.Value, staffID.ToString(), imagefile);
                        upLabel.Text = "Tải lên thành công!";
                        grMyComment.DataBind();
                    }
                    else
                    {
                        Label1.Text = "File tải lên trùng tên !";
                    }
                }
                else
                {
                    Label1.Text = "File tải lên không quá 4MB !";
                }
            }
            else
            {
                Label11.Text = "Lỗi !";
            }


        }

        //protected void Button6_Click(object sender, EventArgs e)
        //{
        //    string selected = Request.QueryString["studentID"];
        //    Response.Redirect("~/UI/Detail.aspx?detail=" + selected);
        //}



        protected void Button7_Click(object sender, EventArgs e)
        {
            string selected = Request.QueryString["studentID"];
            Response.Redirect("~/UI/Timetable.aspx?detail=" + selected);
        }


        protected void cbAttent_CheckedChanged(object sender, EventArgs e)
        {
            StaffDAL stdal = new StaffDAL();
            string selected = Request.QueryString["studentID"];
            Business.ScsBO sbo = new Business.ScsBO();
            if (cbAttent.Checked == false)
            {
                stdal.insertAttent(selected, 0);

            }
            else
            {
                stdal.insertAttent(selected, 1);

            }

        }


        protected void cbRemove_CheckedChanged(object sender, EventArgs e)
        {
            StaffDAL stdal = new StaffDAL();
            string selected = Request.QueryString["studentID"];
            Business.ScsBO sbo = new Business.ScsBO();
            if (cbRemove.Checked == false)
            {
                stdal.insertTakecareStatus(selected, 0);

            }
            else
            {
                stdal.insertTakecareStatus(selected, 1);

            }
        }

        protected void btnUpdateStaff_Click(object sender, EventArgs e)
        {
            StaffDAL stdal = new StaffDAL();
            tab = 3;
            string selected = Request.QueryString["studentID"];
            Business.ScsBO sbo = new Business.ScsBO();
            stdal.isUpdateStaffName(selected, drpStaff.SelectedValue);
            lbResult.Text = "Cập nhật thành công";
        }

        protected void rdComment_SelectedIndexChanged(object sender, EventArgs e)
        {
            StaffDAL stdal = new StaffDAL();
            tab = 3;
            string selected = Request.QueryString["studentID"];
            int staffID = (int)(Session["accountID"]);
            Business.ScsBO sb = new Business.ScsBO();

            stdal.insertComment(selected, rdComment.SelectedValue, staffID.ToString(), "");
            Label10.Text = "Thêm nhận xét thành công!";
            grMyComment.DataBind();
        }


        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }

        protected void ButSave_Click(object sender, EventArgs e)
        {
            StaffDAL stdal = new StaffDAL();
            tab = 3;
            string selected = Request.QueryString["studentID"];
            int staffID = (int)(Session["accountID"]);
            Business.ScsBO sbo = new Business.ScsBO();

            if (FileUploadSave.HasFile)
            {
                string imagefile = Path.GetFileName(FileUploadSave.PostedFile.FileName);
                if (sbo.canUpfile(imagefile))
                {
                    FileUploadSave.SaveAs(Server.MapPath("~/Images/") + FileUploadSave.PostedFile.FileName);
                    //sbo.insertFile(imagefile, "Images/" + imagefile, selected, staffID);
                    stdal.insertComment(selected, "", staffID.ToString(), imagefile);
                    upLabel.Text = "Tải lên thành công!";
                    grMyComment.DataBind();
                }
                else
                {
                    Label1.Text = "File tải lên trùng tên !";
                }
            }
            else
            {
                Label1.Text = "Lỗi ";
            }

        }


        protected void grMyComment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            tab = 3;
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Images/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void grOtherComment_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            tab = 3;
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Images/") + e.CommandArgument);
                Response.End();
            }
        }
        protected void grShowAllComment_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            tab = 3;
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Images/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            tab = 3;
            string selected = Request.QueryString["studentID"];
            grMyComment.Visible = false;
            grOtherComment.Visible = false;
            Business.ScsBO sbo = new Business.ScsBO();
            DataTable dt = new DataTable();
            dt = sbo.searchComment(selected, tbSearch.Text);
            grShowAllComment.DataSourceID = null;
            grShowAllComment.DataSource = dt;
            grShowAllComment.DataBind();
            lbResult.Text = dt.Rows.Count + " " + "Kết Quả Tìm Kiếm";



        }

        protected void btnAllComment_Click(object sender, EventArgs e)
        {
            tab = 3;
            grMyComment.Visible = true;
            grOtherComment.Visible = true;
            grShowAllComment.Visible = false;
            lbResult.Visible = false;
        }


    }
}