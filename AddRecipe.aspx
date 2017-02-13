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
                    <!--  <input type="text" id="recipeName" style="width: 80%;" class="form-control">-->
                    <asp:TextBox ID="recipeName" runat="server" Style="width: 80%;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="recipeNameValidator" runat="server" ErrorMessage="You must type in a Recipe Name!" ControlToValidate="recipeName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <div style="float: left;">
                        <label for="category">Category</label>
                        <!--  <select class="form-control" id="category" style="width: auto;">
                        <option value="" selected disabled>Choose one category</option>
                        <option>Category 1</option>
                        <option>Category 2</option>
                        <option>Category 3</option>
                    </select> -->
                        <asp:DropDownList ID="category" CssClass="form-control" Style="width: auto;" runat="server">
                            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Category 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Category 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Category 3" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <hr />
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group float-label-control">
                        <label for="serves">Serves</label>
                        <!--  <select class="form-control" id="serves" style="width: auto;">
                            <option value="" selected disabled>How many serves?</option>
                            <option>1 Serve</option>
                            <option>2 Serves</option>
                            <option>3 Serves</option>
                        </select> -->
                        <asp:DropDownList ID="serves" CssClass="form-control" Style="width: auto;" runat="server">
                            <asp:ListItem Text="Select Serves" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="servesValidator" InitialValue="0" runat="server" ErrorMessage="You must select the number of servings!" ControlToValidate="serves" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group float-label-control" style="float: right; width: 100%;">
                        <label for="description">Description</label>
                        <asp:TextBox ID="description" TextMode="multiline" Columns="50" Rows="3" class="form-control" runat="server" style="resize: none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ErrorMessage="You must describe the recipe!" ControlToValidate="description" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                    <label for="ingredientName">Ingredient Name</label>
                    <asp:TextBox ID="ingredientName" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="unitOfMeasure">Unit of Measure</label>
                    <asp:DropDownList ID="unitOfMeasure" CssClass="form-control" Style="width: auto;" runat="server">
                        <asp:ListItem Text="Select Unit of Measure" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Kg" Value="1"></asp:ListItem>
                        <asp:ListItem Text="G" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Cups" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Table Spoons" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Pieces" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label for="quantity">Quantity</label>
                    <asp:DropDownList ID="quantity" CssClass="form-control" Style="width: auto;" runat="server">
                        <asp:ListItem Text="Select Quantity" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-1" style="padding-top: 20px;">
                    <asp:ImageButton ID="addIngredient" Width="40px" ImageUrl="img/addIngredient.png" runat="server" title="Add Ingredient" />
                </div>
            </div>
            <div>
            </div>
            <hr />
            <div class="form-group float-label-control">
                <label for="prepareCookingTime">Prepare/Cooking Time</label>
                <textarea class="form-control" id="ingredients" style="resize: none;" rows="8"></textarea>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 form-group float-label-control">
                    <label for="submittedBy">Submitted By</label>
                    <asp:TextBox ID="submittedBy" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="submittedByValidator" runat="server" ErrorMessage="You must type in the user who is creating this recipe!" ControlToValidate="submittedBy" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="submitRecipe" Width="65px" ImageUrl="img/add.png" Style="float: right;" runat="server" title="Add Recipe" />
                </div>
            </div>

        </form>

    </div>

</asp:Content>