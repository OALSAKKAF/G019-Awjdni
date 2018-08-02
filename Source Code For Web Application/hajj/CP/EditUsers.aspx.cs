using MySql.Data.MySqlClient;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_EditUsers : System.Web.UI.Page
{
	string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			try
			{
				MySqlConnection con = new MySqlConnection(connectionString);
				con.Open();
				String s1 = Request.QueryString[0];
				String query = "select * from Users where Users.uid=@uid;";
				MySqlCommand com = new MySqlCommand(query, con);
				com.Parameters.AddWithValue("@uid", s1);
				MySqlDataReader reader;
				reader = com.ExecuteReader();
				if (reader.Read())
				{
					TbUsername.Text = reader["USER"].ToString();
					TbType.SelectedValue = reader["TYPE"].ToString();
					TbOffice.DataValueField = reader["OID"].ToString();
					TbMobile.Text = reader["MOBILE"].ToString();
					TbFullNAME.Text = reader["FULLNAME"].ToString();
					TbEmail.Text = reader["EMAIL"].ToString();
					TbActive.Text = reader["ACTIVE"].ToString();
					TbPassword.Text= reader["PWD"].ToString();

				}
				FillDropdownlist();
				if (TbType.SelectedValue == "2")
				{
					lblOffice.Visible = true;
					TbOffice.Visible = true;
				}
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
		}
}
	public void FillDropdownlist()
	{
		using (MySqlConnection con = new MySqlConnection(connectionString))
		{
			using (MySqlCommand cmd = new MySqlCommand("SELECT name, oid FROM Offices"))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Connection = con;
				con.Open();
				TbOffice.DataSource = cmd.ExecuteReader();
				TbOffice.DataTextField = "name";
				TbOffice.DataValueField = "oid";
				TbOffice.DataBind();
				con.Close();
			}
			if (TbType.SelectedValue !="2")
			{
				TbOffice.Items.Insert(0, new ListItem("--Select Office--", "0"));
			}
		}
		//TbOffice.Items.Insert(0, new ListItem("--Select Office--", "0"));
	}
	protected void BtnUpdate_Click(object sender, EventArgs e)
	{
		try
		{
			MySqlConnection conn = new MySqlConnection(connectionString);
			String s1 = Request.QueryString[0];
			String insert1 = "Update Users SET TYPE=@TYPE,OID=@OID,USER=@USER, PWD=@PWD,FULLNAME=@FULLNAME,EMAIL=@EMAIL,MOBILE=@MOBILE,ACTIVE=@ACTIVE,NOTE=@NOTE WHERE uid =@UID";
			MySqlCommand command = new MySqlCommand(insert1, conn);
			command.Parameters.AddWithValue("@TYPE", TbType.SelectedValue);
			command.Parameters.AddWithValue("@OID", TbOffice.SelectedValue);
			command.Parameters.AddWithValue("@USER", TbUsername.Text);
			command.Parameters.AddWithValue("@PWD", TbPassword.Text);
			command.Parameters.AddWithValue("@FULLNAME", TbFullNAME.Text);
			command.Parameters.AddWithValue("@EMAIL", TbEmail.Text);
			command.Parameters.AddWithValue("@MOBILE", TbMobile.Text);
			command.Parameters.AddWithValue("@ACTIVE", TbActive.SelectedValue);
			command.Parameters.AddWithValue("@NOTE", Tbtxtuser.Text);

			command.Parameters.AddWithValue("@UID",s1);
			MySqlDataReader MyReader;

				conn.Open();
				MyReader = command.ExecuteReader();
				while (MyReader.Read())
				{
				}
				conn.Close();
			LblError.Attributes.CssStyle.Add("color", "green");
			LblError.Text = "تم التحديث بنجاح";



		}
		catch (Exception ex)
		{
			LblError.Text = ex.Message;
		}
	}
	protected void OnSelectedIndexChanged(object sender, EventArgs e)
	{
		if (TbType.SelectedValue == "2")
		{
			lblOffice.Visible = true;

			TbOffice.Visible = true;
		}
		else
		{
			lblOffice.Visible = false;

			TbOffice.Visible = false;

		}
	}
}
