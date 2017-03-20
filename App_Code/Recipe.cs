using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;

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

    public int category
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

    public List<Ingredient> recipeIngredients = new List<Ingredient>();

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

    public void addIngredient(int id, string name)
    {
        this.recipeIngredients.Add(new Ingredient(id, name));
    }
    
    public List<Ingredient> getIngredients()
    {
        return this.recipeIngredients;
    }

    public List<Recipe> getRecipes()
    {
        return (List<Recipe>)HttpContext.Current.Application["recipe"];
    }

    public int saveRecipe(Recipe newRecipe)
    {
        DBConnect objConn = new DBConnect();

        SqlConnection myConn = objConn.connect();
        int idRecipe;
        SqlCommand comm = new SqlCommand("insertNewRecipe", myConn);
       
        comm.CommandType = System.Data.CommandType.StoredProcedure;
        

        comm.Parameters.Add("@newName", System.Data.SqlDbType.VarChar).Value = newRecipe.name;
        comm.Parameters.Add("@newCategory", System.Data.SqlDbType.Int).Value = newRecipe.category;
        comm.Parameters.Add("@newServes", System.Data.SqlDbType.Int).Value = newRecipe.serve;
        comm.Parameters.Add("@newDescription", System.Data.SqlDbType.VarChar).Value = newRecipe.description;
        comm.Parameters.Add("@newPrepareCookingTime", System.Data.SqlDbType.VarChar).Value = newRecipe.prepare;
        comm.Parameters.Add("@newSubmittedBy", System.Data.SqlDbType.VarChar).Value = newRecipe.submitter;
        comm.Parameters.Add("@idRecipe", System.Data.SqlDbType.Int).Direction = ParameterDirection.Output;

        SqlCommand commIngredient = new SqlCommand("insertIngredientToRecipe", myConn);
        commIngredient.CommandType = System.Data.CommandType.StoredProcedure;
        

      
            // Open the connection
        myConn.Open();
        comm.ExecuteNonQuery();
        idRecipe = Convert.ToInt32(comm.Parameters["@idRecipe"].Value);
        myConn.Close();
        return idRecipe;
            // Execute the command

            // Close the reader

      
        
       // Close the connection
        
    }


    public void saveIngredients(RecipeIngredientUnit[] ingredientItems, int ingredientsCount)
    {
        DBConnect objConn = new DBConnect();

        SqlConnection myConn = objConn.connect();
        SqlCommand comm = new SqlCommand("insertIngredientToRecipe", myConn);

        comm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlCommand commIngredient = new SqlCommand("insertIngredientToRecipe", myConn);
        commIngredient.CommandType = System.Data.CommandType.StoredProcedure;
        int i = 0;
        comm.Parameters.Add("@newIdRecipe", System.Data.SqlDbType.Int);
        comm.Parameters.Add("@newIdIngredient", System.Data.SqlDbType.Int);
        comm.Parameters.Add("@newIdUnit", System.Data.SqlDbType.Int);
        comm.Parameters.Add("@newQuantity", System.Data.SqlDbType.Int);

        // Open the connection
        myConn.Open();

        foreach(RecipeIngredientUnit x in ingredientItems)
        { 
        
        if(i != ingredientsCount)
        {
                comm.Parameters["@newIdRecipe"].Value = x.idRecipe;
                comm.Parameters["@newIdIngredient"].Value = x.idIngredient;
                comm.Parameters["@newIdUnit"].Value = x.idUnit;
                comm.Parameters["@newQuantity"].Value = x.quantity;
                comm.ExecuteNonQuery();
        i++;
        }
        }
    
        myConn.Close();

        // Execute the command

        // Close the reader



        // Close the connection

    }
    
    
}