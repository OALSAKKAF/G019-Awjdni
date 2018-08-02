using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using QRCoder;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

public partial class hajj_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
            try
            {
                if (Request.QueryString["details"] != null)
                {
                    QueryFunc(Request.QueryString["details"]);
                    TbQRID.Text = Request.QueryString["details"];
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+"حدث خطأ : "+ ex.Message + "')</script>");
            }
        }

    }

    string connectionString = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
    private void QueryFunc(string Qr = "")
    {
        try
        {
            HyperLink1.Text = "";
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            Qr = '%' + Qr.Trim() + '%';
            MySqlCommand cmd = new MySqlCommand(@"SELECT * FROM pilgrims WHERE (QRID LIKE @P1 OR PASSPORTID LIKE @P1 OR
                                                FULLNAME LIKE @P1 OR NATIONALITY LIKE @P1 OR BLOOD LIKE @P1 OR ADDRESS LIKE @P1) AND OID = @OID", conn);
            cmd.Parameters.AddWithValue("@OID", Session["OID"].ToString());
            cmd.Parameters.AddWithValue("@P1", Qr);
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            conn.Close();
            GV1.DataSource = ds;
            GV1.DataBind();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
        
    }
    protected void BtnSearchPilgrim_Click(object sender, EventArgs e)
    {
        QueryFunc(TbQRID.Text);

    }
    protected void GV1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        try
        {
            // cancel the automatic delete action
            e.Cancel = true;
            //TbQRID.Text = e.RowIndex.ToString();
            Label PIDVal = (Label)GV1.Rows[e.RowIndex].FindControl("LblPID");
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            //MySqlCommand cmd = new MySqlCommand("SELECT * FROM groups WHERE user_id = '" + current_user + "'", conn);
            MySqlCommand cmd = new MySqlCommand("DELETE FROM pilgrims WHERE PID = @PID", conn);
            cmd.Parameters.AddWithValue("@PID", PIDVal.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            QueryFunc(TbQRID.Text);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
        
    }
    protected void GV1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            GV1.EditIndex = e.NewEditIndex;
            QueryFunc(TbQRID.Text);
            //bindgridviewguitarbrands();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
    }
    protected void GV1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            //e.Cancel = true;
            GV1.EditIndex = -1;
            QueryFunc(TbQRID.Text);
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
        
    }

    //////////////////////////////////////////////////////////
    public override void VerifyRenderingInServerForm(Control control)
    {
        /*Verifies that the control is rendered */
    }
    ////////////////////////////////////////////////////////////////
    protected void PrintCurrentPage(object sender, EventArgs e)
    {
        try
        {
            GV1.Columns[8].Visible = false;
            GV1.Columns[9].Visible = false;
            GV1.PagerSettings.Visible = false;
            GV1.DataBind();
            QueryFunc(TbQRID.Text);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GV1.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'")
                .Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            GV1.PagerSettings.Visible = true;
            GV1.DataBind();
            QueryFunc(TbQRID.Text);
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            GV1.PageIndex = e.NewPageIndex;
            GV1.DataBind();
            QueryFunc(TbQRID.Text);
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }

    }
    /////////////////////////////////////////////////////////////////////////////////
    protected void GV1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            /////////////////////////////////////////////////////////////////////////////////////////////
            TextBox PID = (TextBox)GV1.Rows[e.RowIndex].FindControl("TbPID");
            TextBox QRID = (TextBox)GV1.Rows[e.RowIndex].FindControl("TbQRIDD");
            TextBox PASSPORTID = (TextBox)GV1.Rows[e.RowIndex].FindControl("TbPASSPORTID");
            TextBox FULLNAME = (TextBox)GV1.Rows[e.RowIndex].FindControl("TbFULLNAME");
            DropDownList NATIONALITY = (DropDownList)GV1.Rows[e.RowIndex].FindControl("DdlNATIONALITY");
            DropDownList BLOOD = (DropDownList)GV1.Rows[e.RowIndex].FindControl("DdlBLOOD");
            TextBox ADDRESS = (TextBox)GV1.Rows[e.RowIndex].FindControl("TbADDRESS");
            QRID.Text = PASSPORTID.Text + NATIONALITY.Text.ToUpper().Substring(0, 4);
            /////////////////////////////////////////////////////////////////////////////////////////////

            //////////////////////////// SAVE Data Form In Pligrm Table /////////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            string query = @"UPDATE pilgrims SET QRID = @QRID, PASSPORTID = @PASSPORTID, FULLNAME = @FULLNAME,
                        NATIONALITY = @NATIONALITY, BLOOD = @BLOOD,ADDRESS = @ADDRESS  WHERE PID = @PID;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@PID", PID.Text);
            cmd.Parameters.AddWithValue("@QRID", QRID.Text);
            //cmd.Parameters.AddWithValue("@OID", TbOID.Text);
            cmd.Parameters.AddWithValue("@PASSPORTID", PASSPORTID.Text);
            cmd.Parameters.AddWithValue("@FULLNAME", FULLNAME.Text);
            cmd.Parameters.AddWithValue("@NATIONALITY", NATIONALITY.SelectedValue);
            cmd.Parameters.AddWithValue("@BLOOD", BLOOD.SelectedValue);
            cmd.Parameters.AddWithValue("@ADDRESS", ADDRESS.Text);
            conn.Open();
            int res = cmd.ExecuteNonQuery();
            if (res == 1)
            {
                //LblError.ForeColor = Color.Green;
                //LblError.Text = "تمت الإضافة بنجاح";
                ////////////////////////////////////////////////////////////////////////////////////////////////
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(QRID.Text, QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                Bitmap qrCodeImage = qrCode.GetGraphic(20);
                string strPath = Server.MapPath(@"~\hajj\QrImg\" + QRID.Text + ".jpg");
                qrCodeImage.Save(strPath, ImageFormat.Jpeg);
                /////////////////////////////////////////////////////////////////////////////////////////////
            }
            else
            {
                //LblError.Text = "حدث خطأ لم تتم الإضافة";
            }

            GV1.EditIndex = -1;
            //GV1.DataBind();
            QueryFunc(TbQRID.Text);
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }

    }
    protected void btnExportWord_Click(object sender, EventArgs e)
    {
        try
        {
            //////////////////////////////////////
            GV1.AllowPaging = false;
            QueryFunc(TbQRID.Text);
            GV1.Columns[8].Visible = false;
            GV1.Columns[9].Visible = false;
            /////////////////////////////////////
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.doc");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            GV1.AllowPaging = false;
            GV1.DataBind();
            QueryFunc(TbQRID.Text);
            //GV1.Columns[8].Visible = false;
            //GV1.Columns[9].Visible = false;

            GV1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

            //////////////////////////////////////
            GV1.Columns[8].Visible = true;
            GV1.Columns[9].Visible = true;
            /////////////////////////////////////
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
        }
        
    }

    public string GetUrlQrCode(string u)
    {
        try
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            url = url.Substring(0, url.IndexOf('/', 7));
            url = url + "/hajj/QrImg/" + u + ".jpg";
            return url;
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");
            return null;
        }
    }

    protected void btnExportPdf_Click(object sender, EventArgs e)
    {
        try
        {
            //////////////////////////////////////
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            string Qr = '%' + TbQRID.Text + '%';
            MySqlCommand cmd = new MySqlCommand(@"SELECT * FROM pilgrims WHERE (QRID LIKE @P1 OR PASSPORTID LIKE @P1 OR
                                            FULLNAME LIKE @P1 OR NATIONALITY LIKE @P1 OR BLOOD LIKE @P1 OR ADDRESS LIKE @P1) AND OID = @OID", conn);
            cmd.Parameters.AddWithValue("@P1", Qr);
            cmd.Parameters.AddWithValue("@OID", Session["OID"].ToString());
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            conn.Close();
            if (ds.Tables[0].Rows.Count != 0)
            {
                QueryFunc(TbQRID.Text);

                Document doc = new Document(PageSize.A7, 0, 0, 10, 10);
                string filename = Session["USER"].ToString() + "-" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() +
                DateTime.Now.Day.ToString() + "-" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + ".pdf";
                PdfWriter pdfWr = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("~/hajj/PDFS/" + filename), FileMode.Create));
                BaseFont bf = BaseFont.CreateFont(Server.MapPath("~/hajj/Content/fonts/TRADBDO.TTF"), BaseFont.IDENTITY_H, true);
                iTextSharp.text.Font font1 = new iTextSharp.text.Font(bf, 10, iTextSharp.text.Font.NORMAL);

                doc.Open();

                /////////////////////////////////////////////////
                int numRows = ds.Tables[0].Rows.Count;
                for (int i = 0; i < numRows; i++)
                {
                    PdfPTable ArTable = new PdfPTable(1);
                    ArTable.RunDirection = PdfWriter.RUN_DIRECTION_RTL;

                    String Val2 = ds.Tables[0].Rows[i]["QRID"].ToString().ToUpper();
                    String Val4 = ds.Tables[0].Rows[i]["FULLNAME"].ToString().ToUpper();
                    String Val5 = ds.Tables[0].Rows[i]["NATIONALITY"].ToString().ToUpper();
                    String Val6 = ds.Tables[0].Rows[i]["BLOOD"].ToString().ToUpper();

                    iTextSharp.text.Image JPG1 = iTextSharp.text.Image.GetInstance(Server.MapPath("~/hajj/QrImg/" + Val2 + ".jpg"));

                    Phrase text2 = new Phrase(Val2, font1);
                    Phrase text4 = new Phrase(Val4, font1);
                    Phrase text5 = new Phrase(Val5, font1);
                    Phrase text6 = new Phrase(Val6, font1);

                    PdfPCell Cell2 = new PdfPCell(text2);
                    PdfPCell Cell4 = new PdfPCell(text4);
                    PdfPCell Cell5 = new PdfPCell(text5);
                    PdfPCell Cell6 = new PdfPCell(text6);

                    Cell2.HorizontalAlignment = Element.ALIGN_CENTER;
                    Cell4.HorizontalAlignment = Element.ALIGN_CENTER;
                    Cell5.HorizontalAlignment = Element.ALIGN_CENTER;
                    Cell6.HorizontalAlignment = Element.ALIGN_CENTER;

                    JPG1.BorderWidth = 0f;
                    Cell2.BorderWidthTop = 0f;
                    Cell2.BorderWidthBottom = 0f;
                    Cell4.BorderWidthBottom = 0f;

                    ArTable.AddCell(JPG1);
                    ArTable.AddCell(Cell2);
                    ArTable.AddCell(Cell4);
                    ArTable.AddCell(Cell5);

                    doc.Add(ArTable);
                }

                doc.Close();

                HyperLink1.NavigateUrl = String.Format("~/hajj/PDFS/{0}", filename);
                HyperLink1.Text = "تم إنشاء الملف بإمكانك حفظ الملف من هنا ..";
            }
            else
            {
                Response.Write("<script>alert('" + "حدث خطأ : لاتوجد بيانات مدخلة في النظام" + "')</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + "حدث خطأ : " + ex.Message + "')</script>");

        }

    }

    
}