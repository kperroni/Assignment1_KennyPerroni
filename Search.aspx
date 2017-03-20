<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <form role="form" runat="server">
        <div class="container well well-lg" style="width: 100%; padding: 70px; background-color: #ffffff;">

            <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Look up your recipe</h2>
            <br />

            <div class="row">
                <div class="form-group float-label-control col-md-6">
                    <label for="submittedBy">Submitted By</label>
                    <asp:DropDownList ID="submittedBy" CssClass="form-control" Style="width: auto;" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label for="category">Category</label>
                    <asp:DropDownList ID="category" CssClass="form-control" Style="width: auto;" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                    <label for="ingredient">Ingredient</label>
                    <asp:DropDownList ID="ingredient" CssClass="form-control" Style="width: auto;" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-md-8" style="padding-left: 160px; padding-top: 10px;">
                    <asp:ImageButton ID="searchRecipe" OnClick="searchRecipe_Click" Width="65px" ImageUrl="img/search.png" runat="server" title="Search Recipe" />
                </div>
            </div>
           <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>
            <br />
            <br />
            <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Pot Results:</h2>

            <div>

                <asp:DataList ID="recipeList" runat="server">
                    <ItemTemplate>
                        Name: <strong><%#Eval("Name")%></strong><br />
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

        </div>
    </form>
</asp:Content>
