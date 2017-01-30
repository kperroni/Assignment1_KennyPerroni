<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff; height:400px;">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Look up your recipe</h2>
        <br />
        <form role="form" runat="server">
            <div class="row">
                <div class="form-group float-label-control col-md-6">
                    <label for="recipeName">Recipe Name</label>
                    <input type="text" id="recipeName" style="width: 80%;" class="form-control">
                </div>
                <div class="col-md-6">
                    <label for="category">Category</label>
                    <select class="form-control" id="category" style="width: auto;">
                        <option value="" selected disabled>Choose one category</option>
                        <option>Category 1</option>
                        <option>Category 2</option>
                        <option>Category 3</option>
                    </select>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                    <label for="serves">Serves</label>
                    <select class="form-control" id="serves" style="width: auto;">
                        <option value="" selected disabled>How many serves?</option>
                        <option>1 Serve</option>
                        <option>2 Serves</option>
                        <option>3 Serves</option>
                    </select>
                </div>
                <div class="col-md-8" style="padding-left: 160px; padding-top: 10px;">
                    <asp:ImageButton ID="searchRecipe" Width="65px" ImageUrl="img/search.png" runat="server" title="Search Recipe" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>