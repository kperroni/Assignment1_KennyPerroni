using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoryHandler
/// </summary>
public class CategoryHandler
{
    public CategoryHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Category> getCategories()
    {
        DBConnect objConn = new DBConnect();
        List<Category> myList = new List<Category>();
        SqlConnection myConn = objConn.connect();
        SqlCommand comm;
        SqlDataReader reader;

        comm = new SqlCommand("SELECT * FROM category", myConn);

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
                    myList.Add(new Category(reader.GetInt32(0), reader.GetString(1)));

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