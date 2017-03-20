<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="RecipeDetail.aspx.cs" Inherits="RecipeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" Runat="Server">
    <form id="form1" runat="server">
    <div class="container well well-lg" Runat="Server" style="width: 80%; padding: 70px; background-color: #ffffff;">

        <h2 class="h2 page-header" runat="server" style="margin-top: -20px; margin-bottom: 40px;">Your recipes in the pot so far!</h2>

        <asp:DataList ID="recipeList" runat="server" OnItemCommand="recipeList_ItemCommand">

                <ItemTemplate>
                  
                    Recipe ID: <strong><%#Eval("ID")%></strong><br />
                    Name: <strong><%#Eval("Name")%></strong><br />
                    Category: <strong><%#Eval("Category")%></strong><br />
                    Serves: <strong><%#Eval("Serves")%></strong><br />
                    Description: <strong><%#Eval("Description")%></strong><br />
                    Prepare: <strong><%#Eval("Prepare")%></strong><br />
                    Author: <strong><%# Eval("Author")%></strong><br />

                    <asp:Button ID="deleteRecipeButton" runat="server" Text="Delete Recipe" CommandName="deleteRecipe"
                        CommandArgument='<%#Eval("ID")%>'/>
  
                </ItemTemplate>
            
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:DataList>
       <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>

      

    </div>
        </form>

</asp:Content>

