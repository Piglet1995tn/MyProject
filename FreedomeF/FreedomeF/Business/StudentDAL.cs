using FreedomeF.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FreedomeF.Business
{
    public class StudentDAL
    {
        public List<OldListTakecare> getOldStudent()
        {
          
            List<Student> listStudentAPI = new List<Student>();
            ServiceReference2.SAPISoapClient fap = new ServiceReference2.SAPISoapClient();
            string stf = fap.GetStudenK10JS();
            listStudentAPI = JsonConvert.DeserializeObject<List<Student>>(stf);
         
            List<OldListTakecare> list = new List<OldListTakecare>();
            List<OldListTakecare> list2 = new List<OldListTakecare>();
            SqlConnection con = DbConnect.GetConnection();
            string sql = " SELECT Student.studentID,Account.staffName,Rank.rankName "
             + " FROM Student"
             + " LEFT JOIN Rank"
             + " ON Rank.studentID = Student.studentID LEFT JOIN Account"
             + "  ON Account.accountID = Student.accountID"
             + " Where takecareStatus = 0 AND caution=0 ";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                OldListTakecare ol = new OldListTakecare();
                ol.studentID = dr["studentID"].ToString();
                ol.staffName = dr["staffName"].ToString();

                list.Add(ol);
            }

            list2 = list;
            for(int j=0;j<listStudentAPI.Count;j++)
            {
                for (int i = 0; i < list2.Count; i++)
                {
                    if (listStudentAPI[j].rollNumber.Equals(list[i].studentID))
                    {
                        list2.Remove(list[i]);

                    }
                }
            }
            con.Close();
            return list2;
        }
        public bool updateMoveStatus()
        {
            List<OldListTakecare> list = new List<OldListTakecare>();
            list = getOldStudent();
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            for (int i = 0; i < list.Count; i++)
            {

                string sql = "UPDATE Student SET takecareStatus=1 WHERE studentID=@studentID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
                cmd.Parameters["studentID"].Value = list[i].studentID;
                cmd.ExecuteNonQuery();
            }
            con.Close();
            return true;

        }


        public DataTable tableListOldStudent()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mssv");
            dt.Columns.Add("Nhân viên chăm sóc");
            //List<OldListTakecare> lt = new List<OldListTakecare>();
            //lt = getOldStudent();
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  SELECT Student.studentID,Account.staffName FROM Student LEFT JOIN Account ON Student.accountID = Account.accountID WHERE caution=0 AND takecareStatus!=0";
            SqlCommand cmd = new SqlCommand(sql,con);
            SqlDataReader dr = cmd.ExecuteReader();
            //for (int i = 0; i < lt.Count; i++)
            //{
            while (dr.Read()) { 

                var ds = dt.NewRow();
                ds["Mssv"] = dr["studentID"].ToString();
                ds["Nhân viên chăm sóc"] = dr["staffName"].ToString();
                dt.Rows.Add(ds);
            }


            return dt;
        }
        public bool updateMove(string studentID)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "UPDATE Student SET takecareStatus=0,caution=0 WHERE studentID=@studentID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.ExecuteNonQuery();
            return true;
        }
        public bool insertstudentName(string studentName)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "insert into Student (studentName)values(@studentName)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentName", SqlDbType.NVarChar);
            cmd.Parameters["studentName"].Value = studentName;
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
        }
        public bool filterStudent()
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT TOP 10 studentID FROM Rank  ORDER BY rankName DESC";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            StatusCheck stc = null;
            while (dr.Read())
            {
                stc = new StatusCheck();
                stc.studentID = dr["studentID"].ToString();
                SqlConnection con2 = DbConnect.GetConnection();
                con2.Open();
                string sql2 = "UPDATE Student SET caution=0 Where studentID=@studentID";
                SqlCommand cmd2 = new SqlCommand(sql2, con2);
                cmd2.Parameters.Add("studentID", SqlDbType.NVarChar);
                cmd2.Parameters["studentID"].Value = stc.studentID;
                cmd2.ExecuteNonQuery();
                con2.Close();
            }
            con.Close();
            return true;

        }
        public bool insertStudentToTakeCare(string studentID, string studentName)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "INSERT INTO Student (studentID,studentName) VALUES (@studentID,@studentName)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters.Add("studentName", SqlDbType.NVarChar);
            cmd.Parameters["studentName"].Value = studentName;
            cmd.ExecuteNonQuery();
            return true;
        }
        public int getNumberOfDefaultStudent()
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT * From Student WHERE accountID IS NULL AND takecareStatus=0 AND caution=0";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            int NumberOfDefaultStudent = 0;
            while (dr.Read())
            {
                NumberOfDefaultStudent++;
            }

            return NumberOfDefaultStudent;
        }
        public bool checkStudentID(string studentID)
        {
            bool check = false;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "SELECT COUNT(studentID) From Student WHERE studentID=@studentID GROUP BY studentID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            SqlDataReader dr = cmd.ExecuteReader();
            check = dr.HasRows;
            return check;

        }
        public List<StaffTakeCare> showListStudentNeedTakeCare()
        {
            List<StaffTakeCare> list = new List<StaffTakeCare>();
            StaffTakeCare st = null;
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "  SELECT TOP 10 Student.studentID,Account.staffName ,Rank.rankName "
            + "FROM Student"
            + "  LEFT JOIN Account"
            + "  ON Account.accountID = Student.accountID"
            + "  LEFT JOIN Rank ON Student.studentID = Rank.studentID"
            + "  Where  takecareStatus = 0 AND caution = 0 ORDER BY rankName DESC";
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