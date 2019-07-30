using FreedomeF.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FreedomeF.Business
{
    public class StaffDAL
    {

        public bool insertComment(string studentID, string content, string accountID, string fileName)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "insert into Comment (content,studentID,date,accountID,fileName) values(@Content,@id,GETDATE(),@accountID,@fileName)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("Content", SqlDbType.NVarChar);
            cmd.Parameters.Add("id", SqlDbType.NVarChar);
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters.Add("fileName", SqlDbType.NVarChar);

            cmd.Parameters["Content"].Value = content;
            cmd.Parameters["id"].Value = studentID;
            cmd.Parameters["accountID"].Value = accountID;
            cmd.Parameters["fileName"].Value = fileName;
            cmd.ExecuteNonQuery();
            con.Close();


            return true;
        }
        public bool updateStaffName(string staffName, string account)
        {
            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Account SET staffName =@staffName WHERE account=@account ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("staffName", SqlDbType.NVarChar);
            cmd.Parameters.Add("account", SqlDbType.NVarChar);
            cmd.Parameters["staffName"].Value = staffName;
            cmd.Parameters["account"].Value = account;
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
        }

        public bool insertAttent(string studentID, int status)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Rank SET status=@status where studentID=@studentID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters.Add("status", SqlDbType.Bit);
            cmd.Parameters["status"].Value = status;
            cmd.ExecuteNonQuery();
            return true;

        }
        public bool insertTakecareStatus(string studentID, int status)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Student SET takecareStatus=@takecareStatus where studentID=@studentID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters.Add("takecareStatus", SqlDbType.Bit);
            cmd.Parameters["takecareStatus"].Value = status;
            cmd.ExecuteNonQuery();
            return true;
        }
        public List<TakeCare> listStaff()
        {


            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "select accountID,role,staffName From Account where role='CareStaff'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            List<TakeCare> list = new List<TakeCare>();
            TakeCare tk = null;
            while (dr.Read())
            {
                tk = new TakeCare();

                tk.accountID = dr["accountID"].ToString();
                tk.role = dr["role"].ToString();
                tk.staffname = dr["staffName"].ToString();
                list.Add(tk);

            }
            dr.Close();

            return list;
        }
        public bool isUpdateStaffName(string studentID, string accountID)
        {

            SqlConnection con = DbConnect.GetConnection();
            con.Open();
            string sql = "Update Student SET accountID=@accountID Where studentID=@studentID ";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("studentID", SqlDbType.NVarChar);
            cmd.Parameters.Add("accountID", SqlDbType.Int);
            cmd.Parameters["studentID"].Value = studentID;
            cmd.Parameters["accountID"].Value = accountID;

            int ret = cmd.ExecuteNonQuery();
            bool status = false;
            if (ret == 1) status = true;
            con.Close();


            return status;
        }
    }
}