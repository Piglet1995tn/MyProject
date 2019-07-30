using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Timetable
    {
        public Timetable()
        {

        }

        public Timetable(string subjectCode, string groupName, DateTime date, string roomNo, string status)
        {
            this.subjectCode = subjectCode;
            this.groupName = groupName;
            this.date = date;
            this.roomNo = roomNo;
            this.status = status;
        }

        public string subjectCode { get; set; }
        public string groupName { get; set; }
        public DateTime date { get; set; }
        public string roomNo { get; set; }
        public string status { get; set; }
    }
}