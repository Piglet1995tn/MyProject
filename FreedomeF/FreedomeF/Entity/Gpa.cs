using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Gpa
    {
        public Gpa()
        {

        }

        public Gpa(string subjectCode, int credits, double averageMark)
        {
            this.subjectCode = subjectCode;
            this.credits = credits;
            this.averageMark = averageMark;
        }

        public string subjectCode { get; set; }
        public int credits { get; set; }
        public double? averageMark { get; set; }
        
    }
}