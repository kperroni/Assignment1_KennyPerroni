using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewRecipe : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            BindList();
        }

    }

    protected void BindList()
    {

        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;

        string connectionString = ConfigurationManager.ConnectionStrings["RecipePot"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand("SELECT A.idRecipe, A.name AS Name, B.name AS Category, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author FROM recipe A, category B WHERE B.idCategory = A.idCategory", conn);

        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            recipeList.DataSource = reader;
            recipeList.DataBind();
            reader.Close();

        }
        catch
        {

        }
        finally
        {
            conn.Close();
        }
    }

    protected void recipeList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "recipeDetails")
        {
            Response.Redirect("RecipeDetail.aspx?idRecipe="+ e.CommandArgument);

        }
    }
}