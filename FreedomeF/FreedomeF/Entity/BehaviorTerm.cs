using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class BehaviorTerm
    {
        public BehaviorTerm()
        {

        }
        public BehaviorTerm(double behavior, string semester)
        {
            this.behavior = behavior;
            this.semester = semester;
        }

        public double behavior { get; set; }
        public string semester { get; set; }
    }
}