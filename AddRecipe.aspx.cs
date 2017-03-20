using System;
using System.Collections.Generic;
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
            IngredientsList1.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList2.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList3.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList4.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList5.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList6.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList7.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList8.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList9.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList10.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList11.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList12.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList13.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            IngredientsList14.insertIngredientElement(i, thisIngredient.id, thisIngredient.name);
            i++;
        }

        i = 1;

        foreach (UnitOfMeasure thisUnit in myUnits)
        {
            IngredientsList.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList1.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList2.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList3.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList4.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList5.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList6.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList7.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList8.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList9.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList10.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList11.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList12.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList13.insertUnitElement(i, thisUnit.id, thisUnit.name);
            IngredientsList14.insertUnitElement(i, thisUnit.id, thisUnit.name);

            i++;
        }


    }

    protected void submitRecipe_Click(object sender, ImageClickEventArgs e)
    {

        Page.Validate();
        if (Page.IsValid)
        {
            Recipe newRecipe = new Recipe();

            IngredientsList[] myIngredients = new IngredientsList[15];
            RecipeIngredientUnit[] ingredientsOfRecipe = new RecipeIngredientUnit[15];

            myIngredients[0] = this.IngredientsList;
            myIngredients[1] = this.IngredientsList1;
            myIngredients[2] = this.IngredientsList2;
            myIngredients[3] = this.IngredientsList3;
            myIngredients[4] = this.IngredientsList4;
            myIngredients[5] = this.IngredientsList5;
            myIngredients[6] = this.IngredientsList6;
            myIngredients[7] = this.IngredientsList7;
            myIngredients[8] = this.IngredientsList8;
            myIngredients[9] = this.IngredientsList9;
            myIngredients[10] = this.IngredientsList10;
            myIngredients[11] = this.IngredientsList11;
            myIngredients[12] = this.IngredientsList12;
            myIngredients[13] = this.IngredientsList13;
            myIngredients[14] = this.IngredientsList14;

            newRecipe.name = recipeName.Text;
            newRecipe.category = Int32.Parse(category.SelectedValue);
            newRecipe.serve = Int32.Parse(serves.SelectedValue);
            newRecipe.description = description.Text;
            newRecipe.prepare = prepareCookingTime.Text;
            newRecipe.submitter = submittedBy.Text;

            foreach (IngredientsList x in myIngredients)
            {
                if (!(String.IsNullOrEmpty(x.getIngredientName())))
                {
                    Ingredient auxIngredient = new Ingredient(x.getIngredientValue(), x.getIngredientName());
                    auxIngredient.name = x.getIngredientName();
                    newRecipe.recipeIngredients.Add(auxIngredient);
                }
            }

            int idRecipe = newRecipe.saveRecipe(newRecipe);
            int i = 0;

            foreach (IngredientsList newItem in myIngredients)
            {
                if (!String.IsNullOrEmpty(newItem.getQuantity().ToString()))
                {
                    ingredientsOfRecipe[i] = new RecipeIngredientUnit(idRecipe, newItem.getIngredientValue(), newItem.getUnitOfMeasure(), Convert.ToInt32(newItem.getQuantity()));
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
}