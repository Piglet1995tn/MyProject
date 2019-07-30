using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using FreedomeF.Business;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using FreedomeF.Entity;

namespace Freedom.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void testRankingE()
        {
            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(4.95,2,6.29,8,80,10,5,5);
            Assert.AreEqual("E", result);
        }
        [TestMethod]
        public void testRankingIsNotNull()
        {
            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(4.95, 2, 6.29, 8, 80, 10, 5, 5);
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void testRankB()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(7.03, 8, 8.71, 8, 80, 10, 5, 5);
            Assert.AreEqual("B", result);
        }
        [TestMethod]
        public void testUpdatePercent()
        {
            RankDAL rdal = new RankDAL();
            bool result = rdal.canUpdatePercent(80,10,5,5);
            Assert.IsTrue(result);
        }
        [TestMethod]
        public void testUpdatePercentOver()
        {
            RankDAL rdal = new RankDAL();
            bool result = rdal.canUpdatePercent(80, 15, 5, 5);
            Assert.IsTrue(result);
        }
        [TestMethod]
        public void testUpdatePercentPass()
        {
            RankDAL rdal = new RankDAL();
            bool result = rdal.canUpdatePercent(75, 15, 5, 5);
            Assert.IsTrue(result);
        }
        [TestMethod]
        public void testUpdatePercentZeroInput()
        {
            RankDAL rdal = new RankDAL();
            bool result = rdal.canUpdatePercent(0, 0, 0,0);
            Assert.IsTrue(result);
        }


        [TestMethod]
        public void testRankC()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(6.03, 8, 8.71, 8, 80, 10, 5, 5);
            Assert.AreEqual("C", result);
        }
        [TestMethod]
        public void testRankD()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(6.03, 8, 8.71, 8, 80, 10, 5, 5);
            Assert.AreEqual("D", result);
        }
        [TestMethod]
        public void testRankA()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(8.03, 8, 8.71, 8, 80, 10, 5, 5);
            Assert.AreEqual("A", result);
        }
        [TestMethod]
        public void testRankInputZeroWeighted()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(0, 0, 0, 0, 80, 10, 5, 5);
            Assert.AreEqual("F", result);
        }
        [TestMethod]
        public void testRankInputZeroRate()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(6.0, 7, 8, 0, 0, 0, 0, 0);
            Assert.AreEqual("A", result);
        }
        [TestMethod]
        public void testRankInputZero()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(0, 0, 0, 0, 0, 0, 0, 0);
            Assert.AreEqual("F", result);
        }
        [TestMethod]
        public void testRankInputOverRate()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(8, 8, 6, 2, 75, 25, 10, 10);
            Assert.AreEqual("A", result);
        }
        [TestMethod]
        public void testRankInputNagtiveWeight()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(-8, -8, -6, -2, 75, 15, 5, 5);
            Assert.AreEqual("A", result);
        }
        [TestMethod]
        public void testRankInputNagtiveRate()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(8, 8, 6, 2, -75, -15, -5, -5);
            Assert.AreEqual("A", result);
        }
        [TestMethod]
        public void testRankF()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(4, 6, 6, 2, 80, 10, 5, 5);
            Assert.AreEqual("F", result);
          
        }
        [TestMethod]
        public void testPreviousSemester()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("Spring2018"); ;
            Assert.AreEqual("Fall2017", result);

        }
        [TestMethod]
        public void testPreviousSemesterInputNumber()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("9"); ;
            Assert.AreEqual("Fall2017", result);

        }
        [TestMethod]
        public void testPreviousSemesterOneYear()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("Fall2018"); ;
            Assert.AreEqual("Summer2018", result);

        }
        [TestMethod]
        public void testPreviousSemesterIsNotNull()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("Fall2018"); ;
            Assert.IsNotNull(result);

        }
        [TestMethod]
        public void testPreviousSemesterIsNotNull2()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm(null); ;
            Assert.IsNotNull(result);

        }
        [TestMethod]
        public void testPreviousSemesterIsNull()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm(null); ;
            Assert.IsNull(result);

        }
        [TestMethod]
        public void testCheckExitsRank()
        {

           RankDAL rdal = new RankDAL();
            bool result = rdal.checkExistRank("SE04479","Spring2018"); ;
            Assert.AreEqual(true, result);

        }
        [TestMethod]
        public void testRankCTrue()
        {

            RankDAL rdal = new RankDAL();
            string result = rdal.Caculate(6.4, 8, 6, 7, 80, 10, 5, 5);
            Assert.AreEqual("C", result);

        }
        [TestMethod]
        public void testPreviousSemesterInputNumberNagative()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("-9"); ;
            Assert.AreEqual("Fall2017", result);

        }
        [TestMethod]
        public void testPreviousSemesterMisstakeYear()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("Spring"); ;
            Assert.AreEqual("Fall2017", result);

        }
        [TestMethod]
        public void testPreviousSemesterMisstakeSemester()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm("Spr2018"); ;
            Assert.AreEqual("Fall2017", result);

        }
        [TestMethod]
        public void testPreviousSemesterEmpty()
        {

            ScsBO sbo = new ScsBO();
            string result = sbo.previousTerm(""); ;
            Assert.AreEqual("Fall2017", result);
            
        }
      

    }
}
