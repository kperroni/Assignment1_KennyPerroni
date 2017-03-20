<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewRecipe.aspx.cs" Inherits="ViewRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <form id="form1" runat="server">
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff;">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Your recipes in the pot so far!</h2>
        <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>
        <asp:DataList ID="recipeList" runat="server" OnItemCommand="recipeList_ItemCommand">
                <ItemTemplate>
                  
                    Name: <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Name")%>'
                        CommandName="recipeDetails"
                        CommandArgument='<%# Eval("idRecipe") %>'>
                    </asp:LinkButton><br />
                    Category: <strong><%#Eval("Category")%></strong><br />
                    Serves: <strong><%#Eval("Serves")%></strong><br />
                    Description: <strong><%#Eval("Description")%></strong><br />
                    Prepare: <strong><%#Eval("Prepare")%></strong><br />
                    Author: <strong><%# Eval("Author")%></strong>

                   
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:DataList>
        

    </div>
    </form>
</asp:Content>

