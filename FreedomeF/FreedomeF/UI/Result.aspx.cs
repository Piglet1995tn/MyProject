using FreedomeF.Business;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF.UI
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                if ((Session["account"]) == null)
                {
                    Response.Redirect("~/UI/Login.aspx");
                }
                string checkrole = (string)(Session["role"]);
                string account = (string)(Session["account"]);
                lbUserName.Text = account;

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

                string search = Request.QueryString["result"];
                if (!IsPostBack)
                {
                    if (search != null)
                    {
                        ScsBO sbo = new ScsBO();
                        DataTable dt = new DataTable();
                        dt = sbo.Search(search);
                        GridView1.DataSourceID = null;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        tbSearch.Text = search;

                        lbResult.Text = dt.Rows.Count + " " + "Kết Quả Tìm Kiếm";
                    }
                }
            }catch(Exception ee)
            {
                Response.Redirect("~/UI/Error.aspx");
            }
            
        }

  

        protected void btnSearch_Click(object sender, EventArgs e )
        {
            ScsBO sbo = new ScsBO();
            DataTable dt = new DataTable();
            dt = sbo.Search(tbSearch.Text);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            lbResult.Text = dt.Rows.Count + " " + "Kết Quả Tìm Kiếm";
            
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }
        
       int stt = 1;
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            ScsBO sbo = new ScsBO();
            DataTable dt = new DataTable();
            dt = sbo.Search(tbSearch.Text);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.PageIndex = e.NewPageIndex;
            int page = e.NewPageIndex;
            int numLine = GridView1.PageSize;
            stt = page * numLine + 1;
            GridView1.DataBind();




        }
    }
}