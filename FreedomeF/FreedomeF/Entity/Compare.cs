using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Compare
    {
        public Compare()
        {

        }

        public Compare(double gpa, double gpa2, double behavior, double behavior2, double atten, double atten2, double failcourse, double failcourse2)
        {
            this.gpa = gpa;
            this.gpa2 = gpa2;
            this.behavior = behavior;
            this.behavior2 = behavior2;
            this.atten = atten;
            this.atten2 = atten2;
            this.failcourse = failcourse;
            this.failcourse2 = failcourse2;
        }

        public double gpa { get; set; }
        public double gpa2 { get; set; }
        public double behavior { get; set; }
        public double behavior2 { get; set; }
        public double atten { get; set; }
        public double atten2 { get; set; }
        public double failcourse { get; set; }
        public double failcourse2 { get; set; }
    }
}