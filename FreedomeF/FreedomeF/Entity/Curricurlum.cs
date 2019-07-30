using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Curricurlum
    {
        public Curricurlum(string subjectCode, string subjectName, int termNo, int absentTotal)
        {
            this.subjectCode = subjectCode;
            this.subjectName = subjectName;
            this.termNo = termNo;
            this.absentTotal = absentTotal;
        }

        public string subjectCode { get; set; }
        public string subjectName { get; set; }
         public int termNo { get; set; }
        public int absentTotal { get; set; }
    }
}