using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.IO;

public partial class hajj_AddPilgrim : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["USER"] != null && Session["UID"] != null && Session["OID"] != null && Session["NAME"] != null && Session["ADDRESS"] != null && Session["PHONE"] != null && Session["MOBILE"] != null)
            {
                TbUID.Text = Session["UID"].ToString();
                TbOID.Text = Session["OID"].ToString();
                TbNAME.Text = Session["NAME"].ToString();
                TbADDRESSOff.Text = Session["ADDRESS"].ToString();
                TbPHONE.Text = Session["PHONE"].ToString();
                TbMOBILE.Text = Session["MOBILE"].ToString();
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
    }
    private void QrId()
    {
        try
        {
            ////////////////////////////////////////////////////////////////////////////////////////////
            TbQRID.Text = TbPASSPORTID.Text + DdlNATIONALITY.SelectedValue.ToUpper().Substring(0, 4);
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(TbQRID.Text, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);
            string strPath = Server.MapPath(@"~\hajj\QrImg\" + TbQRID.Text + ".jpg");
            //Bitmap resized = new Bitmap(qrCodeImage, new Size(100, 100));
            qrCodeImage.Save(strPath, ImageFormat.Jpeg);
            ImgQRID.ImageUrl = @"~\hajj\QrImg\"+ TbQRID.Text + ".jpg";
            /////////////////////////////////////////////////////////////////////////////////////////////
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
    }
    protected void TbPASSPORTID_TextChanged(object sender, EventArgs e)
    {
        if (TbPASSPORTID.Text != "" && DdlNATIONALITY.SelectedValue != "0")
        {
            QrId();
        }

    }

    protected void DdlNATIONALITY_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (TbPASSPORTID.Text != "" && DdlNATIONALITY.SelectedValue != "0")
        {
            QrId();
        }
    }

    protected void BtnAddPilgrim_Click(object sender, EventArgs e)
    {
        try
        {
            bool fileExists = (System.IO.File.Exists(Server.MapPath(@"~\hajj\MCR\") + TbQRID.Text + ".jpg") ? true : false);
            if (fileExists == false)
            {
                goto fileExists;
            }
            

            //////////////////////////// SAVE QR CODE IMG WITH NAME QRID /////////////////////////////////
            QrId();
            //////////////////////////// SAVE Data Form In Pligrm Table /////////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            string query = @"INSERT INTO `pilgrims` (`PID`, `QRID`, `OID`, `PASSPORTID`, `FULLNAME`, `NATIONALITY`, `BLOOD`, `ADDRESS`) 
                            VALUES(NULL, @QRID, @OID, @PASSPORTID, @FULLNAME, @NATIONALITY, @BLOOD , @ADDRESS);";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@QRID", TbQRID.Text);
            cmd.Parameters.AddWithValue("@OID", TbOID.Text);
            cmd.Parameters.AddWithValue("@PASSPORTID", TbPASSPORTID.Text);
            cmd.Parameters.AddWithValue("@FULLNAME", TbFULLNAME.Text);
            cmd.Parameters.AddWithValue("@NATIONALITY", DdlNATIONALITY.SelectedValue);
            cmd.Parameters.AddWithValue("@BLOOD", DdlBLOOD.SelectedValue);
            cmd.Parameters.AddWithValue("@ADDRESS", TbADDRESS.Text);
            ////////////////////////////////////////////////////////
            conn.Open();
            int res = cmd.ExecuteNonQuery();
            if (res == 1)
            {
                LblError.ForeColor = Color.Green;
                LblError.Text = "تمت الإضافة بنجاح";
                Response.Write("<script>alert('تمت الإضافة بنجاح')</script>");

                conn.Close();
            }
            else
            {
                LblError.ForeColor = Color.Red;
                LblError.Text = "حدث خطأ لم تتم الإضافة";
                Response.Write("<script>alert('حدث خطأ لم تتم الإضافة')</script>");

            }
            ///////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////// SAVE Data Form In medical_rec Table /////////////////////////////////
            //  
            int i = 0;
            while (i <= 7)
            {
                if (CHKL1.Items[i].Selected)
                {
                    string query1 = @"INSERT INTO `medical_rec` (`MRID`, `QRID`, `UID`, `OID`, `UPDATEDATE`, `MRTYPE`, `MRVALUE`)
                            VALUES (NULL, @QRID, @UID, @OID, CURRENT_TIMESTAMP, @MRTYPE, @MRVALUE);";
                    MySqlCommand cmd1 = new MySqlCommand(query1, conn);
                    cmd1.Parameters.AddWithValue("@QRID", TbQRID.Text);
                    cmd1.Parameters.AddWithValue("@UID", TbUID.Text);
                    cmd1.Parameters.AddWithValue("@OID", TbOID.Text);
                    cmd1.Parameters.AddWithValue("@MRTYPE", i.ToString());
                    if (i == 0)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "سكري");
                    if (i == 1)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "ضغط");
                    if (i == 2)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "إلتهاب كبير");
                    if (i == 3)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "أمراض تنفسية");
                    if (i == 4)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "أعمى");
                    if (i == 5)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "فاقد سمع");
                    if (i == 6)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "مشلول");
                    if (i == 7)
                        cmd1.Parameters.AddWithValue("@MRVALUE", "أخرى");

                    conn.Open();
                    int res1 = cmd1.ExecuteNonQuery();
                    if (res1 == 1)
                    {
                        LblError.ForeColor = Color.Green;
                        LblError.Text = "تمت الإضافة بنجاح";
                        conn.Close();
                        
                    }
                    else
                    {
                        LblError.ForeColor = Color.Red;
                        LblError.Text = "حدث خطأ لم تتم الإضافة";
                    }
                    
                }
                i++;
            }
            goto EndStatment;


        }
            /////////////////////////////////////////////////////////////////////////////////////////////
        
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }

        fileExists:
        LblUpload.Text = "لم يتم تحميل التقرير";

        EndStatment:
        lbl.Text = "";
        LblUpload.Text = "";
        ///////
        LblError.ForeColor = Color.Green;
        LblError.Text = "تمت الإضافة بنجاح";
        
    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {
        QrId();
        if (FileUpload1.HasFile)
        {
            try
            {
                string[] TypeImg = Path.GetFileName(FileUpload1.FileName).Split('.');

                if (TypeImg[1] != "jpg")
                {
                    goto fileType;
                }
                if (TbQRID.Text == "")
                {
                    LblUpload.Text = "يرجى تعبئة المعلومات الشخصية قبل رفع التقرير";
                    LblUpload.ForeColor = Color.Red;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath(@"~\hajj\MCR\") + TbQRID.Text + ".jpg");
                    goto TruUpload;
                }

                fileType:
                LblUpload.ForeColor = Color.Red;
                LblUpload.Text = "يجب أن يكون إمتداد الصورة jpg";
                goto EndStatment;

                TruUpload:
                LblUpload.ForeColor = Color.Green;
                LblUpload.Text = "تم تحميل الملف بنجاح";
                BtnAddPilgrim.Enabled = true;

                EndStatment:
                lbl.Text = "";
            }
            catch (Exception ex)
            {
                LblUpload.Text = "حدث خطأ لم يتم تحميل الملف " + ex.Message;
                LblUpload.ForeColor = Color.Red;

            }
        }
        else
        {
            LblUpload.Text = "يرجى تحديد التقرير أولاً بإمتداد jpg ";
            LblUpload.ForeColor = Color.Red;
        }
    }


}