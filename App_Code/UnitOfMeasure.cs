using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UnitOfMeasure
/// </summary>
public class UnitOfMeasure
{
    public int id
    {
        get;
        set;
    }

    public string name
    {
        get;
        set;
    }

    public UnitOfMeasure(int id, string name)
    {

        this.id = id;
        this.name = name;
        //
        // TODO: Add constructor logic here
        //
    }

    public UnitOfMeasure()
    {

    }

    public List<UnitOfMeasure> getUnitsOfMeasure()
    {
        DBConnect objConn = new DBConnect();
        List<UnitOfMeasure> myList = new List<UnitOfMeasure>();
        SqlConnection myConn = objConn.connect();
        SqlCommand comm;
        SqlDataReader reader;

        comm = new SqlCommand("SELECT * FROM unitOfMeasure", myConn);

        try
        {
            // Open the connection
            myConn.Open();
            reader = comm.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    myList.Add(new UnitOfMeasure(reader.GetInt32(0), reader.GetString(1)));

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