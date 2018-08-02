using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hajj_ViewPligmNote : System.Web.UI.Page
{
	string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

	protected void Page_Load(object sender, EventArgs e)
    {
		//if (!IsPostBack)
		//{
			try
			{
				MySqlConnection conn = new MySqlConnection(connectionString);
				string query = "select NID,PASSPORTID,Pilgrims.FULLNAME As PNAME,NATIONALITY,BLOOD,Pilgrims.ADDRESS As HOTEL,TYPEN,TXTNOTE,(select FULLNAME from Users where uid = Notes.uid) As writter,(select MOBILE from Users where uid=Notes.uid) As Wmobile,UPDATEDATE from Pilgrims,Notes,Users where Pilgrims.OID=Users.OID AND Notes.QRID=Pilgrims.QRID AND Users.OID=@OID AND UPDATEDATE=(select MAX(UPDATEDATE) from Notes where QRID=Pilgrims.QRID)";
				MySqlCommand cmd = new MySqlCommand(query, conn);
				cmd.Parameters.AddWithValue("@OID", Session["OID"].ToString());
				conn.Open();
				DataTable dt = new DataTable();
				MySqlDataAdapter da = new MySqlDataAdapter(cmd);
				da.Fill(dt);
				GridView1.DataSource = dt;
				GridView1.DataBind();
				conn.Close();
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
		//}
	}
}