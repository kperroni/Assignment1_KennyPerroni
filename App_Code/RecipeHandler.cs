using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RecipeHandler
/// </summary>
public class RecipeHandler
{
    public RecipeHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<string> getSubmitters()
    {

        DBConnect objConn = new DBConnect();
        List<string> myList = new List<string>();
        SqlConnection myConn = objConn.connect();
        SqlCommand comm;
        SqlDataReader reader;

        comm = new SqlCommand("SELECT DISTINCT submittedBy FROM recipe", myConn);

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
                    myList.Add((reader.GetString(0)));

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