using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hajj_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        QueryFunc();
    }
    private void QueryFunc(string Qr = "")
    {

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            if (Session["OID"] != null)
                Qr = Session["OID"].ToString();

            MySqlCommand cmd = new MySqlCommand(@"SELECT QRID,NID,UID,OID
                                            ,(SELECT NAME FROM OFFICES WHERE OID = N.OID) AS NAME
                                            ,(SELECT FULLNAME FROM USERS WHERE UID = N.UID) AS FULLNAME
                                            ,UPDATEDATE,TYPEN,
                                            (SELECT TYPEV FROM TYPES WHERE TYPEN = N.TYPEN) AS TYPEV
                                            ,(SELECT COUNT(QRID) FROM NOTES WHERE QRID = N.QRID) as COUNTQRID
                                            ,TXTNOTE,LOC FROM NOTES AS N
                                            WHERE NID = (SELECT MAX(NID) FROM notes WHERE QRID = N.QRID GROUP BY QRID)
                                            AND OID = @OID
                                            GROUP BY QRID
                                            ORDER BY UPDATEDATE DESC", conn);

            cmd.Parameters.AddWithValue("@OID", Qr);
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            conn.Close();

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Response.Write("<script>alert('حدث خطأ :  لاتوجد ملاحظات')</script>");

                //P1.Visible = false;
                //Response.Redirect("Home.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('حدث خطأ :  لاتوجد ملاحظات');window.location ='Home.aspx';",
                true);
            }
            else
            {
                GV1.DataSource = ds;
                GV1.DataBind();
                P1.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
    }
}