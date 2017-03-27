using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RecipeDetail : System.Web.UI.Page
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
        if (!Page.IsPostBack)
        {
            addNewCategory.Visible = false;
            // bindData();


            /* int idRecipe = Convert.ToInt32(Request["idRecipe"]);
         SqlConnection conn;
         SqlCommand comm;
         SqlDataReader reader;

         string connectionString = ConfigurationManager.ConnectionStrings["RecipePot"].ConnectionString;

         conn = new SqlConnection(connectionString);

         comm = new SqlCommand("SELECT A.idRecipe AS ID, A.name AS Name, B.name AS Category, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author FROM recipe A, category B WHERE B.idCategory = A.idCategory AND A.idRecipe = @idRecipe", conn);
         comm.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int);
         comm.Parameters["@idRecipe"].Value = idRecipe;

         try { 
             conn.Open();
             reader = comm.ExecuteReader();

            recipeList.DataSource = reader;
            recipeList.DataBind();
             reader.Close();

         }
         finally
         {

                 conn.Close();
         }*/

        }

    }

    private void bindData()
    {
        int idRecipe = Convert.ToInt32(Request["idRecipe"]);
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;

        string connectionString = ConfigurationManager.ConnectionStrings["RecipePot"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand("SELECT A.idRecipe AS ID, A.name AS Name, B.name AS Category, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author FROM recipe A, category B WHERE B.idCategory = A.idCategory AND A.idRecipe = @idRecipe", conn);
        comm.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int);
        comm.Parameters["@idRecipe"].Value = idRecipe;

        try
        {
            conn.Open();
            reader = comm.ExecuteReader();

            recipeList.DataSource = reader;
            recipeList.DataBind();
            reader.Close();

        }
        finally
        {

            conn.Close();
        }

    }

   public void recipe_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        recipeList.DataBind();
    }

    public void ModeChanging(Object sender, DetailsViewModeEventArgs e)
    {

        if(e.NewMode == DetailsViewMode.Edit)
        {
            addNewCategory.Visible = true;


        }
            
       

       
    }

    /* protected void recipeList_ItemCommand(object source, DataListCommandEventArgs e)
     {
     OnItemCommand="recipeList_ItemCommand"
         if (e.CommandName == "deleteRecipe")
         {

         DBConnect objConn = new DBConnect();

         SqlConnection myConn = objConn.connect();
         SqlCommand commRecipeIngredient = new SqlCommand("DELETE FROM recipeIngredient WHERE idRecipe = @idRecipe", myConn);
         SqlCommand commRecipe = new SqlCommand("DELETE FROM recipe WHERE idRecipe = @idRecipe", myConn);
         commRecipeIngredient.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int);
         commRecipe.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int);
         commRecipeIngredient.Parameters["@idRecipe"].Value = e.CommandArgument;
         commRecipe.Parameters["@idRecipe"].Value = e.CommandArgument;

             myConn.Open();
             commRecipeIngredient.ExecuteNonQuery();
             commRecipe.ExecuteNonQuery();
             myConn.Close();

             Response.Redirect("ViewRecipe.aspx");

 }

         if(e.CommandName == "editRecipe")
         {

         }
     }*/


    protected void recipe_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Response.Redirect("ViewRecipe.aspx");
    }

    protected void addCategoryButton_Click(object sender, EventArgs e)
    {
        Category newCategory = new Category();
        newCategory.saveCategory(addCategoryText.Text);
        DetailsView1.DataBind();
        addCategoryText.Text = "";
    }
}