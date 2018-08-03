using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hajj_AddNotes : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    public static String QRIDV;
    public void QueryTypesDdl()
    {
        try
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            String query2 = @"SELECT * FROM TYPES";
            MySqlCommand com2 = new MySqlCommand(query2, con);
            MySqlDataAdapter adapter = new MySqlDataAdapter(com2);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DDLStatus.DataSource = dt;
            DDLStatus.DataBind();
            DDLStatus.DataTextField = "TYPEV";
            DDLStatus.DataValueField = "TYPEN";
            DDLStatus.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }

    }
    public void QueryFunc(string qr)
    {
        try
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            String query2 = @"SELECT 
                            NID,QRID,UID,
                            (SELECT FULLNAME FROM USERS WHERE UID = N.UID) AS FULLNAME,
                            UPDATEDATE,TYPEN,
                            (SELECT TYPEV FROM TYPES WHERE TYPEN = N.TYPEN) AS TYPEV,
                            TXTNOTE,LOC
                            FROM NOTES AS N WHERE QRID = @QRID ORDER BY UPDATEDATE DESC";
            MySqlCommand com2 = new MySqlCommand(query2, con);
            com2.Parameters.AddWithValue("@QRID", QRIDV);
            MySqlDataAdapter adapter = new MySqlDataAdapter(com2);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            GV1.DataSource = ds;
            GV1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        QRIDV = Request.QueryString["details"];
        if (QRIDV != null)
        {
            if (!IsPostBack)
            {
                try
                {
                    QueryTypesDdl();
                    MySqlConnection con = new MySqlConnection(connectionString);
                    con.Open();
                    //String query = "select Notes.QRID, PASSPORTID, Pilgrims.FULLNAME As PNAME,NATIONALITY,BLOOD,Pilgrims.ADDRESS As HOTEL,TYPEN,TXTNOTE,(select FULLNAME from Users where uid = Notes.uid) As writter,(select MOBILE from Users where uid = Notes.uid) As Wmobile, UPDATEDATE from Pilgrims, Notes, Users where Pilgrims.OID = Users.OID AND Notes.QRID = Pilgrims.QRID AND Notes.NID = @NID";
                    String query = @"SELECT * FROM pilgrims where QRID = @QRID";
                    MySqlCommand com = new MySqlCommand(query, con);
                    com.Parameters.AddWithValue("@QRID", QRIDV);
                    MySqlDataReader reader;
                    reader = com.ExecuteReader();
                    if (reader.HasRows == false)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('حدث خطأ :  لا توجد بيانات خاصة بالحاج');window.location ='Home.aspx';",
                        true);
                    }
                    if (reader.Read())
                    {
                        TbPass.Text = reader["PASSPORTID"].ToString();
                        TbName.Text = reader["FULLNAME"].ToString();
                        TbNatio.Text = reader["NATIONALITY"].ToString();
                        TbBlood.Text = reader["BLOOD"].ToString();
                        TbAddress.Text = reader["ADDRESS"].ToString();
                        //TbStatus.SelectedValue = reader["TYPEN"].ToString();
                        TbDate.Text = DateTime.Now.ToString();

                    }
                    con.Close();
                    QueryFunc(QRIDV);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('حدث خطأ :  لا يمكن الدخول المباشر للصفحة');window.location ='Home.aspx';",
                true);

        }

    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection conn = new MySqlConnection(connectionString);
            String s1 = DDLStatus.SelectedItem.Value;
            String insert1 = "INSERT INTO Notes (QRID,UID,OID,TYPEN,TXTNOTE,LOC) VALUES(@QRID,@UID,@OID,@TYPEN,@TXTNOTE,@LOC)";
            MySqlCommand command = new MySqlCommand(insert1, conn);
            command.Parameters.AddWithValue("@QRID", QRIDV);
            command.Parameters.AddWithValue("@UID", Session["UID"].ToString());
            command.Parameters.AddWithValue("@OID", Session["OID"].ToString());
            command.Parameters.AddWithValue("@TYPEN", s1);
            //command.Parameters.AddWithValue("@TXTNOTE", Request.Form["TextNote"]);
            command.Parameters.AddWithValue("@TXTNOTE", TbTextNote.Text);
            string loc = "21.6172743" + "," + "39.1561181";
            command.Parameters.AddWithValue("@LOC", loc);

            MySqlDataReader MyReader;

            conn.Open();
            MyReader = command.ExecuteReader();
            while (MyReader.Read())
            {
            }
            conn.Close();

            LblConfirm.Text = "تمت إضافة الملاحظة";
            QueryFunc(QRIDV);



        }
        catch (Exception ex)
        {
            LblConfirm.Visible = false;
            LblError.Visible = true;
            LblError.Text = ex.Message;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Script1", "getLocation();", true);
    }
}