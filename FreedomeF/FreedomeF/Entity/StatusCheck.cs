using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class StatusCheck
    {
        public StatusCheck()
        {

        }

        public StatusCheck(string studentID, bool attention)
        {
            this.studentID = studentID;
            this.attention = attention;
        }

        public string studentID { get; set; }
        public bool attention { get; set; }
    }
}