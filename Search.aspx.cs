using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
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
        if (!IsPostBack) { 
        loadCategories();
        loadSubmitters();
        loadIngredients();
        }

    }

    private void loadCategories()
    {
        category.Items.Clear();
        category.Items.Insert(0, new ListItem("All", "0"));
        CategoryHandler categoryHandler = new CategoryHandler();
        List<Category> myCategories = categoryHandler.getCategories();
        int i = 1;

        foreach (Category thisCategory in myCategories)
        {

            category.Items.Insert(i, new ListItem(thisCategory.name, thisCategory.id.ToString()));
            i++;
        }

    }

    private void loadSubmitters()
    {
        submittedBy.Items.Clear();
        submittedBy.Items.Insert(0, new ListItem("All", "0"));
        RecipeHandler recipeHandler = new RecipeHandler();
        List<string> submitters = recipeHandler.getSubmitters();
        int i = 1;

        foreach (String thisSubmitter in submitters)
        {

            submittedBy.Items.Insert(i, new ListItem(thisSubmitter, i.ToString()));
            i++;

        }

    }

    private void loadIngredients()
    {
        ingredient.Items.Clear();
        ingredient.Items.Insert(0, new ListItem("All", "0"));
        IngredientHandler ingredientHandler = new IngredientHandler();
        List<Ingredient> myIngredients = ingredientHandler.getIngredients();
        int i = 1;

        foreach (Ingredient thisIngredient in myIngredients)
        {

            ingredient.Items.Insert(i, new ListItem(thisIngredient.name, thisIngredient.id.ToString()));
            i++;

        }
    }

    protected void searchRecipe_Click(object sender, ImageClickEventArgs e)
    {
        
        SqlConnection conn;
        SqlCommand comm = new SqlCommand("SELECT");
        SqlDataReader reader;

        string connectionString = ConfigurationManager.ConnectionStrings["RecipePot"].ConnectionString;

        conn = new SqlConnection(connectionString);

        //000
        if(submittedBy.SelectedValue.ToString() == "0" && category.SelectedValue.ToString() == "0" && ingredient.SelectedValue.ToString() == "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B WHERE A.idCategory = B.idCategory", conn);         
        }

        //001
        if (submittedBy.SelectedValue.ToString() == "0" && category.SelectedValue.ToString() == "0" && ingredient.SelectedValue.ToString() != "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B, ingredient C, recipeIngredient D WHERE A.idCategory = B.idCategory AND C.idIngredient = @idIngredient AND D.idIngredient = @idIngredient AND D.idRecipe = A.idRecipe", conn);
            comm.Parameters.Add("@idIngredient", System.Data.SqlDbType.Int).Value = Convert.ToInt32(ingredient.SelectedValue);
        }

        //010
        if (submittedBy.SelectedValue.ToString() == "0" && category.SelectedValue.ToString() != "0" && ingredient.SelectedValue.ToString() == "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B WHERE A.idCategory = @idCategory AND A.idCategory = B.idCategory", conn);
            comm.Parameters.Add("@idCategory", System.Data.SqlDbType.Int).Value = Convert.ToInt32(category.SelectedValue);
        }

        //011
        if (submittedBy.SelectedValue.ToString() == "0" && category.SelectedValue.ToString() != "0" && ingredient.SelectedValue.ToString() != "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B, ingredient C, recipeIngredient D WHERE A.idCategory = @idCategory AND A.idCategory = B.idCategory  AND C.idIngredient = @idIngredient AND D.idIngredient = @idIngredient AND D.idRecipe = A.idRecipe", conn);
            comm.Parameters.Add("@idIngredient", System.Data.SqlDbType.Int).Value = Convert.ToInt32(ingredient.SelectedValue);
            comm.Parameters.Add("@idCategory", System.Data.SqlDbType.Int).Value = Convert.ToInt32(category.SelectedValue);
        }

        //100
        if (submittedBy.SelectedValue.ToString() != "0" && category.SelectedValue.ToString() == "0" && ingredient.SelectedValue.ToString() == "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B WHERE A.idCategory = B.idCategory AND submittedBy = @submittedBy", conn);
            comm.Parameters.Add("@submittedBy", System.Data.SqlDbType.VarChar).Value = (submittedBy.SelectedItem.Text);
        }

        //101
        if (submittedBy.SelectedValue.ToString() != "0" && category.SelectedValue.ToString() == "0" && ingredient.SelectedValue.ToString() != "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B, ingredient C, recipeIngredient D WHERE A.submittedBy = @submittedBy AND B.idCategory = A.idCategory AND C.idIngredient = @idIngredient AND D.idIngredient = @idIngredient AND D.idRecipe = A.idRecipe", conn);
            comm.Parameters.Add("@submittedBy", System.Data.SqlDbType.VarChar).Value = (submittedBy.SelectedItem.Text);
            comm.Parameters.Add("@idIngredient", System.Data.SqlDbType.Int).Value = Convert.ToInt32(ingredient.SelectedValue);
        }

        //110
        if (submittedBy.SelectedValue.ToString() != "0" && category.SelectedValue.ToString() != "0" && ingredient.SelectedValue.ToString() == "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B WHERE A.submittedBy = @submittedBy AND B.idCategory = @idCategory AND B.idCategory = A.idCategory ", conn);
            comm.Parameters.Add("@submittedBy", System.Data.SqlDbType.VarChar).Value = (submittedBy.SelectedItem.Text);
            comm.Parameters.Add("@idCategory", System.Data.SqlDbType.Int).Value = Convert.ToInt32(category.SelectedValue);

        }  

        //111
        if (submittedBy.SelectedValue.ToString() != "0" && category.SelectedValue.ToString() != "0" && ingredient.SelectedValue.ToString() != "0")
        {
            comm = new SqlCommand("SELECT A.name AS Name, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.name AS Category FROM recipe A, category B, ingredient C, recipeIngredient D WHERE A.submittedBy = @submittedBy AND B.idCategory = @idCategory AND B.idCategory = A.idCategory AND C.idIngredient = @idIngredient AND D.idIngredient = @idIngredient AND D.idRecipe = A.idRecipe", conn);
            comm.Parameters.Add("@submittedBy", System.Data.SqlDbType.VarChar).Value = (submittedBy.SelectedItem.Text);
            comm.Parameters.Add("@idCategory", System.Data.SqlDbType.Int).Value = Convert.ToInt32(category.SelectedValue);
            comm.Parameters.Add("@idIngredient", System.Data.SqlDbType.Int).Value = Convert.ToInt32(ingredient.SelectedValue);
        }


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
}