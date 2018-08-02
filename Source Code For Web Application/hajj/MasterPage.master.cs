using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hajj_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USER"] == null)
        {
            Response.Redirect("LoginUsers.aspx",false);
        }
        else if (Session["TYPE"].ToString() != "2")
        {
            Response.Redirect("AccessDenied.aspx", false);
        }
        else
        {
            LblUsr.Text = Session["USER"].ToString();
            //((Label)Master.FindControl("LblUsr")).Text = Session["USER"].ToString();

        }

    }
}
