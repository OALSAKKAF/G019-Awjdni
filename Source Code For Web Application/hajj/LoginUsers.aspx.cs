using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;

public partial class hajj_LoginUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
    }
    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection conn = new MySqlConnection(connectionString);

            string query = "SELECT * FROM USERS WHERE USER=@USER AND PWD=@PWD";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@USER", TextBox1.Text);
            cmd.Parameters.AddWithValue("@PWD", TextBox2.Text);
            //cmd.Parameters.AddWithValue("TYPE", "1");
            conn.Open();

            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["USER"] = dr["USER"].ToString();
                Session["UID"] = dr["UID"].ToString();
                Session["TYPE"] = dr["TYPE"].ToString();
                Session["FULLNAME"] = dr["FULLNAME"].ToString();
                Session["ACTIVE"] = dr["ACTIVE"].ToString();
				Session["OID"] = dr["OID"].ToString();

                


                if (Session["TYPE"].ToString() == "1" && Session["ACTIVE"].ToString() == "1")
                {
                    Response.Redirect("CP/Home.aspx", false);
                }
				else if (Session["TYPE"].ToString() == "2" && Session["ACTIVE"].ToString() == "1")
				{
                    MySqlConnection conn1 = new MySqlConnection(connectionString);
                    string query1 = "SELECT * FROM Offices WHERE OID=@OID";
                    MySqlCommand cmd1 = new MySqlCommand(query1, conn1);
                    cmd1.Parameters.AddWithValue("@OID", Session["OID"].ToString());
                    conn1.Open();
                    MySqlDataReader dr1 = cmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        Session["UOID"] = dr1["OID"].ToString();
                        Session["LIC_NUM"] = dr1["LIC_NUM"].ToString();
                        Session["NAME"] = dr1["NAME"].ToString();
                        Session["ADDRESS"] = dr1["ADDRESS"].ToString();
                        Session["PHONE"] = dr1["PHONE"].ToString();
                        Session["MOBILE"] = dr1["MOBILE"].ToString();
                    }
                    dr1.Close();
                    conn1.Close();
                    Response.Redirect("Home.aspx", false);
                }
				else
				{
                    Response.Redirect("AccessDenied.aspx", false);
                }

                
            }
                if (dr.HasRows == false)
                LblError.Text = "حدث خطأ .. إسم المستخدم أو كلمة المرور غير صحيحة";

            dr.Close();
            conn.Close();


        }
        catch (Exception ex)
        {
            LblError.Text = "حدث خطأ .. إسم المستخدم أو كلمة المرور غير صحيحة";
            //LblError.Text = "حدث خطأ .. إسم المستخدم غير صحيح";
        }

    }
}