using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_UsersManag : System.Web.UI.Page
{
	string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

	protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			ReloadPage();

		}
	}
	protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		// cancel the automatic delete action
		e.Cancel = true;
		//TbQRID.Text = e.RowIndex.ToString();
		String UIDVAL =GridView1.Rows[e.RowIndex].Cells[0].Text;
		MySqlConnection conn = new MySqlConnection(connectionString);
		conn.Open();
		//MySqlCommand cmd = new MySqlCommand("SELECT * FROM groups WHERE user_id = '" + current_user + "'", conn);
		MySqlCommand cmd = new MySqlCommand("DELETE FROM Users WHERE UID = @UID", conn);
		cmd.Parameters.AddWithValue("@UID", UIDVAL);
		cmd.ExecuteNonQuery();
		conn.Close();
		ReloadPage();

	}
	public void ReloadPage()
	{
		using (MySqlConnection con = new MySqlConnection(connectionString))
		{
			MySqlConnection conn = new MySqlConnection(connectionString);
			string query = @"select Users.UID ,USER, TYPE, Offices.ADDRESS ,Offices.NAME,Offices.MOBILE As OffMobile ,Users.MOBILE,FULLNAME,EMAIL,REPLACE(REPLACE(ACTIVE,1,'مفعل'),0,'معطل') AS ACTIVE,PWD from Users LEFT JOIN Offices ON Users.OID = Offices.OID order by Users.UID";
			MySqlCommand cmd = new MySqlCommand(query, conn);
			conn.Open();
			DataTable dt = new DataTable();
			MySqlDataAdapter da = new MySqlDataAdapter(cmd);
			da.Fill(dt);
			GridView1.DataSource = dt;
			GridView1.DataBind();
			conn.Close();
		}
	}
	protected void OnPaging(object sender, GridViewPageEventArgs e)
	{
		GridView1.PageIndex = e.NewPageIndex;
		GridView1.DataBind();
		ReloadPage();
	}

}