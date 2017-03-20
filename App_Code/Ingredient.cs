﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ingredient
/// </summary>
public class Ingredient
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

    public Ingredient(int id, string name)
    {
        this.id = id;
        this.name = name;
    }

}