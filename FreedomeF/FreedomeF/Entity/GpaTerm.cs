using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class GpaTerm
    {
        public GpaTerm()
        {
        }

        public GpaTerm(double gpa, string semester)
        {
            this.gpa = gpa;
            this.semester = semester;
        }

        public double gpa { get; set; }
        public string semester { get; set; }
    }
}