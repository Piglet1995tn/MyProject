using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Staff
    {
        public Staff()
        {

        }
        public Staff(int accountiD, string account, string role, string staffName,string status)
        {
            this.accountID = accountiD;
            this.account = account;
            this.role = role;
            this.staffName = staffName;
            this.status = status;
        }

        public int accountID { get; set; }
        public string account { get; set; }
         public string role { get; set; }
        public string staffName { get; set; }
        public string status { get; set; }
    }
}