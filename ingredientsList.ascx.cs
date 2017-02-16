using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ingredientsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Recipe myRecipe = (Recipe)Application["recipe"];
       // List<Ingredient> myList = myRecipe.ingredients;

        //For each to access ingredients
    }



    protected void unitOfMeasure_TextChanged(object sender, EventArgs e)
    {
        if(unitOfMeasure.SelectedValue.ToString() == "2")
        {
            quantityDrop.Items.Clear();
            quantityDrop.Items.Add(new ListItem("text", "value"));
            /* quantityDrop.Items.Insert(2, new ListItem("100"));
             quantityDrop.Items.Insert(3, new ListItem("150"));
             quantityDrop.Items.Insert(4, new ListItem("200"));
             quantityDrop.Items.Insert(5, new ListItem("250"));
             quantityDrop.Items.Insert(6, new ListItem("300"));
             quantityDrop.Items.Insert(7, new ListItem("350"));
             quantityDrop.Items.Insert(8, new ListItem("400"));
             quantityDrop.Items.Insert(9, new ListItem("450"));
             quantityDrop.Items.Insert(10, new ListItem("500"));*/

        }
    }
}