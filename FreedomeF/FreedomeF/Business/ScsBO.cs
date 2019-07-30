using FreedomeF.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using Newtonsoft.Json;
using System.Globalization;

namespace FreedomeF.Business
{
    public class ScsBO
    {
        private List<Compare> compareForHead;
        private List<Compare> compare;
        public Staff login(string mail)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT accountID,account,role,staffName,status FROM Account WHERE account=@account";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("account", SqlDbType.NVarChar);
            cmd.Parameters["account"].Value = mail;
            SqlDataReader dr = cmd.ExecuteReader();
            Entity.Staff st = null;
            dr.Read();
            st = new Entity.Staff();
            if (dr.HasRows)
            {

                st.accountID = (int)dr["accountID"];
                st.account = dr["account"].ToString();
                st.role = dr["role"].ToString();
                st.staffName = dr["staffName"].ToString();
                st.status = dr["status"].ToString();
                dr.Close();
            }
            else
            {
                return null;
            }

            con.Close();
            return st;
        }
        public bool canAddStaffName(string username)
        {
            bool canAdd = false;

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT staffName FROM Account WHERE account = @account";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("account", SqlDbType.VarChar);
            cmd.Parameters["account"].Value = username;
            SqlDataReader dr = cmd.ExecuteReader();
            canAdd = !dr.HasRows;
            con.Close();
            return canAdd;
        }
        public List<StatusCheck> loadCheck()
        {
            List<StatusCheck> stl = new List<StatusCheck>();
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = " SELECT studentID,status From Rank ";
            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataReader dr = cmd.ExecuteReader();
            StatusCheck stk = null;
            while (dr.Read())
            {
                stk = new StatusCheck();
                stk.studentID = dr["studentID"].ToString();
                stk.attention = (bool)dr["status"];
                stl.Add(stk);

            }
            con.Close();
            return stl;

        }


        public StatusCheck loadTickCheckProfile(string studentID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "select status from Rank WHERE studentID=@studentID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            SqlDataReader dr = cmd.ExecuteReader();
            StatusCheck stk = null;
            dr.Read();

            stk = new StatusCheck();
            stk.attention = (bool)dr["status"];

            con.Close();
            return stk;

        }


        //public List<Comment> getAccountIDComment(string studentID)
        //{
        //    List<Comment> list = new List<Comment>();
        //    SqlConnection con = DbConnect.GetConnection();
        //    con.Open();
        //    string sql = "select accountID from Comment Where studentID=@studentID ";
        //    SqlCommand cmd = new SqlCommand(sql, con);
        //    cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
        //    cmd.Parameters["studentID"].Value = studentID;
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    Comment cm = null;
        //    while (dr.Read())
        //    {
        //        cm = new Comment();
        //        cm.accountID = (Int32)dr["accountID"];
        //        list.Add(cm);
        //    }

        //    con.Close();
        //    return list;
        //}










        //*********************************************************

        public DataTable scheduleExam(string studentID)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Ngày");
            dt.Columns.Add("Phòng");
            dt.Columns.Add("Môn thi");
            dt.Columns.Add("Giờ thi");
            dt.Columns.Add("Note");
            dt.Columns.Add("Kì thi");
            dt.Columns.Add("Công bố điểm");
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();

            List<Schedule> Sche = new List<Schedule>();
            string exam =fap.getscheduleExam(studentID, DateTime.ParseExact("01/04/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture));
            if (exam.Equals("Data not found"))
            {
                return dt;
            }
            Sche = JsonConvert.DeserializeObject<List<Schedule>>(exam);
            
            for (int i = 0; i < Sche.Count; i++)
            {
                var ds = dt.NewRow();
                ds["Mssv"] = Sche[i].rollNumber;
                ds["Ngày"] = Sche[i].date;
                ds["Phòng"] = Sche[i].roomNo;
                ds["Môn thi"] = Sche[i].realSubject;
                ds["Giờ thi"] = Sche[i].giothi;
                ds["Note"] = Sche[i].note;
                ds["Kì thi"] = Sche[i].kythi;
                ds["Công bố điểm"] = Sche[i].dateMark;
                dt.Rows.Add(ds);


            }
            return dt;
        }
        public DataTable getTimetable(string studentID)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mã môn");
            dt.Columns.Add("Lớp");
            dt.Columns.Add("Ngày");
            
            dt.Columns.Add("Trạng thái");
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            DateTime tm;
            DateTime today = DateTime.ParseExact("01/06/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture);// Convert.ToDateTime("01/06/2018");

            for (int td = 0; td < 6; td++)
            {
                tm = today.AddDays(+td);

            }

            string t = fap.getTimeTable(studentID, today, today.AddDays(+7));
            if(t.Equals("Data not found"))
            {
                return dt;
            }
            List<Timetable> ttable = new List<Timetable>();
            ttable = JsonConvert.DeserializeObject<List<Timetable>>(t);
           for(int i = 0; i < ttable.Count; i++)
            {

            
                var ds = dt.NewRow();
                ds["Mã môn"] = ttable[i].subjectCode.ToString();
                ds["Lớp"] = ttable[i].groupName.ToString();
                ds["Ngày"] = ttable[i].date.ToString("dd/MM/yy");
              
                ds["Trạng thái"] = ttable[i].status.ToString();
                dt.Rows.Add(ds);
                }
            
            return dt;
        }



        public DataTable updateNotes()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Nội dung");
            dt.Columns.Add("Tên file");
            dt.Columns.Add("Thời gian");
            dt.Columns.Add("Nhân viên");
            dt.Columns.Add("Hành động");
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  select distinct ThongKeComment.studentID,ThongKeComment.content,ThongKeComment.fileName,ThongKeComment.date,Account.staffName,ThongKeComment.action"
  + " from ThongKeComment, Account, Comment"
  + " where Comment.accountID = Account.accountID and ThongKeComment.commentID=Comment.commentID order by ThongKeComment.date desc";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var ds = dt.NewRow();
                ds["Mssv"] = dr["studentID"].ToString();
                ds["Nội dung"] = dr["content"].ToString();
                ds["Tên file"] = dr["fileName"].ToString();
                ds["Thời gian"] = dr["date"].ToString();
                ds["Nhân viên"] = dr["staffName"].ToString();
                ds["Hành động"] = dr["action"].ToString();
                dt.Rows.Add(ds);

            }
            return dt;

        }

        public DataTable Search(string keyword)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = " Select Student.studentID,Student.studentName,Rank.rankName,Comment.content,Comment.date From Student "
            + " LEFT JOIN Rank ON Student.studentID = Rank.studentID"
            + " LEFT JOIN Comment ON Student.studentID = Comment.studentID"
            + " WHERE Student.studentID LIKE  " + " '%" + keyword + "%' " + " OR Student.studentName LIKE " + " N'%" + keyword + "%' " + " OR Comment.content LIKE " + " N'%" + keyword + "%' " + " OR Rank.rankName LIKE " + " N'%" + keyword + "%'";

            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataTable searchComment(string studentID, string keyword)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT Comment.content , Comment.fileName ,Comment.date, Account.staffName From Comment"
            + " LEFT JOIN Account ON Comment.accountID = Account.accountID WHERE Comment.studentID = @studentID OR Comment.content LIKE" + " N'%" + keyword + "%'" + " OR Comment.fileName LIKE " + " N'%" + keyword + "%'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }






        public Entity.Student loadTakecareStaff(string studentID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT Student.studentID, Account.accountID"
            + " FROM Student"
            + " LEFT JOIN Account ON Student.accountID = Account.accountID where Student.studentID = @studentID"
            + " ORDER BY Student.studentID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            SqlDataReader dr = cmd.ExecuteReader();
            Entity.Student st = null;
            if (dr.Read())
            {
                st = new Entity.Student();
                st.rollNumber = dr["studentID"].ToString();
                st.StaffName = dr["accountID"].ToString();


            }
            dr.Close();
            con.Close();

            return st;
        }
        public bool canUpfile(string fileName)
        {
            bool canAdd = false;

            SqlConnection con = DbConnect.GetConnection();
            string sql = "SELECT * FROM Comment WHERE fileName= @fileName";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("fileName", SqlDbType.NVarChar);
            cmd.Parameters["fileName"].Value = fileName;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            canAdd = !dr.HasRows;
            con.Close();
            return canAdd;
        }




        //public DataTable tableLisTOldStudent()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("Mssv");
        //    dt.Columns.Add("Người Takecare");
        //    List<OldListTakecare> list = getOldStudent();
        //    for (int i = 0; i < list.Count; i++)
        //    {

        //        var dr = dt.NewRow();
        //        dr["Mssv"] = list[i].studentID;
        //        dr["Người Takecare"] = list[i].staffName;

        //        dt.Rows.Add(dr);
        //    }
        //    return dt;
        //}

        public DataTable tableDistri()
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  SELECT TOP 10 Student.studentID,Account.staffName ,Rank.rankName "
            + "FROM Student"
            + "  LEFT JOIN Account"
            + "  ON Account.accountID = Student.accountID"
            + "  LEFT JOIN Rank ON Student.studentID = Rank.studentID"
            + "  Where  takecareStatus = 0 AND caution = 0 ORDER BY rankName DESC";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }



        public DataTable curriculum(string studentID)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("Mã Môn");
            dt.Columns.Add("Tên Môn");
            dt.Columns.Add("Kì");

            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();

            List<Curricurlum> cur = new List<Curricurlum>();
            string fapcur = fap.getCurriculum(studentID);
            if(!fapcur.Equals("Data not found"))
            {
                cur = JsonConvert.DeserializeObject<List<Curricurlum>>(fapcur);
            }
          


            for (int j = 0; j < cur.Count; j++)
            {
                var ds = dt.NewRow();

                ds["Mã Môn"] = cur[j].subjectCode.ToString();
                ds["Tên Môn"] = cur[j].subjectName.ToString();
                ds["Kì"] = cur[j].termNo.ToString();
                dt.Rows.Add(ds);
            }




            //}
            return dt;
        }


        public DataTable todayReport(string accountID,DateTime date)
        {
            //DateTime today = DateTime.Today;

            DateTime today = DateTime.ParseExact("10/06/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture); //Convert.ToDateTime("10/06/2018");
            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Tên");
            dt.Columns.Add("Vắng mặt ngày "+""+date.ToString("dd/MM"));
            dt.Columns.Add("Báo cáo vắng mặt tuần này");
            dt.Columns.Add("Trạng thái");
            dt.Columns.Add("Nhận xét");
            dt.Columns.Add("Giảng viên");
            dt.Columns.Add("Xếp loại");
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            Rank r = null;
            StaffTakeCare stc = null;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  SELECT Student.studentID,Student.studentName ,Rank.rankName FROM Student" +
                " LEFT JOIN Rank ON Student.studentID=Rank.studentID " +
                " WHERE accountID=@accountID AND takecareStatus=0 ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters["accountID"].Value = accountID;
            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                r = new Rank() ;
                stc = new StaffTakeCare();
                stc.studentID = dr["studentID"].ToString();
                stc.studentName = dr["studentName"].ToString();
                r.rank = dr["rankName"].ToString();
                List<StudentProfile> profile = new List<StudentProfile>();
               
                string info = fap.GetStudentById(stc.studentID);
               
                profile = JsonConvert.DeserializeObject<List<StudentProfile>>(info);
                var ds = dt.NewRow();
                ds["Mssv"] = stc.studentID;
                ds["Tên"] = stc.studentName;
                List<Report> dayRp = new List<Report>();
                List<Report> weekRp = new List<Report>();
                string day = fap.getInfoToday(stc.studentID, DateTime.ParseExact(date.ToString("dd/MM/yyyy"), "dd/MM/yyyy", null));
                string week = fap.getWeeklyReport(stc.studentID, date.AddDays(-7), date);
                if (day.ToLower().Equals("data not found") && !week.ToLower().Equals("data not found"))
                {
                    weekRp = JsonConvert.DeserializeObject<List<Report>>(week);
                    string temp = "";
                    for (int k = 0; k < weekRp.Count; k++)
                    {

                        temp += weekRp[k].subjectCode.ToString() + " " + " Slot " + weekRp[k].slot.ToString() + " " + "Ngày " + weekRp[k].date.ToString("dd/MM") + "</br>";

                    }
                    ds["Báo cáo vắng mặt tuần này"] = temp;
                    ds["Trạng thái"] = profile[0].statusCode;
                    ds["Xếp loại"] = r.rank;
                    dt.Rows.Add(ds);
                    continue;
                }
                else if(!day.ToLower().Equals("data not found") && week.ToLower().Equals("data not found"))
                {
                    dayRp = JsonConvert.DeserializeObject<List<Report>>(day);
                    for (int j = 0; j < dayRp.Count; j++)
                    {

                        ds["Vắng mặt ngày " + "" + date.ToString("dd/MM")] += " " + dayRp[j].subjectCode.ToString() + " Slot " + dayRp[j].slot.ToString() + "</br>";
                        ds["Nhận xét"] += dayRp[j].comment.ToString() + "<br/>";
                        ds["Giảng viên"] += " " + dayRp[j].lecturer + "</br>";
                        ds["Trạng thái"] = profile[0].statusCode;
                        ds["Xếp loại"] = r.rank;

                    }
                    dt.Rows.Add(ds);
                    continue;

                }
                else if(day.ToLower().Equals("data not found") && week.ToLower().Equals("data not found"))
                {
                    ds["Trạng thái"] = profile[0].statusCode;
                    ds["Xếp loại"] = r.rank;
                    dt.Rows.Add(ds);
                    continue;
                }
                dayRp = JsonConvert.DeserializeObject<List<Report>>(day);
                weekRp = JsonConvert.DeserializeObject<List<Report>>(week);
                for (int j = 0; j < dayRp.Count; j++)
                {

                    ds["Vắng mặt ngày " + "" + date.ToString("dd/MM")] += " " + dayRp[j].subjectCode.ToString() + " Slot " + dayRp[j].slot.ToString() + "</br>";
                    ds["Nhận xét"] +=  dayRp[j].comment.ToString() + "<br/>";
                    ds["Giảng viên"] += " " + dayRp[j].lecturer + "</br>";
                    ds["Xếp loại"] = r.rank;

                }


                for (int k = 0; k < weekRp.Count; k++)
                {
                    ds["Báo cáo vắng mặt tuần này"] += weekRp[k].subjectCode.ToString() + " " + " Slot " + weekRp[k].slot.ToString() + " " + "Ngày " + weekRp[k].date.ToString("dd/MM") + "</br>";

                }



                ds["Trạng thái"] = profile[0].statusCode;

                ds["Xếp loại"] = r.rank;

                dt.Rows.Add(ds);
            }
            return dt;
        }
       
        public DataTable todayReportForHead( DateTime date)
        {
            //DateTime today = DateTime.Today;

            DateTime today = DateTime.ParseExact("10/06/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture); //Convert.ToDateTime("10/06/2018");
            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Tên");
            dt.Columns.Add("Vắng mặt ngày " + "" + date.ToString("dd/MM"));
            dt.Columns.Add("Báo cáo vắng mặt tuần này");
            dt.Columns.Add("Trạng thái");
            dt.Columns.Add("Nhận xét");
            dt.Columns.Add("Giảng viên");
            dt.Columns.Add("Xếp loại");
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();

            StaffTakeCare stc = null;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "   SELECT TOP 10 Student.studentID ,Student.studentName,Rank.rankName FROM Student LEFT JOIN Rank ON Student.studentID=Rank.studentID WHERE takecareStatus=0  AND caution=0 ORDER BY rankName DESC";
            SqlCommand cmd = new SqlCommand(sql, con);
            
            SqlDataReader dr = cmd.ExecuteReader();
            Rank r = null;

            while (dr.Read())
            {
                r = new Rank();
                stc = new StaffTakeCare();
                stc.studentID = dr["studentID"].ToString();
                stc.studentName = dr["studentName"].ToString();
                r.rank = dr["rankName"].ToString();
                List<StudentProfile> profile = new List<StudentProfile>();

                string info = fap.GetStudentById(stc.studentID);

                profile = JsonConvert.DeserializeObject<List<StudentProfile>>(info);
                var ds = dt.NewRow();
                ds["Mssv"] = stc.studentID;
                ds["Tên"] = stc.studentName;
                List<Report> dayRp = new List<Report>();
                List<Report> weekRp = new List<Report>();
                string day = fap.getInfoToday(stc.studentID, DateTime.ParseExact(date.ToString("dd/MM/yyyy"), "dd/MM/yyyy", null) );
                string week = fap.getWeeklyReport(stc.studentID, date.AddDays(-7), date);
                if (day.ToLower().Equals("data not found") && !week.ToLower().Equals("data not found"))
                {
                    weekRp = JsonConvert.DeserializeObject<List<Report>>(week);
                    string temp = "";
                    for (int k = 0; k < weekRp.Count; k++)
                    {

                        temp += weekRp[k].subjectCode.ToString() + " " + " Slot " + weekRp[k].slot.ToString() + " " + "Ngày " + weekRp[k].date.ToString("dd/MM") + "</br>";

                    }
                    ds["Báo cáo vắng mặt tuần này"] = temp;
                    ds["Trạng thái"] = profile[0].statusCode;
                    ds["Xếp loại"] = r.rank;
                    dt.Rows.Add(ds);
                    continue;
                }
                else if (!day.ToLower().Equals("data not found") && week.ToLower().Equals("data not found"))
                {
                    dayRp = JsonConvert.DeserializeObject<List<Report>>(day);
                    for (int j = 0; j < dayRp.Count; j++)
                    {

                        ds["Vắng mặt ngày " + "" + date.ToString("dd/MM")] += " " + dayRp[j].subjectCode.ToString() + " Slot " + dayRp[j].slot.ToString() + "</br>";
                        ds["Nhận xét"] += dayRp[j].comment.ToString() + "<br/>";
                        ds["Giảng viên"] += " " + dayRp[j].lecturer + "</br>";
                        ds["Trạng thái"] = profile[0].statusCode;
                        ds["Xếp loại"] = r.rank;
                    }
                    dt.Rows.Add(ds);
                    continue;

                }
                else if (day.ToLower().Equals("data not found") && week.ToLower().Equals("data not found"))
                {
                    ds["Trạng thái"] = profile[0].statusCode;
                    ds["Xếp loại"] = r.rank;
                    dt.Rows.Add(ds);
                    continue;
                }
                dayRp = JsonConvert.DeserializeObject<List<Report>>(day);
                weekRp = JsonConvert.DeserializeObject<List<Report>>(week);
                for (int j = 0; j < dayRp.Count; j++)
                {

                    ds["Vắng mặt ngày " + "" + date.ToString("dd/MM")] += " " + dayRp[j].subjectCode.ToString() + " Slot " + dayRp[j].slot.ToString() + "</br>";
                    ds["Nhận xét"] += dayRp[j].comment.ToString() + "<br/>";
                    ds["Giảng viên"] += " " + dayRp[j].lecturer + "</br>";

                }


                for (int k = 0; k < weekRp.Count; k++)
                {
                    ds["Báo cáo vắng mặt tuần này"] += weekRp[k].subjectCode.ToString() + " " + " Slot " + weekRp[k].slot.ToString() + " " + "Ngày " + weekRp[k].date.ToString("dd/MM") + "</br>";

                }



                ds["Trạng thái"] = profile[0].statusCode;

                ds["Xếp loại"] = r.rank;

                dt.Rows.Add(ds);
            }
            return dt;
        }


       public List<BehaviorTerm> beList(string studentID)
        {
            List<BehaviorTerm> beList = new List<BehaviorTerm>();
            string currentSemester = "Spring2018";
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            double behavior = ws.getBehaviorMark(studentID, currentSemester).behaviorMark;
            double behavior2 = ws.getBehaviorMark(studentID, previousTerm(currentSemester)).behaviorMark;
            
            beList.Add(new BehaviorTerm(behavior2, previousTerm(currentSemester)));
            beList.Add(new BehaviorTerm(behavior, currentSemester));
            return beList;
        }

        public DataTable myStudent(int accountID)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Tên");
            dt.Columns.Add("GPA");
            dt.Columns.Add("Hành vi");
            dt.Columns.Add("Điểm danh");
            dt.Columns.Add("Môn nợ");
            dt.Columns.Add("Xếp loại");
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            StaffTakeCare stc = null;
            RankDAL rdl = new RankDAL();
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  SELECT  Student.studentID,Student.studentName FROM Student LEFT JOIN Rank ON Student.studentID=Rank.studentID WHERE accountID=@accountID AND takecareStatus=0 ";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters["accountID"].Value = accountID;
            SqlDataReader dr = cmd.ExecuteReader();
            this.compare = new List<Compare>();
            while (dr.Read())
            {
                Compare xx = null;
                stc = new StaffTakeCare();
                stc.studentID = dr["studentID"].ToString();
                stc.studentName = dr["studentName"].ToString();


                string currentSemester = "Spring2018";
                //FreedomeF.ServiceReference1.Failcourse[] flist = ws.getFailcourse(r.studentID, ws.getCurrentSemester(r.studentID));
                List<Curricurlum> listFail = new List<Curricurlum>();
                string fail = fap.getFailCourse(stc.studentID);
                string pass = fap.getPassCourse(stc.studentID);
                List<Curricurlum> listPass = new List<Curricurlum>();
                if (!pass.Equals("Data not found"))
                {
                    listPass = JsonConvert.DeserializeObject<List<Curricurlum>>(pass);
                }
                listFail = JsonConvert.DeserializeObject<List<Curricurlum>>(fail);


                List<Gpa> gpaList = new List<Gpa>();
                string t2 = fap.getGPA(stc.studentID, currentSemester);

                if (!t2.Equals("Data not found"))
                {
                    gpaList = JsonConvert.DeserializeObject<List<Gpa>>(t2);
                }
                int totalCredit = 0;
                double avg = 0;

                for (int j = 0; j < gpaList.Count; j++)
                {
                    double temp = 0;
                    if (gpaList[j].averageMark != null)
                    {
                        temp = gpaList[j].credits * (double)gpaList[j].averageMark;
                    }
                    if (temp > 0)
                    {
                        totalCredit += gpaList[j].credits;
                        avg += temp;
                    }
                }

                double gpa = Math.Round(((double)avg) / ((double)totalCredit), 2);
               int failcourse = listFail.Count;

                double behavior = ws.getBehaviorMark(stc.studentID, currentSemester).behaviorMark;

                List<Curricurlum> attenList = new List<Curricurlum>();
                string t = fap.getAttendanceMark(stc.studentID, currentSemester);
                attenList = JsonConvert.DeserializeObject<List<Curricurlum>>(t);

                int totalAbsent = 0;
                for (int i = 0; i < attenList.Count; i++)
                {
                    totalAbsent += attenList[i].absentTotal;
                }


                double atten = Math.Round(((double)(attenList.Count * 30) - totalAbsent) / ((double)attenList.Count * 30), 2)*10;
                var ds = dt.NewRow();
                ds["Mssv"] = stc.studentID;
                ds["Tên"] = stc.studentName;
                ds["GPA"] = gpa;
                ds["Hành vi"] = behavior;
                ds["Điểm danh"] = atten;
                ds["Môn nợ"] = failcourse;

                Rank rk = new Rank();


                rk = rdl.loadRank(stc.studentID, currentSemester);
                ds["Xếp loại"] = rk.rank;
                //}
                dt.Rows.Add(ds);



                // compare previous semerter 
                List<Gpa> gpaList2 = new List<Gpa>();
                string getGpa2 = fap.getGPA(stc.studentID, previousTerm(currentSemester));
                gpaList2 = JsonConvert.DeserializeObject<List<Gpa>>(getGpa2);
                int totalCredit2 = 0;
                double avg2 = 0;

                for (int k = 0; k < gpaList2.Count; k++)
                {
                    double temp2 = 0;
                    if (gpaList2[k].averageMark != null)
                    {
                        temp2 = gpaList2[k].credits * (double)gpaList2[k].averageMark;
                    }
                    if (temp2 > 0)
                    {
                        totalCredit2 += gpaList2[k].credits;
                        avg2 += temp2;
                    }
                }

                double gpa2 = ((double)avg2) / ((double)totalCredit2);
                double behavior2 = ws.getBehaviorMark(stc.studentID.ToString(), previousTerm(currentSemester)).behaviorMark;

                List<Curricurlum> attenList2 = new List<Curricurlum>();
                string attent2 = fap.getAttendanceMark(stc.studentID, previousTerm(currentSemester));
                attenList2 = JsonConvert.DeserializeObject<List<Curricurlum>>(attent2);

                int totalAbsent2 = 0;
                for (int f = 0; f < attenList2.Count; f++)
                {
                    totalAbsent2 += attenList2[f].absentTotal;
                }

                double atten2 = (((double)(attenList2.Count * 30) - totalAbsent2) / ((double)attenList2.Count * 30))*10;
                xx = new Compare();
                xx.gpa = gpa;
                xx.gpa2 = gpa2;
                xx.behavior = behavior;
                xx.behavior2 = behavior2;
                xx.atten = atten;
                xx.atten2 = atten2;
                xx.failcourse = failcourse;
                xx.failcourse2 = failcourse;
                this.compare.Add(xx);
            }
            return dt;
        }
       
        public DataTable myStudentForHead()
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Tên");
            dt.Columns.Add("GPA");
            dt.Columns.Add("Hành vi");
            dt.Columns.Add("Điểm danh");
            dt.Columns.Add("Môn nợ");
            dt.Columns.Add("Xếp loại");
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            StaffTakeCare stc = null;
            RankDAL rdl = new RankDAL();
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT TOP 10 Student.studentID,Student.studentName FROM Student LEFT JOIN Rank ON Student.studentID=Rank.studentID WHERE takecareStatus=0  AND caution=0 ORDER BY rankName DESC";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            this.compareForHead = new List<Compare>();
            while (dr.Read())
            {
                Compare xx = null;
                stc = new StaffTakeCare();
                stc.studentID = dr["studentID"].ToString();
                stc.studentName = dr["studentName"].ToString();


                string currentSemester = "Spring2018";
                //FreedomeF.ServiceReference1.Failcourse[] flist = ws.getFailcourse(r.studentID, ws.getCurrentSemester(r.studentID));
                List<Curricurlum> listFail = new List<Curricurlum>();
                string fail = fap.getFailCourse(stc.studentID);
                string pass = fap.getPassCourse(stc.studentID);
                List<Curricurlum> listPass = new List<Curricurlum>();
                listPass = JsonConvert.DeserializeObject<List<Curricurlum>>(pass);
                listFail = JsonConvert.DeserializeObject<List<Curricurlum>>(fail);


                List<Gpa> gpaList = new List<Gpa>();
                string t2 = fap.getGPA(stc.studentID, currentSemester);
                gpaList = JsonConvert.DeserializeObject<List<Gpa>>(t2);
                int totalCredit = 0;
                double avg = 0;

                for (int j = 0; j < gpaList.Count; j++)
                {
                    double temp = 0;
                    if (gpaList[j].averageMark != null)
                    {
                        temp = gpaList[j].credits * (double)gpaList[j].averageMark;
                    }
                    if (temp > 0)
                    {
                        totalCredit += gpaList[j].credits;
                        avg += temp;
                    }
                }

                double gpa = Math.Round(((double)avg) / ((double)totalCredit),2);
                int failcourse = listFail.Count;

                double behavior = ws.getBehaviorMark(stc.studentID, currentSemester).behaviorMark;

                List<Curricurlum> attenList = new List<Curricurlum>();
                string t = fap.getAttendanceMark(stc.studentID, currentSemester);
                attenList = JsonConvert.DeserializeObject<List<Curricurlum>>(t);

                int totalAbsent = 0;
                for (int i = 0; i < attenList.Count; i++)
                {
                    totalAbsent += attenList[i].absentTotal;
                }


                double atten = Math.Round(((double)(attenList.Count * 30) - totalAbsent) / ((double)attenList.Count * 30),2)*10;
                var ds = dt.NewRow();
                ds["Mssv"] = stc.studentID;
                ds["Tên"] = stc.studentName;
                ds["GPA"] = gpa;
                ds["Hành vi"] = behavior;
                ds["Điểm danh"] = atten;
                ds["Môn nợ"] = failcourse;

                Rank rk = new Rank();


                rk = rdl.loadRank(stc.studentID, currentSemester);
                ds["Xếp loại"] = rk.rank;
                //}
                dt.Rows.Add(ds);



                // compare previous semerter 
                List<Gpa> gpaList2 = new List<Gpa>();
                string getGpa2 = fap.getGPA(stc.studentID, previousTerm(currentSemester));
                gpaList2 = JsonConvert.DeserializeObject<List<Gpa>>(getGpa2);
                int totalCredit2 = 0;
                double avg2 = 0;

                for (int k = 0; k < gpaList2.Count; k++)
                {
                    double temp2 = 0;
                    if (gpaList2[k].averageMark != null)
                    {
                        temp2 = gpaList2[k].credits * (double)gpaList2[k].averageMark;
                    }
                    if (temp2 > 0)
                    {
                        totalCredit2 += gpaList2[k].credits;
                        avg2 += temp2;
                    }
                }

                double gpa2 = ((double)avg2) / ((double)totalCredit2);
                double behavior2 = ws.getBehaviorMark(stc.studentID.ToString(), previousTerm(currentSemester)).behaviorMark;

                List<Curricurlum> attenList2 = new List<Curricurlum>();
                string attent2 = fap.getAttendanceMark(stc.studentID, previousTerm(currentSemester));
                attenList2 = JsonConvert.DeserializeObject<List<Curricurlum>>(attent2);

                int totalAbsent2 = 0;
                for (int f = 0; f < attenList2.Count; f++)
                {
                    totalAbsent2 += attenList2[f].absentTotal;
                }

                double atten2 = (((double)(attenList2.Count * 30) - totalAbsent2) / ((double)attenList2.Count * 30))*10;
                xx = new Compare();
                xx.gpa = gpa;
                xx.gpa2 = gpa2;
                xx.behavior = behavior;
                xx.behavior2 = behavior2;
                xx.atten = atten;
                xx.atten2 = atten2;
                xx.failcourse = failcourse;
                xx.failcourse2 = failcourse;
                this.compareForHead.Add(xx);
            }
            return dt;
        }

      public List<GpaTerm> listGpa(string studentID)
        {
            GpaTerm gpt = new GpaTerm();
            List<GpaTerm> listGpa = new List<GpaTerm>();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            string currentSemester = "Spring2018";
            List<Gpa> gpaList = new List<Gpa>();
            string t2 = fap.getGPA(studentID, currentSemester);

            if (!t2.Equals("Data not found"))
            {
                gpaList = JsonConvert.DeserializeObject<List<Gpa>>(t2);
            }
            int totalCredit = 0;
            double avg = 0;

            for (int j = 0; j < gpaList.Count; j++)
            {
                double temp = 0;
                if (gpaList[j].averageMark != null)
                {
                    temp = gpaList[j].credits * (double)gpaList[j].averageMark;
                }
                if (temp > 0)
                {
                    totalCredit += gpaList[j].credits;
                    avg += temp;
                }
            }

            double gpa = ((double)avg) / ((double)totalCredit);
            List<Gpa> gpaList2 = new List<Gpa>();
            string getGpa2 = fap.getGPA(studentID, previousTerm(currentSemester));

            if (!getGpa2.Equals("Data not found"))
            {
                gpaList2 = JsonConvert.DeserializeObject<List<Gpa>>(getGpa2);
            }
            int totalCredit2 = 0;
            double avg2 = 0;

            for (int k = 0; k < gpaList2.Count; k++)
            {
                double temp2 = 0;
                if (gpaList2[k].averageMark != null)
                {
                    temp2 = gpaList2[k].credits * (double)gpaList2[k].averageMark;
                }
                if (temp2 > 0)
                {
                    totalCredit2 += gpaList2[k].credits;
                    avg2 += temp2;
                }
            }

            double gpa2 = ((double)avg2) / ((double)totalCredit2);
            //gpt.gpa = gpa;
            //gpt.gpa2 = gpa2;
            //gpt.semester = currentSemester;
            //gpt.semester2 = previousTerm(currentSemester);
            //listGpa.Add(gpt);
            listGpa.Add(new GpaTerm(gpa2, previousTerm(currentSemester)));
            listGpa.Add(new GpaTerm(gpa, currentSemester));
            
            return listGpa;
            
        }
        public List<Compare> takeDataCompare(string accountID)
        {
           return this.compare;
        }





        public string previousTerm(string semester)
        {
            int tempYear = int.Parse(semester.Substring(semester.Length - 4));
            string semester2 = semester.Substring(0, semester.Length - 4);
            if (semester2.Equals("Spring"))
            {
                tempYear = tempYear - 1;
                semester2 = "Fall" + tempYear;
            }
            else if (semester2.Equals("Fall"))
            {
                semester2 = "Summer" + tempYear;
            }
            else if (semester2.Equals("Summer"))
            {
                semester2 = "Spring" + tempYear;
            }
            return semester2;

        }


        public List<Compare> takeDataCompareForHead()
        {
            return this.compareForHead;
        }

        public bool canAddStudentIDToDistribu(string studentID, string accountID)
        {
            bool canAdd = false;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "select studentID from Student where studentID = @studentID AND accountID = @accountID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters["accountID"].Value = accountID;
            SqlDataReader dr = cmd.ExecuteReader();
            canAdd = !dr.HasRows;

            con.Close();
            return canAdd;
        }



        public bool updateAccountIDToTakeCare(string studentID, string accountID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Student SET accountID=@accountID Where studentID = @studentID AND caution=0";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["accountID"].Value = accountID;
            cmd.Parameters["studentID"].Value = studentID;

            int ret = cmd.ExecuteNonQuery();
            bool status = false;
            if (ret == 1) status = true;
            con.Close();


            return status;

        }



        public bool autoDistribution()
        {
            StaffDAL stal = new StaffDAL();
            StudentDAL std = new StudentDAL();
            List<StaffTakeCare> listStudent = std.showListStudentNeedTakeCare();
            List<TakeCare> listTakeCare = stal.listStaff();
            int sz = listTakeCare.Count;
            int idx = 0;
            for (int j = 0; j < listStudent.Count; j++)
            {
                updateAccountIDToTakeCare(listStudent[j].studentID.ToString(), listTakeCare[idx].accountID.ToString());
                idx = idx < sz - 1 ? idx + 1 : 0;
            }
            return true;
        }


        public List<StaffTakeCare> showListTable()
        {
            List<StaffTakeCare> list = new List<StaffTakeCare>();
            StaffTakeCare st = null;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "select studentID from Student";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                st = new StaffTakeCare();
                st.studentID = dr["studentID"].ToString();
                list.Add(st);



            }
            return list;
        }




    }
}
