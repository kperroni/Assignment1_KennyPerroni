using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Recipe
/// </summary>
public class Recipe
{
    public string name
    {
        get;
        set;
    }

    public string category
    {
        get;
        set;
    }

    public int serve
    {
        get;
        set;
    }

    public string description
    {
        get;
        set;
    }

    public List<Ingredient> ingredients;

    public string prepare
    {
        get;
        set;
    }

    public string submitter
    {
        get;
        set;
    }

   /* public Recipe(string name, string category, int serve, string description, string prepare, string submitter)
    {
        this.name = name;
        this.category = category;
        this.serve = serve;
        this.description = description;
        this.prepare = prepare;
        this.submitter = submitter;
    }*/

    public void addIngredient(string name, string unit, int quantity)
    {
        this.ingredients.Add(new Ingredient {name = name,  unit = unit, quantity = quantity});
    }
    
    public List<Ingredient> getIngredients()
    {
        return this.ingredients;
    }

    public List<Recipe> getRecipes()
    {
        return (List<Recipe>)HttpContext.Current.Application["recipe"];
    }
   
}