<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">

    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Add your new Recipe to the pot!</h2>
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
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group float-label-control">
                        <label for="serves">Serves</label>
                        <select class="form-control" id="serves" style="width: auto;">
                            <option value="" selected disabled>How many serves?</option>
                            <option>1 Serve</option>
                            <option>2 Serves</option>
                            <option>3 Serves</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group float-label-control" style="margin-right: 40px;">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" style="resize: none;" rows="3"></textarea>
                    </div>
                </div>
            </div>
            <hr />
            <div class="form-group float-label-control">
                <label for="ingredients">Ingredients</label>
                <textarea class="form-control" id="ingredients" style="resize: none;" rows="8"></textarea>
            </div>
            <hr />
            <div class="form-group float-label-control">
                <label for="preparation">Preparation</label>
                <textarea class="form-control" id="preparation" style="resize: none;" rows="8"></textarea>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group float-label-control">
                        <label for="notes">Notes</label>
                        <textarea class="form-control" id="notes" style="resize: none;" rows="2"></textarea>
                    </div>
                </div>
                <div class="col-md-4" style="padding-top: 20px; padding-left: 80px; float: left;">
                    <asp:ImageButton ID="submitRecipe2" Width="65px" ImageUrl="img/add.png" runat="server" title="Add Recipe" />
                </div>
            </div>
        </form>
    </div>

</asp:Content>

