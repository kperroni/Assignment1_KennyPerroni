<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<%@ Register Src="~/IngredientsList.ascx" TagPrefix="uc1" TagName="IngredientsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">

    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Add your new Recipe to the pot!</h2>
        <br />
        <form id="myForm" role="form" runat="server">
            <div class="row">

                <div class="form-group float-label-control col-md-6">

                    <label for="recipeName">Recipe Name</label>
                    <asp:TextBox ID="recipeName" runat="server" Style="width: 80%;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="recipeNameValidator" runat="server" ErrorMessage="You must type in a Recipe Name!" ControlToValidate="recipeName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <div style="float: left;">
                        <label for="category">Category</label>
                        <asp:DropDownList ID="category" CssClass="form-control" Style="width: auto;" runat="server">
                            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="addCategoryText" runat="server"></asp:TextBox>    
                        <asp:Button ID="addCategoryButton" CausesValidation="false" runat="server" Text="Add new Category" OnClick="addCategoryButton_Click"/>
                    </div>
                </div>
            </div>
            <hr />
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group float-label-control">
                        <label for="serves">Serves</label>
                        <asp:DropDownList ID="serves" CssClass="form-control" Style="width: auto;" runat="server">
                            <asp:ListItem Text="Select Serves" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="servesValidator" InitialValue="0" runat="server" ErrorMessage="You must select the number of servings!" ControlToValidate="serves" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group float-label-control" style="float: right; width: 100%;">
                        <label for="description">Description</label>
                        <asp:TextBox ID="description" TextMode="multiline" Columns="50" Rows="3" class="form-control" runat="server" style="resize: none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="descriptionValidator" runat="server" ErrorMessage="You must describe the recipe!" ControlToValidate="description" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <hr />  
            <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>        
            <div>       


                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" CausesValidation="false" OnClientClick="addIngredient_Click return false;" UseSubmitBehavior="false" runat="server" Text="Button" />

                <asp:Panel ID="ingredientsPanel" runat="server"></asp:Panel>

                <uc1:IngredientsList runat="server" id="IngredientsList" />
                <uc1:IngredientsList runat="server" id="IngredientsList1" />
                <uc1:IngredientsList runat="server" id="IngredientsList2" />
                <uc1:IngredientsList runat="server" id="IngredientsList3" />
                <uc1:IngredientsList runat="server" id="IngredientsList4" />
                <uc1:IngredientsList runat="server" id="IngredientsList5" />
                <uc1:IngredientsList runat="server" id="IngredientsList6" />
                <uc1:IngredientsList runat="server" id="IngredientsList7" />
                <uc1:IngredientsList runat="server" id="IngredientsList8" />
                <uc1:IngredientsList runat="server" id="IngredientsList9" />
                <uc1:IngredientsList runat="server" id="IngredientsList10" />
                <uc1:IngredientsList runat="server" id="IngredientsList11" />
                <uc1:IngredientsList runat="server" id="IngredientsList12" />
                <uc1:IngredientsList runat="server" id="IngredientsList13" />
                <uc1:IngredientsList runat="server" id="IngredientsList14" />
            </div>
            <div class="form-group float-label-control">
                <label for="prepareCookingTime">Prepare/Cooking Time</label>
                <asp:TextBox ID="prepareCookingTime" TextMode="multiline" Columns="50" Rows="8" class="form-control" runat="server" style="resize: none;"></asp:TextBox>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 form-group float-label-control">
                    <label for="submittedBy">Submitted By</label>
                    <asp:TextBox ID="submittedBy" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="submittedByValidator" runat="server" ErrorMessage="You must type in the user who is creating this recipe!" ControlToValidate="submittedBy" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="cancelRecipe" Width="65px" ImageUrl="img/cancel.png" Style="float: right;" runat="server" OnClick="cancelRecipe_Click" title="Cancel Recipe" CausesValidation="false"/>
                    <asp:ImageButton ID="submitRecipe" Width="65px" ImageUrl="img/add.png" Style="float: right; margin-right:45px;" runat="server" OnClick="submitRecipe_Click" title="Add Recipe" CausesValidation="true" />
                </div>
            </div>

        </form>

    </div>

</asp:Content>