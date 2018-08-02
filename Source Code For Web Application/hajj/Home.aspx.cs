using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hajj_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnAddPilgrim_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddPilgrim.aspx");
    }

    protected void BtnManagePligrim_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchPilgrim.aspx");
    }

    protected void BtnNotes_Click(object sender, EventArgs e)
    {
        Response.Redirect("Notes.aspx");
    }
}