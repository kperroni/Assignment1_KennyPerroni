using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipe : System.Web.UI.Page
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
            newCategoryLabel.Visible = false;
            addCategoryText.Visible = false;
            addCategoryButton.Visible = false;
            databind();
            HttpContext.Current.Session["listOfIngredients"] = new List<IngredientAuxiliar>();
            bindGridData();
        }
        
    }

    private void bindGridData()
    {
        GridView1.DataSource = (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];
        GridView1.DataBind();
    }

    private void databind()
    {
        CategoryHandler categoryHandler = new CategoryHandler();
        List<Category> myCategories = categoryHandler.getCategories();
        IngredientHandler ingredientHandler = new IngredientHandler();
        List<Ingredient> myIngredients = ingredientHandler.getIngredients();
        UnitOfMeasure unitHandler = new UnitOfMeasure();
        List<UnitOfMeasure> myUnits = unitHandler.getUnitsOfMeasure();
        int i = 1;

        foreach (Category thisCategory in myCategories)
        {

            category.Items.Insert(i, new ListItem(thisCategory.name, thisCategory.id.ToString()));
            i++;
        }

        i = 1;

     foreach (Ingredient thisIngredient in myIngredients)
        {

            IngredientsList.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
                      i++;
                  }

                  i = 1;

                  foreach (UnitOfMeasure thisUnit in myUnits)
                  {
                      IngredientsList.insertUnitElement(i, thisUnit.id, thisUnit.name);
                      i++;
                  }
        }

    protected void submitRecipe_Click(object sender, ImageClickEventArgs e)
    {

        Page.Validate();
        if (Page.IsValid)
        {
            Recipe newRecipe = new Recipe();

        
            RecipeIngredientUnit[] ingredientsOfRecipe = new RecipeIngredientUnit[15];
            List<IngredientAuxiliar> auxList = (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];

                  newRecipe.name = recipeName.Text;
                  newRecipe.category = Int32.Parse(category.SelectedValue);
                  newRecipe.serve = Int32.Parse(serves.SelectedValue);
                  newRecipe.description = description.Text;
                  newRecipe.prepare = prepareCookingTime.Text;
                  newRecipe.submitter = submittedBy.Text;

                  foreach (IngredientAuxiliar x in auxList)
                  {
                      if (!(String.IsNullOrEmpty(x.nameIngredient)))
                      {
                          Ingredient auxIngredient = new Ingredient(x.idIngredient, x.nameIngredient);
                          auxIngredient.name = x.nameIngredient;
                          newRecipe.recipeIngredients.Add(auxIngredient);
                      }
                  }

                  int idRecipe = newRecipe.saveRecipe(newRecipe);
                  int i = 0;

                  foreach (IngredientAuxiliar newItem in auxList)
                  {
                      if (!String.IsNullOrEmpty(newItem.quantity.ToString()))
                      {
                          ingredientsOfRecipe[i] = new RecipeIngredientUnit(idRecipe, newItem.idIngredient, newItem.idUnit, Convert.ToInt32(newItem.quantity));
                          i++;
                      }
                  }

                  newRecipe.saveIngredients(ingredientsOfRecipe, i);

            Response.Redirect("AddRecipe.aspx");

        }

    }

    protected void cancelRecipe_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddRecipe.aspx");
    }

    protected void addCategoryButton_Click(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(addCategoryText.Text.Trim()))
        {
            Category newCategory = new Category();
            newCategory.saveCategory(addCategoryText.Text);
            databind();
            addCategoryText.Text = "";
            category.SelectedValue = "0";
            newCategoryLabel.Visible = false;
            addCategoryText.Visible = false;
            addCategoryButton.Visible = false;
            submitRecipe.Enabled = true;
        }

        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please, type a category!')", true);
        }
        

    }



    protected void createNewIngredient_Click(object sender, EventArgs e)
    {
        List<IngredientAuxiliar> auxList = (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];
        auxList.Add(new IngredientAuxiliar(IngredientsList.getIngredientValue(), IngredientsList.getIngredientName(), Convert.ToInt32(IngredientsList.getUnitOfMeasure()), IngredientsList.getNameUnitOfMeasure(), Convert.ToInt32(IngredientsList.getQuantity()))); 
        HttpContext.Current.Session["listOfIngredients"] = auxList;
        bindGridData();


    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindGridData();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        e.Cancel = true;
        GridView1.EditIndex = -1;
        bindGridData();

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        List<IngredientAuxiliar> auxList = (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];

        GridViewRow row = GridView1.Rows[e.RowIndex];

        DropDownList ingredientSelected = (DropDownList)row.FindControl("editNameIngredient");
        DropDownList unitSelected = (DropDownList)row.FindControl("editUnit");
        TextBox quantitySelected = (TextBox)row.FindControl("editQuantity");
        int t;


        if (!String.IsNullOrEmpty(ingredientSelected.SelectedItem.Text) && !String.IsNullOrEmpty(unitSelected.SelectedItem.Text) && !String.IsNullOrEmpty(quantitySelected.Text))
        {
                  
            if (int.TryParse(quantitySelected.Text, out t))
            {
                auxList.ElementAt(e.RowIndex).idIngredient = Convert.ToInt32(ingredientSelected.SelectedValue);
                auxList.ElementAt(e.RowIndex).nameIngredient = ingredientSelected.SelectedItem.Text;
                auxList.ElementAt(e.RowIndex).idUnit = Convert.ToInt32(unitSelected.SelectedValue);
                auxList.ElementAt(e.RowIndex).nameUnit = unitSelected.SelectedItem.Text;
                auxList.ElementAt(e.RowIndex).quantity = Convert.ToInt32(quantitySelected.Text);

                HttpContext.Current.Session["listOfIngredients"] = auxList;
            }
        }

       
        GridView1.EditIndex = -1;
        bindGridData();
    }



    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        bindGridData();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        List<IngredientAuxiliar> auxList = (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];

        GridViewRow row = GridView1.Rows[e.RowIndex];
        auxList.RemoveAt(e.RowIndex);
        HttpContext.Current.Session["listOfIngredients"] = auxList;
        bindGridData();
    }

    protected void category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (category.SelectedValue.Equals("100"))
        {
            newCategoryLabel.Visible = true;
            addCategoryText.Visible = true;
            addCategoryButton.Visible = true;
            submitRecipe.Enabled = false;
        }

        else
        {
            newCategoryLabel.Visible = false;
            addCategoryText.Visible = false;
            addCategoryButton.Visible = false;
            submitRecipe.Enabled = true;
        }
    }
}