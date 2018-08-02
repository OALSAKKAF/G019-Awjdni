using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    public class Pilgrim
    {
        public string PID { get; set; }
        public string QRID { get; set; }
        public string OID { get; set; }
        public string PASSPORTID { get; set; }
        public string FULLNAME { get; set; }
        public string NATIONALITY { get; set; }
        public string BLOOD { get; set; }
        public string ADDRESS { get; set; }
        //
        //Offices.OID,Offices.LIC_NUM,Offices.NAME,Offices.ADDRESS,Offices.PHONE
        public string OFFOID { get; set; }
        public string OFFLIC_NUM { get; set; }
        public string OFFNAME { get; set; }
        public string OFFADDRESS { get; set; }
        public string OFFPHONE { get; set; }
        public string OFFMOBILE { get; set; }

        //
        public string MSG { get; set; }
        public string CODE { get; set; }
    }

    public class Medical_Rec
    {
        //
        public string MRID { get; set; }
        public string MRTYPE { get; set; }
        public string MRVALUE { get; set; }
        //
        public string MSG { get; set; }
        public string CODE { get; set; }
    }

    public class Users
    {
        public string UID { get; set; }
        public string TYPE { get; set; }
        public string USER { get; set; }
        public string PWD { get; set; }
        public string EMAIL { get; set; }
        public string MOBILE { get; set; }
        public string ACTIVE { get; set; }
        public string NOTE { get; set; }
        public string MSG { get; set; }
        public string CODE { get; set; }
    }

    public class NOTES
    {
        public string NID { get; set; }
        public string QRID { get; set; }
        public string UID { get; set; }
        public string TXTNOTE { get; set; }
        public string TYPEN { get; set; }
        public string UPDATEDATE { get; set; }
        public string LOC { get; set; }
        public string MSG { get; set; }
        public string CODE { get; set; }
    }

    public class TYPES
    {
        public string TYPEN { get; set; }
        public string TYPEV { get; set; }
        public string MSG { get; set; }
        public string CODE { get; set; }
    }

    ///////////////////////////////////
    [WebMethod]
    public List<TYPES> GetAllTypes()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

        //////////////////////////////
        MySqlConnection conn = new MySqlConnection(connectionString);
        string query = "SELECT * FROM TYPES";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        List<TYPES> tp = new List<TYPES>();
        MySqlDataReader dr = cmd.ExecuteReader();
        //PID QRID OID PASSPORTID FULLNAME NATIONALITY BLOOD   ADDRESS
        while (dr.Read())
        {
            var t = new TYPES
            {
                TYPEN = dr["TYPEN"].ToString(),
                TYPEV = dr["TYPEV"].ToString(),
            };

            tp.Add(t);
        }


        //Close Connection
        dr.Close();
        conn.Close();
        return tp;
    }


    /////////////Pilgrims//////////////
    [WebMethod]
    public List<Pilgrim> GetAllPilgrim()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
        List<string>[] list = new List<string>[8];

        //////////////////////////////
        MySqlConnection conn = new MySqlConnection(connectionString);
        string query = "SELECT * FROM Pilgrims";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        List<Pilgrim> Pilmm = new List<Pilgrim>();
        MySqlDataReader dr = cmd.ExecuteReader();
        //PID QRID OID PASSPORTID FULLNAME NATIONALITY BLOOD   ADDRESS
        while (dr.Read())
        {
            var Pilm = new Pilgrim
            {
                PID = dr["PID"].ToString(),
                QRID = dr["QRID"].ToString(),
                OID = dr["OID"].ToString(),
                PASSPORTID = dr["PASSPORTID"].ToString(),
                FULLNAME = dr["FULLNAME"].ToString(),
                BLOOD = dr["BLOOD"].ToString(),
                ADDRESS = dr["ADDRESS"].ToString()


            };

            Pilmm.Add(Pilm);
        }


        //Close Connection
        dr.Close();
        conn.Close();
        return Pilmm;
    }


    //////////////////////////////////
    [WebMethod]
    public List<Medical_Rec> GetMedicalRec(string QRID)
    {
        //////////////////////////////
        List<Medical_Rec> mr = new List<Medical_Rec>();
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            //////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            //string query = "SELECT * FROM Pilgrims where QRID =@QRID"; //'" + QRID + "'
            string query = @"SELECT MRID,MRTYPE,MRVALUE FROM `Medical_Rec` WHERE QRID = @QRID";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.Add("@QRID", QRID);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == false)
            {
                var m = new Medical_Rec
                {
                    CODE = "200",
                    MSG = "FALSE",

                };
                mr.Add(m);

                return mr;
            }
            while (dr.Read())
            {
                var m = new Medical_Rec
                {
                    CODE = "100",
                    MSG = "TRUE",
                    MRID = dr["MRID"].ToString(),
                    MRTYPE = dr["MRTYPE"].ToString(),
                    MRVALUE = dr["MRVALUE"].ToString()
                };
            mr.Add(m);
            }

            //Close Connection
            dr.Close();
            conn.Close();
            return mr;
        }
        catch (Exception ex)
        {
            var m = new Medical_Rec
            {
                CODE = "500",
                MSG = "FALSE",
               
            };
            mr.Add(m);

            return mr;
        }
    }
    //////////////////////////////////

    //////////////////////////////////
    [WebMethod]
    public Medical_Rec GetMedicalRec2(string QRID)
    {
        Medical_Rec MR = new Medical_Rec();

        //////////////////////////////

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            //////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            string query = @"SELECT MRID,MRTYPE,MRVALUE FROM `Medical_Rec` WHERE QRID = @QRID";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.Add("@QRID", QRID);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == false)
            {
                MR.CODE = "200";
                MR.MSG = "FALSE";
                return MR;
            }
            while (dr.Read())
            {
                MR.MRVALUE += dr["MRVALUE"].ToString() + '/';
            }
            MR.CODE = "100";
            MR.MSG = "TRUE";
            return MR;
            
        }
        catch (Exception ex)
        {
            MR.CODE = "500";
            MR.MSG = "FALSE";
            return MR;
        }
    }
    //////////////////////////////////
    //[WebMethod]
    //public List<Pilgrims> GetOnePilgrim(string QRID)
    //{
    //    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    //    //List<string>[] list = new List<string>[8];

    //    //////////////////////////////
    //    MySqlConnection conn = new MySqlConnection(connectionString);
    //    string query = "SELECT * FROM Pilgrims where QRID =@QRID"; //'" + QRID + "'
    //    MySqlCommand cmd = new MySqlCommand(query, conn);
    //    cmd.Parameters.Add("@QRID", QRID);
    //    conn.Open();
    //    List<Pilgrims> Pilmm = new List<Pilgrims>();
    //    MySqlDataReader dr = cmd.ExecuteReader();
    //    //PID QRID OID PASSPORTID FULLNAME NATIONALITY BLOOD   ADDRESS
    //    while (dr.Read())
    //    {
    //        var Pilm = new Pilgrims
    //        {
    //            PID = dr["PID"].ToString(),
    //            QRID = dr["QRID"].ToString(),
    //            OID = dr["OID"].ToString(),
    //            PASSPORTID = dr["PASSPORTID"].ToString(),
    //            FULLNAME = dr["FULLNAME"].ToString(),
    //            BLOOD = dr["BLOOD"].ToString(),
    //            ADDRESS = dr["ADDRESS"].ToString()
    //        };

    //        Pilmm.Add(Pilm);
    //    }


    //    //Close Connection
    //    dr.Close();
    //    conn.Close();
    //    return Pilmm;
    //}

    ///////////////////////////////////

    /////////////ChkUsers//////////////   

    //[WebMethod]
    //public List<Users> ChkUsers(string USER, string PWD)
    //{
    //    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    //    List<Users> Usrs = new List<Users>();
    //    try
    //    {
    //        //////////////////////////////
    //        MySqlConnection conn = new MySqlConnection(connectionString);
    //        string query = "SELECT * FROM USERS where USER =@USER AND PWD=@PWD"; //'" + QRID + "'
    //        MySqlCommand cmd = new MySqlCommand(query, conn);
    //        cmd.Parameters.Add("@USER", USER);
    //        cmd.Parameters.Add("@PWD", PWD);
    //        conn.Open();
    //        MySqlDataReader dr = cmd.ExecuteReader();
    //        //PID QRID OID PASSPORTID FULLNAME NATIONALITY BLOOD   ADDRESS
    //        while (dr.Read())
    //        {
    //            string usr = dr["USER"].ToString();
    //            string pwd = dr["PWD"].ToString();
    //            if (usr == USER && pwd == PWD)
    //            {
    //                var usrr = new Users
    //                {
    //                    MSG = "TRUE",
    //                    CODE = "100",
    //                    UID = dr["UID"].ToString(),
    //                    TYPE = dr["TYPE"].ToString(),
    //                    USER = dr["USER"].ToString(),
    //                    PWD = dr["PWD"].ToString(),
    //                    EMAIL = dr["EMAIL"].ToString(),
    //                    MOBILE = dr["MOBILE"].ToString(),
    //                    ACTIVE = dr["ACTIVE"].ToString(),
    //                    NOTE = dr["NOTE"].ToString()
    //                };

    //                Usrs.Add(usrr);
    //            }
    //            else
    //            {
    //                var usrr = new Users
    //                {
    //                    MSG = "FALSE",
    //                    CODE = "200"
    //                };
    //                Usrs.Add(usrr);

    //                return Usrs;
    //            }
    //        }
    //        //Close Connection
    //        dr.Close();
    //        conn.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        var usrr = new Users
    //        {
    //            MSG = ex.Message,
    //            CODE = "500"
    //        };
    //        Usrs.Add(usrr);
    //        return Usrs;
    //    }



    //    return Usrs;


    //}

    [WebMethod]
    public Pilgrim GetOnePilgrim(string QRID)
    {
        Pilgrim p = new Pilgrim();

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            //List<string>[] list = new List<string>[8];
            //////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            //string query = "SELECT * FROM Pilgrims where QRID =@QRID"; //'" + QRID + "'
            string query = @"SELECT Pilgrims.PID,Pilgrims.QRID,Pilgrims.PASSPORTID,Pilgrims.FULLNAME,Pilgrims.NATIONALITY,
                 Pilgrims.BLOOD,Pilgrims.ADDRESS,
                 Offices.OID OFFOID,Offices.LIC_NUM,Offices.NAME,Offices.ADDRESS OFFADDRESS,Offices.PHONE,Offices.MOBILE
                 FROM Pilgrims,Offices
                 where QRID = @QRID AND Pilgrims.OID = Offices.OID";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.Add("@QRID", QRID);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == false)
            {
                p.MSG = "FALSE";
                p.CODE = "200";
            }
            while (dr.Read())
            {
                p.MSG = "TRUE";
                p.CODE = "100";
                p.PID = dr["PID"].ToString();
                p.QRID = dr["QRID"].ToString();
                //p.OID = dr["OID"].ToString();
                p.PASSPORTID = dr["PASSPORTID"].ToString();
                p.FULLNAME = dr["FULLNAME"].ToString();
                p.NATIONALITY = dr["NATIONALITY"].ToString();
                p.BLOOD = dr["BLOOD"].ToString();
                p.ADDRESS = dr["ADDRESS"].ToString();
                p.OFFOID = dr["OFFOID"].ToString();
                p.OFFLIC_NUM = dr["LIC_NUM"].ToString();
                p.OFFNAME = dr["NAME"].ToString();
                p.OFFADDRESS = dr["OFFADDRESS"].ToString();
                p.OFFPHONE = dr["PHONE"].ToString();
                p.OFFMOBILE = dr["MOBILE"].ToString();

            }


            //Close Connection
            dr.Close();
            conn.Close();
            return p;
        }
        catch (Exception ex)
        {
            p.MSG = ex.Message;
            p.CODE = "500";

            return p;
        }
    }


    [WebMethod]
    public Users ChkUsers(string USER, string PWD)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
        Users Usrs = new Users();
        try
        {
            //////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            string query = "SELECT * FROM USERS where USER =@USER AND PWD=@PWD"; //'" + QRID + "'
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.Add("@USER", USER);
            cmd.Parameters.Add("@PWD", PWD);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows == true)
            {
                string usr = dr["USER"].ToString();
                string pwd = dr["PWD"].ToString();
                if (usr == USER && pwd == PWD)
                {
                    Usrs.MSG = "TRUE";
                    Usrs.CODE = "100";
                    Usrs.UID = dr["UID"].ToString();
                    Usrs.TYPE = dr["TYPE"].ToString();
                    Usrs.USER = dr["USER"].ToString();
                    Usrs.PWD = dr["PWD"].ToString();
                    Usrs.EMAIL = dr["EMAIL"].ToString();
                    Usrs.MOBILE = dr["MOBILE"].ToString();
                    Usrs.ACTIVE = dr["ACTIVE"].ToString();
                    Usrs.NOTE = dr["NOTE"].ToString();

                }
            }
            else
            {
                Usrs.MSG = "FALSE";
                Usrs.CODE = "200";
            }
            //Close Connection
            dr.Close();
            conn.Close();
        }
        catch (Exception ex)
        {

            Usrs.MSG = ex.Message;
            Usrs.CODE = "500";

            return Usrs;
        }



        return Usrs;


    }

    /////////////////////////////////////////////////////////

    [WebMethod]
    public NOTES AddNote(string QRID, string UID, string TXTNOTE, string TYPEN, string LOC)
    {

        NOTES n = new NOTES();

        ////////////////////////////////////////
        try
        {

            string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connectionString);
            string query = @"INSERT INTO notes (NID, QRID, UID, UPDATEDATE, TYPEN, TXTNOTE, LOC) VALUES 
                            (NULL, @QRID, @UID, CURRENT_TIMESTAMP,@TYPEN,@TXTNOTE ,@LOC);";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@QRID", QRID);
            cmd.Parameters.AddWithValue("@UID", UID);
            cmd.Parameters.AddWithValue("@TYPEN", TYPEN);
            cmd.Parameters.AddWithValue("@TXTNOTE", TXTNOTE);
            cmd.Parameters.AddWithValue("@LOC", LOC);

            conn.Open();
            int res = cmd.ExecuteNonQuery();
            if (res == 1)
            {
                n.MSG = "TRUE";
                n.CODE = "100";
            }
            else
            {
                n.MSG = "FALSE";
                n.CODE = "200";

            }
            conn.Close();
            return n;

            /////////////////////////////////////////////////////////////////////////////////////////////
        }
        catch (Exception ex)
        {
            n.MSG = ex.Message;
            n.CODE = "500";
            return n;
        }
        ////////////////////////////////////////
    }




}

///////////////////////////////////







