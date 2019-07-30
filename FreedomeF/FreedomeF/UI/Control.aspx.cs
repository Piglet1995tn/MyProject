using FreedomeF.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Archive1 : System.Web.UI.Page
    {
        Business.RankDAL rdal = new Business.RankDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["role"]) == null || (Session["account"]) == null)
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
            Rate rt = rdal.getRate();
            lbGpa2.Text = " " + rt.markRate.ToString() + "%";
            lbFail2.Text = " " + rt.failCout.ToString() + "%";
            lbBe2.Text = " " + rt.behRate.ToString() + "%";
            lbAttent2.Text = " " + rt.attentRate.ToString() + "%";

        }



        protected void changeRate_Click(object sender, EventArgs e)
        {
            Business.ScsBO sbo = new Business.ScsBO();
            int rMark = Convert.ToInt32(tbMark.Text);
            int rBehavior = Convert.ToInt32(tbBehavior.Text);
            int rAttend = Convert.ToInt32(tbAttendance.Text);
            int rFail = Convert.ToInt32(tbFailcourse.Text);

            if (rdal.canUpdatePercent(rMark, rBehavior, rAttend, rFail))
            {
                Entity.Rate rt = new Entity.Rate();
                rt.markRate = rMark;
                rt.behRate = rBehavior;
                rt.attentRate = rAttend;
                rt.failCout = rFail;
                rdal.updatePercent(rt);
                rdal.rankking();




                //     DataTable dt = sbo.show();
                //GridView1.DataSourceID = null;
                //GridView1.DataSource = dt;
                //GridView1.DataBind();



            }
            else
            {
                lbNoitice2.Text = "Cập nhật thất bại";
            }
            lbSuccess.Text = "Cập nhật thành công";
            Response.Redirect("~/UI/Control.aspx");
        }



        protected void logOut_Click1(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/UI/Login.aspx");
        }
    }
}