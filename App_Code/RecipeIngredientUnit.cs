using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RecipeIngredientUnit
/// </summary>
public class RecipeIngredientUnit
{
    public int idRecipe
    {
        get;
        set;
    }

    public int idIngredient
    {
        get;
        set;
    }

    public int idUnit
    {
        get;
        set;
    }

    public int quantity
    {
        get;
        set;
    }

    public RecipeIngredientUnit(int idRecipe, int idIngredient, int idUnit, int quantity)
    {
        this.idRecipe = idRecipe;
        this.idIngredient = idIngredient;
        this.idUnit = idUnit;
        this.quantity = quantity;

    }

    public RecipeIngredientUnit()
    {

    }


    
}