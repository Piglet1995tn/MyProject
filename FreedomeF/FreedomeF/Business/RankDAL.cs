using FreedomeF.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace FreedomeF.Business
{
    public class RankDAL
    {
        public bool isInsertRank(string studentID, string rank, string semesterID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Insert into Rank (rankName,studentID,semesterID,status) values (@rankName,@studentID,@semesterID,@status) ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("rankName", SqlDbType.NVarChar);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters.Add("semesterID", SqlDbType.NVarChar);
            cmd.Parameters.Add("status", SqlDbType.Bit);
            cmd.Parameters["rankName"].Value = rank;
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters["semesterID"].Value = semesterID;
            cmd.Parameters["status"].Value = 0;
            cmd.ExecuteNonQuery();

            con.Close();


            return true;
        }

        public bool rankking()
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            SqlCommand comm = new SqlCommand("SELECT COUNT(*) FROM Student WHERE takecareStatus=0", con);
            Int32 count = (Int32)comm.ExecuteScalar();
            string sql = "SELECT studentID FROM Student WHERE takecareStatus=0";
            SqlCommand cmd = new SqlCommand(sql, con);
            Entity.Rate rt = getRate();
            SqlDataReader dr = cmd.ExecuteReader();

            var tasks = new Task[count];
            int i = 0;
            while (dr.Read())
            {
                string studentID = dr["studentID"].ToString();
                tasks[i++] = Task.Factory.StartNew(() =>
                {
                    calRank(studentID, rt);
                });
            }
            Task.WaitAll(tasks);
            return true;
        }

        public void calRank(string studentID, Entity.Rate rt)
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            Entity.Rank r = new Entity.Rank();
            r.studentID = studentID;
            string currentSemester = "Spring2018";
            string fail = fap.getFailCourse(r.studentID);
            string pass = fap.getPassCourse(r.studentID);
            List<Curricurlum> listPass = new List<Curricurlum>();
            List<Curricurlum> listFail = new List<Curricurlum>();
            if (!pass.Equals("Data not found"))
            {
                listPass = JsonConvert.DeserializeObject<List<Curricurlum>>(pass);
            }
            if (!fail.Equals("Data not found"))
            {
                listFail = JsonConvert.DeserializeObject<List<Curricurlum>>(fail);
            }
            List<Gpa> gpaList = new List<Gpa>();
            string t2 = fap.getGPA(r.studentID, currentSemester);
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
            double failcourse;
            if (listFail.Count != 0 && listPass.Count != 0)
            {
                failcourse = ((1 - ((double)listFail.Count) / ((double)listPass.Count + (double)listFail.Count))) * 10;
            }
            failcourse = 0;
            double behavior = ws.getBehaviorMark(r.studentID, currentSemester).behaviorMark;
            List<Curricurlum> attenList = new List<Curricurlum>();
            string t = fap.getAttendanceMark(r.studentID, currentSemester);
            if (!t.Equals("Data not found"))
            {
                attenList = JsonConvert.DeserializeObject<List<Curricurlum>>(t);
            }
            int totalAbsent = 0;
            for (int i = 0; i < attenList.Count; i++)
            {
                totalAbsent += attenList[i].absentTotal;
            }
            double atten = Math.Round(((double)(attenList.Count * 30) - totalAbsent) / ((double)attenList.Count * 30), 2) * 10;
            r.rank = Caculate(gpa, behavior, failcourse, atten, rt.markRate, rt.behRate, rt.failCout, rt.attentRate);
            if (checkExistRank(r.studentID, currentSemester))
            {
                isInsertRank(r.studentID, r.rank, currentSemester);
            }
            else
            {
                isUpdateRank2(r.studentID, r.rank, currentSemester);
            }
        }

      
        public bool isUpdateRank2(string studentID, string rank, string semester)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Rank SET semesterID=@semesterID, rankName=@rankName Where studentID=@studentID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters.Add("rankName", SqlDbType.NVarChar);
            cmd.Parameters.Add("semesterID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters["rankName"].Value = rank;
            cmd.Parameters["semesterID"].Value = semester;
             cmd.ExecuteNonQuery();
           
            con.Close();
            return true;
        }
        public bool checkExistRank(string studentID, string semesterID)
        {
            bool canAdd = false;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Select * From Rank Where studentID=@studentID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            //cmd.Parameters.Add("semesterID", SqlDbType.Int);
            //cmd.Parameters["semesterID"].Value = semesterID;
            SqlDataReader dr = cmd.ExecuteReader();
            canAdd = !dr.HasRows;
            con.Close();
            return canAdd;
        }
        public Entity.Rate getRate()
        {
            Entity.Rate rt = new Entity.Rate();
            SqlConnection con = DbConnect.GetConnection();
            try
            {
                con.Open();
                string sql = "SELECT markRate,behRate,failCout,attentRate FROM Rate ";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {


                    rt.markRate = (int)dr["markRate"];
                    rt.behRate = (int)dr["behRate"];
                    rt.failCout = (int)dr["failCout"];
                    rt.attentRate = (int)dr["attentRate"];
                }
            }
            finally
            {
                con.Close();
            }
            return rt;

        }
        public Entity.Rank loadRank(string studentID, string semesterID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "select rankName from Rank where studentID=@studentID AND semesterID=@semesterID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters.Add("semesterID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters["semesterID"].Value = semesterID;
            SqlDataReader dr = cmd.ExecuteReader();
            Entity.Rank r = null;
            if (dr.Read())
            {
                r = new Entity.Rank();
                r.rank = dr["rankName"].ToString();


            }
            dr.Close();
            con.Close();
            return r;
        }
        public string Caculate(double mark, double behavior, double fcCount, double atten, int markRate, int behaviorrate, int fcCountRate, int attenRate)
        {

            string rankName = "";
            double rankmark = 0;
            rankmark = (mark * markRate / 100) + (behavior * behaviorrate / 100) + (fcCount * fcCountRate / 100) + (atten * attenRate / 100);


            if (rankmark >= 8.0)
            {
                rankName = "A";

            }
            if (rankmark >= 7.0 && rankmark < 8.0)
            {
                rankName = "B";

            }
            if (rankmark >= 6.5 && rankmark < 7.0)
            {
                rankName = "C";

            }
            if (rankmark >= 5.0 && rankmark < 6.5)
            {
                rankName = "D";

            }
            if (rankmark >= 4.5 && rankmark < 5.0)
            {
                rankName = "E";

            }
            if (rankmark < 4.5)
            {
                rankName = "F";

            }
            return rankName;
        }
        public bool canUpdatePercent(int tbMark, int tbBehavior, int tbAttendance, int tbFailcourse)
        {
            bool canUpdate;
            if ((tbMark + tbBehavior + tbAttendance + tbFailcourse) == 100)
            {
                canUpdate = true;
            }
            else
            {
                canUpdate = false;
            }
            return canUpdate;
        }

        public Entity.Rate updatePercent(Entity.Rate rt)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Rate SET markRate=@markRate , behRate=@behRate,failCout=@failCout,attentRate=@attentRate Where id = 1";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("markRate", SqlDbType.Int);
            cmd.Parameters.Add("behRate", SqlDbType.Int);
            cmd.Parameters.Add("failCout", SqlDbType.Int);
            cmd.Parameters.Add("attentRate", SqlDbType.Int);
            cmd.Parameters["markRate"].Value = rt.markRate;
            cmd.Parameters["behRate"].Value = rt.behRate;
            cmd.Parameters["failCout"].Value = rt.failCout;
            cmd.Parameters["attentRate"].Value = rt.attentRate;
            cmd.ExecuteNonQuery();
            return rt;

        }
        public Entity.Rank changeRankByCoefficient()
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();
            //FreedomeF.ServiceReference1.ListStudentID[] list = ws.getStudentID();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();

            Entity.Rank r = null;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT studentID FROM Student WHERE takecareStatus=0";
            SqlCommand cmd = new SqlCommand(sql, con);
            RankDAL rdl = new RankDAL();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                r = new Entity.Rank();
                r.studentID = dr["studentID"].ToString();
                string currentSemester = "Spring2018";

                List<Curricurlum> listFail = new List<Curricurlum>();
                string fail = fap.getFailCourse(r.studentID);
                string pass = fap.getPassCourse(r.studentID);
                List<Curricurlum> listPass = new List<Curricurlum>();
                if(!pass.Equals("Data not found"))
                {
                    listPass = JsonConvert.DeserializeObject<List<Curricurlum>>(pass);
                }
                if (!fail.Equals("Data not found"))
                {
                    listFail = JsonConvert.DeserializeObject<List<Curricurlum>>(fail);
                }
                List<Gpa> gpaList = new List<Gpa>();
                string t2 = fap.getGPA(r.studentID, currentSemester);

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
                double failcourse = ((1 - ((double)listFail.Count) / ((double)listPass.Count + (double)listFail.Count))) * 10;

                double behavior = ws.getBehaviorMark(r.studentID, currentSemester).behaviorMark;

                List<Curricurlum> attenList = new List<Curricurlum>();

                string t = fap.getAttendanceMark(r.studentID, currentSemester);
                if (!t.Equals("Data not found"))
                {
                    attenList = JsonConvert.DeserializeObject<List<Curricurlum>>(t);
                }


                int totalAbsent = 0;
                for (int i = 0; i < attenList.Count; i++)
                {
                    totalAbsent += attenList[i].absentTotal;
                }


                double atten = Math.Round(((double)(attenList.Count * 30) - totalAbsent) / ((double)attenList.Count * 30), 2)*10;
                Entity.Rate rt = new Entity.Rate();
                rt = getRate();
                r.rank = Caculate(gpa, behavior, failcourse, atten, rt.markRate, rt.behRate, rt.failCout, rt.attentRate);
                r = new Entity.Rank();
                r.studymark = gpa;
                r.failcourseNumb = failcourse;
                r.behaviorMark = behavior;
                r.attendance = atten;
                r.rank = Caculate(gpa, behavior, failcourse, atten, rt.markRate, rt.behRate, rt.failCout, rt.attentRate);
                isUpdateRank2(r.studentID.ToString(), r.rank,currentSemester);

            }
            return r;
        }
        public bool isUpdateRank(string studentID, string rank)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Rank SET rankName=@rankName Where studentID=@studentID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters.Add("rankName", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters["rankName"].Value = rank;

            int ret = cmd.ExecuteNonQuery();
            bool status = false;
            if (ret == 1) status = true;
            con.Close();


            return status;
        }




    }
}