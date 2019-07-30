using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class Schedule
    {
        public Schedule()
        {
        }

        public Schedule(int id, string termID, string rollNumber, string subjectCode, string startTime, string endTime, int slot, string date, string roomNo, string note, string entryTime, string entryBy, string scheduleId, string lecturer, string giothi, string realSubject, string dateMark, string kythi)
        {
            this.id = id;
            this.termID = termID;
            this.rollNumber = rollNumber;
            this.subjectCode = subjectCode;
            this.startTime = startTime;
            this.endTime = endTime;
            this.slot = slot;
            this.date = date;
            this.roomNo = roomNo;
            this.note = note;
            this.entryTime = entryTime;
            this.entryBy = entryBy;
            this.scheduleId = scheduleId;
            this.lecturer = lecturer;
            this.giothi = giothi;
            this.realSubject = realSubject;
            this.dateMark = dateMark;
            this.kythi = kythi;
        }

        public int id { get; set; }
        public string termID { get; set; }
        public string rollNumber { get; set; }
        public string subjectCode { get; set; }
        public string startTime { get; set; }
        public string endTime { get; set; }
        public int slot { get; set; }
        public string date { get; set; }
        public string roomNo { get; set; }
        public string note { get; set; }
        public string entryTime { get; set; }
        public string entryBy { get; set; }
        public string scheduleId { get; set; }
        public string lecturer { get; set; }
        public string giothi { get; set; }
        public string realSubject { get; set; }
        public string dateMark { get; set; }
        public string kythi { get; set; }

    }
}