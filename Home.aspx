<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="sideContentHolder" runat="Server">
    <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    <div class="container well well-sm" style="width: 185px; background-color: #D32F2F; border-radius: 20px; border-color: #D32F2F;">
        <h4 class="h4" style="color: #ffffff;">Recipes Categories</h4>
        <a style="color: #ffffff" href="#"><u>Category 1</u></a><br />
        <a style="color: #ffffff" href="#"><u>Category 2</u></a><br />
        <a style="color: #ffffff" href="#"><u>Category 3</u></a>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">

    <div class="container well well-lg" style="padding-top: 30px; background-color: #ffffff; width: 900px;">
        <div style="float:right;"><a href="ChangeTheme.aspx">Change theme here!</a></div>
        <h1 class="h1 page-header">Welcome to Recipe pot!</h1>
        <br />
        <p class="lead;" style="font-family: sans-serif; text-align: justify; font-size: 20px;">
            Having a family reunion? A party at your place with your friends?
            Your boss is having dinner at your house?<br />
            <br />
            You know that the key to a successful party or reunion
            is the food that is served. Get rid of that old dusty 
            recipe book that has gone through the family for generations, and
            jump to the new age having all your recipes on a web site that
            will do all the dirty work for you. No more scrawling or flicking 
            through pages, this is Recipe pot!        
        </p>
        <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    </div>
    <br />
    <br />
   <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>
    <div class="container well well-lg" style="background-color: #ffffff; width: 900px;">

        <h1 class="h1 page-header">How does Recipe pot works?</h1>
        <br />
        <p class="lead" style="font-family: sans-serif; text-align: justify; font-size: 20px;">
            This application will lend you a hand when dealing with recipes,
            you will be able to add, view and search all the recipes that 
            you create. As a result, you will have all your recipes
            well-organized in one place, and within reach of a click.
            <br />
            <br />

            At the top of this page there is banner that contains different
            modules that will help you navigate through the application.
            Right now you are in the <b>Home</b> page! Which is basically a welcome
            page. In order to navigate to the <b>Recipes</b> module, just click 
            on the name of the element on the banner. Next, a dropdown list 
            will be shown for you to click on <b>Add Recipe</b> or <b>View Recipe</b>,
            each one will take you to their correspondent modules. Finally, 
            the <b>Search</b> module can be accessed just by clicking on its name
            on the banner as well.
        </p>
        <div style="float: left;">
            <h2>Now, enjoy and Happy Cooking!</h2>

        </div>
        <div style="float: right; padding-right: 284px; margin-top: -23px;">
            <img src="img/potImage.png" style="width: 100px;" />
        </div>
        <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    </div>
</asp:Content>

