using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class OldListTakecare
    {
        public OldListTakecare()
        {

        }

        public OldListTakecare(string studentID, string staffName, int semester)
        {
            this.studentID = studentID;
            this.staffName = staffName;
            this.semester = semester;
        }

        public string studentID { get; set; }
        public string staffName { get; set; }
        public int semester { get; set; }
    }
}