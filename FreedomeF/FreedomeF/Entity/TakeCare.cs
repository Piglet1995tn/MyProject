using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class TakeCare
    {
        public TakeCare()
        {

        }

        public TakeCare(string accountID, string role, string staffname)
        {
            this.accountID = accountID;
            this.role = role;
            this.staffname = staffname;
        }

        public string accountID { get; set; }
        
        public string role { get; set; }
        public string staffname { get; set; }
    }
}