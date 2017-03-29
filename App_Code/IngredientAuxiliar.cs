using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IngredientAuxiliar
/// </summary>
public class IngredientAuxiliar
{
  
    public int idIngredient
    {
        get;
        set;
    }

    public string nameIngredient
    {
        get;
        set;
    }

    public int idUnit
    {
        get;
        set;
    }

    public string nameUnit
    {
        get;
        set;
    }

    public int quantity
    {
        get;
        set;
    }

    public IngredientAuxiliar(int idIngredient, string nameIngredient, int idUnit, string nameUnit, int quantity)
    {

        this.idIngredient = idIngredient;
        this.nameIngredient = nameIngredient;
        this.idUnit = idUnit;
        this.nameUnit = nameUnit;
        this.quantity = quantity;
        //
        // TODO: Add constructor logic here
        //
    }

    public IngredientAuxiliar()
    {

    }

    public List<IngredientAuxiliar> getRecipeIngredients()
    {
        return (List<IngredientAuxiliar>)HttpContext.Current.Session["listOfIngredients"];

    }
}