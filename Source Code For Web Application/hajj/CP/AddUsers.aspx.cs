using MySql.Data.MySqlClient;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

public partial class CP_AddUsers : System.Web.UI.Page
{
	string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {

	}

	public void FillDropdownlist()
	{
		try
		{
			using (MySqlConnection con = new MySqlConnection(connectionString))
			{
				using (MySqlCommand cmd = new MySqlCommand("SELECT name, oid FROM Offices order by oid"))
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
			}
			TbOffice.Items.Insert(0, new ListItem("--Select Office--", "0"));
		}catch(Exception ex)
		{
		}
		}

	protected void BtnAddUser_Click(object sender, EventArgs e)
	{
		try
		{
			MySqlConnection conn = new MySqlConnection(connectionString);
			MySqlConnection conn1 = new MySqlConnection(connectionString);
			int invaldCount=0;
			using (conn)
			{
				string query = "SELECT * FROM USERS WHERE USER=@USER";
				MySqlCommand cmd = new MySqlCommand(query, conn);
				cmd.Parameters.AddWithValue("@USER", TbUsername.Text);
				conn.Open();

				MySqlDataReader dr = cmd.ExecuteReader();

				if (dr.Read())
				{
					invaldCount = 1;
				}
				conn.Close();
			}

			if (invaldCount > 0)
			{
				LblError.Text = "الرجاء التحقق من جميع البيانات المدخلة";
			}
			else
			{
				String insert1 = "INSERT INTO USERS (TYPE,OID,USER, PWD,FULLNAME,EMAIL,MOBILE,ACTIVE,NOTE) VALUES(@Type,@OID,@User,@pwd,@FULLNAME,@Email,@Mobile,@Active,@NOTE)";
				MySqlCommand command = new MySqlCommand(insert1, conn1);
				command.Parameters.AddWithValue("@Type", TbType.Text);
				command.Parameters.AddWithValue("@OID", TbOffice.DataValueField);
				command.Parameters.AddWithValue("@User", TbUsername.Text);
				command.Parameters.AddWithValue("@pwd", TbPassword.Text);
				command.Parameters.AddWithValue("@FULLNAME", TbFullNAME.Text);
				command.Parameters.AddWithValue("@Email", TbEmail.Text);
				command.Parameters.AddWithValue("@Mobile", TbMobile.Text);
				command.Parameters.AddWithValue("@Active", TbActive.Text);
				command.Parameters.AddWithValue("@NOTE", Tbtxtuser.Text);
				using (conn1)
				{
					conn1.Open();
					int result = command.ExecuteNonQuery();
					conn1.Close();
				}
				LblError.Attributes.CssStyle.Add("color", "green");
					LblError.Text = "تم الاضافة بنجاح";
				
			}


		}
		catch (Exception ex)
		{
			LblError.Text = ex.Message;
			//LblError.Text = "حدث خطأ .. إسم المستخدم غير صحيح";
		}

	}

	protected void OnSelectedIndexChanged(object sender, EventArgs e)
	{
		if (TbType.SelectedValue=="2")
		{
			FillDropdownlist();
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