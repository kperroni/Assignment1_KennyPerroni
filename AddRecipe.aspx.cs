using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitRecipe_Click(object sender, ImageClickEventArgs e)
    {
        // int ing = 0;
        // String output = "";

        Page.Validate();
        if (Page.IsValid) { 
        Recipe newRecipe = new Recipe();

        IngredientsList[] myIngredients = new IngredientsList[15];

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
        newRecipe.category = category.SelectedItem.Text;
        newRecipe.serve = Convert.ToInt32(serves.SelectedItem.Text);
        newRecipe.description = description.Text;
        newRecipe.prepare = prepareCookingTime.Text;
        newRecipe.submitter = submittedBy.Text;

        foreach (IngredientsList x in myIngredients)
        {
            if (!(String.IsNullOrEmpty(x.getIngredientName())))
            {
                Ingredient auxIngredient = new Ingredient();
                auxIngredient.name = x.getIngredientName();
                auxIngredient.unit = x.getUnitOfMeasure();
                auxIngredient.quantity = x.getQuantity();             
                newRecipe.recipeIngredients.Add(auxIngredient);
            }
        }

        List<Recipe> recipe = (List<Recipe>)HttpContext.Current.Application["recipe"];
        recipe.Add(newRecipe);
        HttpContext.Current.Application["recipe"] = recipe;
        Response.Redirect("AddRecipe.aspx");
        }

    }

    protected void cancelRecipe_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddRecipe.aspx");
    }
}