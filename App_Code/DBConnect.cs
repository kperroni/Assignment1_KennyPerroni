using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DBConnect
/// </summary>
public class DBConnect
{
    public DBConnect()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public SqlConnection connect()
    {

        SqlConnection conn;
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "RecipePot"].ConnectionString;
        conn = new SqlConnection(connectionString);
        return conn;

    }

  
}