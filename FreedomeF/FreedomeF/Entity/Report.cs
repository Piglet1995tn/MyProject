using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Report

    {
        public Report()
        {
        }
        public Report(string subjectCode, int slot, string comment, string lecturer, DateTime date)
        {
            this.subjectCode = subjectCode;
            this.slot = slot;
            this.comment = comment;
            this.lecturer = lecturer;
            this.date = date;
        }

        public string subjectCode { get; set; }
        public int slot { get; set; }
        public string comment { get; set; }
        public string lecturer { get; set; }
        public DateTime date { get; set; }
    }
}