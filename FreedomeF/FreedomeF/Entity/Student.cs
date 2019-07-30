using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Student
    {
        public Student()
        {
        }

        public Student(string rollNumber, string studentName, int courseID, string staffName, int accountID)
        {
            this.rollNumber = rollNumber;
            this.studentName = studentName;
            this.courseID = courseID;
            StaffName = staffName;
            this.accountID = accountID;
        }

        public string rollNumber { get; set; }
        public string studentName { get; set; }
        public int courseID { get; set; }
        public string StaffName { get; set; }
        public int accountID { get; set; }

    }
}

