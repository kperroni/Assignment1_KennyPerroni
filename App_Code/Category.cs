using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Category
/// </summary>
public class Category
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

    public Category(int id, string name)
    {

        this.id = id;
        this.name = name;
        //
        // TODO: Add constructor logic here
        //
    }

    public Category()
    {

    }

    public void saveCategory(string categoryName)
    {
        DBConnect objConn = new DBConnect();

        SqlConnection myConn = objConn.connect();
        SqlCommand comm = new SqlCommand("insertNewCategory", myConn);
        comm.CommandType = System.Data.CommandType.StoredProcedure;

        comm.Parameters.Add("@categoryName", System.Data.SqlDbType.VarChar).Value = categoryName;

        try
        {
            myConn.Open();
            comm.ExecuteNonQuery();
        }
        catch
        {

        }
        finally
        {
            myConn.Close();
        }

    }
}