using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IngredientsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //  Recipe myRecipe = (Recipe)Application["recipe"];
        // List<Ingredient> myList = myRecipe.ingredients;

        //For each to access ingredients
    }

    protected void ingredientNameValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if ((unitOfMeasure.SelectedItem.Value.ToString() != "0" || !String.IsNullOrEmpty(quantity.Text.ToString())) && String.IsNullOrEmpty(ingredientName.Text.ToString()))
            args.IsValid = false;
        else
            args.IsValid = true;

    }

    public String getIngredientName()
    {
        return ingredientName.Text.ToString();
    }

    public String getUnitOfMeasure()
    {
        return unitOfMeasure.SelectedItem.Text.ToString();
    }

    public int getQuantity()
    {
        return Convert.ToInt32(quantity.Text.ToString());
    }

    protected void quantityCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((unitOfMeasure.SelectedItem.Value.ToString() != "0" || !String.IsNullOrEmpty(ingredientName.Text.ToString())) && String.IsNullOrEmpty(quantity.Text.ToString()))
            args.IsValid = false;
        else
            args.IsValid = true;
    }
}
