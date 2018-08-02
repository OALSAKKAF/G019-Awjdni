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

public partial class CP_EditOffice : System.Web.UI.Page
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
				String query = "select * from Offices where oid=@oid";
				MySqlCommand com = new MySqlCommand(query, con);
				com.Parameters.AddWithValue("@oid", s1);
				MySqlDataReader reader;
				reader = com.ExecuteReader();
				if (reader.Read())
				{
					TbOfficeNum.Text = reader["LIC_NUM"].ToString();
					TbOfficename.Text = reader["NAME"].ToString();
					TbAddress.Text = reader["ADDRESS"].ToString();
					TbPhone.Text = reader["PHONE"].ToString();
					TbMobile.Text = reader["MOBILE"].ToString();
				}
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
		}
}

	protected void BtnUpdate_Click(object sender, EventArgs e)
	{
		try
		{
			MySqlConnection conn = new MySqlConnection(connectionString);
			String s1 = Request.QueryString[0];
			String insert1 = "Update Offices SET LIC_NUM = @LIC_NUM, NAME = @NAME, ADDRESS = @ADDRESS, PHONE = @PHONE, MOBILE=@MOBILE WHERE oid =@OID";
			MySqlCommand command = new MySqlCommand(insert1, conn);
			command.Parameters.AddWithValue("@LIC_NUM", TbOfficeNum.Text);
			command.Parameters.AddWithValue("@NAME", TbOfficename.Text);
			command.Parameters.AddWithValue("@ADDRESS", TbAddress.Text);
			command.Parameters.AddWithValue("@PHONE", TbPhone.Text);
			command.Parameters.AddWithValue("@MOBILE", TbMobile.Text);
			command.Parameters.AddWithValue("@OID",s1);
			MySqlDataReader MyReader;

				conn.Open();
				MyReader = command.ExecuteReader();
				while (MyReader.Read())
				{
				}
				conn.Close();


			LblConfirm.Text = "تم التحديث بنجاح";



		}
		catch (Exception ex)
		{
			LblConfirm.Visible = false;
			LblError.Visible = true;
			LblError.Text = "حدث خطأ .. عند تحديث البيانات";
		}
	}
}
