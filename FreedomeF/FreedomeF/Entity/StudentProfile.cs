using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FreedomeF.Entity
{
    public class StudentProfile
    {
        public StudentProfile()
        {
        }

        public StudentProfile(string rollNumber, string fullName, DateTime dateOfBirth, string gender, string idcard, DateTime dateOfIsue, string address, string email, string phone, string membercode, string chuuyenNganh, string major, string currentTermNo, string statusCode, string qd_chuyennganh, string qD_SV_ChinhQuy, string hanBayNam, string qD_ThoiHoc, string qD_BaoLuu_Exchange, string qD_kyluat, string qD_Tn, string qD_rejoin, string batch, string termPaid, string parentName, string parentPhone)
        {
            this.rollNumber = rollNumber;
            this.fullName = fullName;
            this.dateOfBirth = dateOfBirth;
            this.gender = gender;
            this.idcard = idcard;
            this.dateOfIsue = dateOfIsue;
            this.address = address;
            this.email = email;
            this.phone = phone;
            this.membercode = membercode;
            this.chuuyenNganh = chuuyenNganh;
            this.major = major;
            this.currentTermNo = currentTermNo;
            this.statusCode = statusCode;
            this.qd_chuyennganh = qd_chuyennganh;
            QD_SV_ChinhQuy = qD_SV_ChinhQuy;
            HanBayNam = hanBayNam;
            QD_ThoiHoc = qD_ThoiHoc;
            QD_BaoLuu_Exchange = qD_BaoLuu_Exchange;
            this.qD_kyluat = qD_kyluat;
            this.qD_Tn = qD_Tn;
            this.qD_rejoin = qD_rejoin;
            this.batch = batch;
            this.termPaid = termPaid;
            this.parentName = parentName;
            this.parentPhone = parentPhone;
        }

        public string rollNumber { get; set; }
        public string fullName { get; set; }
        public DateTime dateOfBirth { get; set; }
        public string gender { get; set; }
        public string idcard { get; set; }
        public DateTime dateOfIsue { get; set; }
        public string address { get; set; }
        public string email { get; set; }

        public string phone { get; set; }
        public string membercode { get; set; }
        public string chuuyenNganh { get; set; }
        public string major { get; set; }
        public string currentTermNo { get; set; }
        public string statusCode { get; set; }
        public string qd_chuyennganh { get; set; }
        public string QD_SV_ChinhQuy { get; set; }
        public string HanBayNam { get; set; }

        public string QD_ThoiHoc { get; set; }
        public string QD_BaoLuu_Exchange { get; set; }
        public string qD_kyluat { get; set; }
        public string qD_Tn { get; set; }
        public string qD_rejoin { get; set; }
        
        
            public string batch { get; set; }
        public string termPaid { get; set; }
        
        public string parentName { get; set; }
        public string parentPhone { get; set; }


    }
}