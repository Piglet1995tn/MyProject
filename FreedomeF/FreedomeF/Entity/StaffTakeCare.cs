using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class StaffTakeCare
    {
        public StaffTakeCare()
        {

        }

        public StaffTakeCare(string studentID, string studentName, int accountID)
        {
            this.studentID = studentID;
            this.studentName = studentName;
            this.accountID = accountID;
        }

        public string studentID { get; set; }
        public string studentName { get; set; }
        public int accountID { get; set; }
        
    }
}