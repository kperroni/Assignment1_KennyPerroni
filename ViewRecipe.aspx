<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewRecipe.aspx.cs" Inherits="ViewRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff; height: 400px;">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Your recipes in the pot so far!</h2>

        <label for="category">Category</label>
        <select class="form-control" id="category" style="width: auto;">
            <option value="" selected disabled>Choose one category</option>
            <option>Category 1</option>
            <option>Category 2</option>
            <option>Category 3</option>
        </select>

        <div class="row">
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image1" Width="15%" ImageUrl="img/add.png" runat="server" />
                My first recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image2" Width="15%" ImageUrl="img/add.png" runat="server" />
                My second recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image3" Width="15%" ImageUrl="img/add.png" runat="server" />
                My third recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image4" Width="15%" ImageUrl="img/add.png" runat="server" />
                My fourth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image5" Width="15%" ImageUrl="img/add.png" runat="server" />
                My fifth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image6" Width="15%" ImageUrl="img/add.png" runat="server" />
                My sixth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image7" Width="15%" ImageUrl="img/add.png" runat="server" />
                My seventh recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image8" Width="15%" ImageUrl="img/add.png" runat="server" />
                My eighth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:Image ID="Image9" Width="15%" ImageUrl="img/add.png" runat="server" />
                My ninth recipe
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

