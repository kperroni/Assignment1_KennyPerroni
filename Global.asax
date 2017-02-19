<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        List<Recipe> recipe = new List<Recipe>();
        /*   Recipe newRecipe = new Recipe("newRecipe", "myCategory", 2, "myDescription", "myPreparation", "theSubmitter");
           newRecipe.addIngredient("newIngredient", "G", 2);
           recipe.Add(newRecipe);*/

        /* recipe.Add(new Recipe {name = "newRecipe", category = "category", serve = 1, description = "myDescription",
             ingredient.Add(new Ingredient{ name = "asdf", unit = "asdf", quantity = 1}), prepare = "myPreparation", submitter = "submitter"});
             

        Recipe newRecipe = new Recipe {name = "newRecipe", category = "category", serve = 1, description = "myDescription",
            prepare = "myPreparation", submitter = "submitter"};

        List<Ingredient> ingredientList = new List<Ingredient>();

        Ingredient myIngredient = new Ingredient();
        myIngredient.name = "newIngredient";
        myIngredient.unit = "Kg";
        myIngredient.quantity = 2;

        Ingredient myIngredient2 = new Ingredient();
        myIngredient.name = "newIngredient1";
        myIngredient.unit = "G";
        myIngredient.quantity = 3;

        ingredientList.Add(myIngredient);
        ingredientList.Add(myIngredient2);

        newRecipe.recipeIngredients = ingredientList;

        //newRecipe.addIngredient("newIngredient", "Kg", 1);
        recipe.Add(newRecipe);*/

        Application["recipe"] = recipe;
            
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
