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

          if ((unitOfMeasure.SelectedItem.Value.ToString() != "0" || !String.IsNullOrEmpty(quantity.Text.ToString())) && (ingredient.SelectedItem.Value.ToString() == "0"))
              args.IsValid = false;
          else
              args.IsValid = true;

      }

    public String getIngredientName()
      {
          return ingredient.SelectedItem.Text;
      }

    public int getIngredientValue()
    {
        return Convert.ToInt32(ingredient.SelectedValue);
    }

    public void insertIngredientElement(int index, int id, string name)
    {
        ingredient.Items.Insert(index, new ListItem(name, id.ToString()));
    }

    public int getUnitOfMeasure()
    {
        return Convert.ToInt32(unitOfMeasure.SelectedItem.Value);
    }

    public String getQuantity()
    {
        return quantity.Text;
    }

    protected void quantityCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((unitOfMeasure.SelectedItem.Value.ToString() != "0" || ingredient.SelectedItem.Value.ToString() != "0") && String.IsNullOrEmpty(quantity.Text.ToString()))
            args.IsValid = false;
        else
            args.IsValid = true;
    }
}
