using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Security;

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
            //Check if rated
            loadRating();

        }

    }

    public void loadRating()
    {
        ratingLabel.Visible = false;
        ratingExists.Visible = false;
        submitRating.Visible = false;
        int idRecipe = Convert.ToInt32(Request["idRecipe"]);
        string idUser = Membership.GetUser().ProviderUserKey.ToString();
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;

        string connectionString = ConfigurationManager.ConnectionStrings["RecipePot"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand("SELECT ratingValue FROM rating WHERE idRecipe = @idRecipe AND idUser = @idUser", conn);
        comm.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int);
        comm.Parameters.Add("@idUser", System.Data.SqlDbType.VarChar);
        comm.Parameters["@idRecipe"].Value = idRecipe;
        comm.Parameters["@idUser"].Value = idUser;

        try
        {
            conn.Open();
            reader = comm.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    rating.SelectedValue = reader["ratingValue"].ToString();
                }
                rating.Enabled = false;
                ratingExists.Visible = true;

            }
            else
            {
                rating.SelectedValue = "0";
                ratingLabel.Visible = true;
                submitRating.Visible = true;
            }

            reader.Close();

        }
        finally
        {

            conn.Close();
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

        if (e.NewMode == DetailsViewMode.Edit)
        {
            addNewCategory.Visible = true;


        }

    }

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



    protected void submitRating_Click(object sender, EventArgs e)
    {
        DBConnect objConn = new DBConnect();
        int idRecipe = Convert.ToInt32(Request["idRecipe"]);
        string idUser = Membership.GetUser().ProviderUserKey.ToString();
        SqlConnection myConn = objConn.connect();
        SqlCommand comm = new SqlCommand("insertRating", myConn);

        comm.CommandType = System.Data.CommandType.StoredProcedure;


        comm.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int).Value = idRecipe;
        comm.Parameters.Add("@idUser", System.Data.SqlDbType.UniqueIdentifier).Value = Guid.Parse(idUser);
        comm.Parameters.Add("@ratingValue", System.Data.SqlDbType.Int).Value = rating.SelectedValue;

        myConn.Open();
        comm.ExecuteNonQuery();
        myConn.Close();
        loadRating();

    }

    protected void button1_Click(object sender, EventArgs e)
    {
        int count = recipeList.Items.Count;
        string lblText = "";

        for (int i = 0; i < count; i++)
        {
            Label lbl = recipeList.Items[i].FindControl("AuthorLabel") as Label;
            lblText = lbl.Text;
            
        }

        System.Diagnostics.Debug.WriteLine(lblText);
        System.Diagnostics.Debug.WriteLine(Membership.GetUser().UserName);


        if (Membership.GetUser().UserName != lblText.Trim())
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are not allowed to edit this recipe!')", true);
            DetailsView1.Visible = false;
        }
    }
}