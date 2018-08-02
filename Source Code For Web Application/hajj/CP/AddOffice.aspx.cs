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

public partial class CP_AddOffice : System.Web.UI.Page
{
	string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {
		
}


	protected void BtnAddOffice_Click(object sender, EventArgs e)
	{
		try
		{
			MySqlConnection conn = new MySqlConnection(connectionString);

			String insert1 = "INSERT INTO Offices (LIC_NUM, NAME,ADDRESS,PHONE,MOBILE) VALUES(@LIC_NUM,@NAME,@ADDRESS,@PHONE,@MOBILE)";
			MySqlCommand command = new MySqlCommand(insert1, conn);
			command.Parameters.AddWithValue("@LIC_NUM", TbOfficeNum.Text);
			command.Parameters.AddWithValue("@NAME", TbOfficename.Text);
			command.Parameters.AddWithValue("@ADDRESS", TbAddress.Text);
			command.Parameters.AddWithValue("@PHONE", TbPhone.Text);
			command.Parameters.AddWithValue("@MOBILE", TbMobile.Text);
			using (conn)
			{
				conn.Open();
				int result = command.ExecuteNonQuery();
				conn.Close();
			}
			
				LblConfirm.Text = "تم الاضافة بنجاح";
			



		}
		catch (Exception ex)
		{
			LblConfirm.Visible = false;
			LblError.Visible = true;
			LblError.Text = "حدث خطأ .. عند ادخال البيانات";
		}

	}

}
