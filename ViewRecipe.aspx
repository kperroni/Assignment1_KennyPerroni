<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewRecipe.aspx.cs" Inherits="ViewRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff;">

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
                <asp:image id="Image1" width="15%" imageurl="img/add.png" runat="server" />
                My first recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image2" width="15%" imageurl="img/add.png" runat="server" />
                My second recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image3" width="15%" imageurl="img/add.png" runat="server" />
                My third recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image4" width="15%" imageurl="img/add.png" runat="server" />
                My fourth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image5" width="15%" imageurl="img/add.png" runat="server" />
                My fifth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image6" width="15%" imageurl="img/add.png" runat="server" />
                My sixth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image7" width="15%" imageurl="img/add.png" runat="server" />
                My seventh recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image8" width="15%" imageurl="img/add.png" runat="server" />
                My eighth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image9" width="15%" imageurl="img/add.png" runat="server" />
                My ninth recipe
            </div>
            <div class="col-md-3 col-md-offset-1" style="padding-top: 30px;">
                <asp:image id="Image10" width="15%" imageurl="img/add.png" runat="server" />
                My tenth recipe
            </div>
        </div>
    </div>
</asp:Content>

