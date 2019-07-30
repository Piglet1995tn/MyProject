using FreedomeF.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FreedomeF
{
    public partial class Move : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentDAL stdal = new StudentDAL();
            Business.ScsBO sbo = new Business.ScsBO();
            string studentID = Request.QueryString["studentID"];
            if (stdal.updateMove(studentID))
            {
                Response.Redirect("~/UI/distribution.aspx");
            }


        }
    }
}