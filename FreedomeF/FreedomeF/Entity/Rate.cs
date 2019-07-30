using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Rate
    {
        public Rate()
        {

        }
        public Rate(int markRate, int behRate, int failCout, int attentRate)
        {
            this.markRate = markRate;
            this.behRate = behRate;
            this.failCout = failCout;
            this.attentRate = attentRate;
        }

        public int markRate { get; set; }
       public  int behRate { get; set; }
       public  int failCout { get; set; }
      public  int attentRate { get; set; }
    }
}