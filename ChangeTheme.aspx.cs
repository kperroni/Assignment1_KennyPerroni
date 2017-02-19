using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeTheme : System.Web.UI.Page
{
    void Page_PreInit(Object sender, EventArgs e)
    {

        HttpCookie auxCookie;
        auxCookie = Request.Cookies["themeSelected"];

        if (auxCookie != null)
            Page.Theme = auxCookie.Value;

        else
        {
            string theme = (string)Session["theme"];

            if (theme != null)
            {
                Page.Theme = theme;
            }

            else
                Page.Theme = "Light";
        }


    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void changeTheme_Click(object sender, ImageClickEventArgs e)
    {

        if (light.Checked)        
            Session["theme"] = "Light";
        

        else
            if(dark.Checked)
            Session["theme"] = "Dark";

        HttpCookie themeCookie;
        themeCookie = Request.Cookies["themeSelected"];

        if (themeCookie == null)
        {
            themeCookie = new HttpCookie("themeSelected", (string)Session["theme"]);
            themeCookie.Expires = DateTime.Now.AddMonths(1);
            Response.Cookies.Add(themeCookie);
        }
        else
        {
            themeCookie.Value = (string)Session["theme"];
            Response.Cookies.Add(themeCookie);
        }

        Response.Redirect("Home.aspx");
    }
}