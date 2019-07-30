using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Rank
    {
        public Rank()
        {

        }

        public Rank(string studentID, string studentName, double studymark, double behaviorMark, double failcourseNumb, double attendance,  string rank)
        {
            this.studentID = studentID;
            this.studentName = studentName;
            this.studymark = studymark;
            this.behaviorMark = behaviorMark;
            this.failcourseNumb = failcourseNumb;
            this.attendance = attendance;
           
            
            this.rank = rank;
        }

        public string studentID { get; set; }
        public string studentName { get; set; }
        public double studymark { get; set; }
        public double behaviorMark { get; set; }
        public double failcourseNumb { get; set; }
        public double attendance { get; set; }
     
       
        public string rank { get; set; }
    }
}