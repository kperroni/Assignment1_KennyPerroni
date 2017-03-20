using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IngredientHandler
/// </summary>
public class IngredientHandler
{
    DBConnect objConn = new DBConnect();

    public IngredientHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Ingredient> getIngredients()
    {
        
        List<Ingredient> myList = new List<Ingredient>();
        SqlConnection myConn = objConn.connect();
        SqlCommand comm;
        SqlDataReader reader;

        comm = new SqlCommand("SELECT * FROM ingredient", myConn);

        try
        {
            // Open the connection
            myConn.Open();
            reader = comm.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    //  Console.WriteLine("{0}\t{1}", reader.GetInt32(0),
                    //     reader.GetString(1));
                    myList.Add(new Ingredient(reader.GetInt32(0), reader.GetString(1)));

                }
                reader.Close();
            }
            else
            {
                Console.WriteLine("No rows found.");
            }
            // Execute the command

            // Close the reader

        }
        catch
        {

        }
        finally
        {
            // Close the connection
            myConn.Close();
        }

        return myList;

    }


}