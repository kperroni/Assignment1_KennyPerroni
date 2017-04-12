<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

<%@ Register Src="~/IngredientsList.ascx" TagPrefix="uc1" TagName="IngredientsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Add your new Recipe to the pot!</h2>
        <br />
        <form id="myForm" role="form" runat="server">
            <div class="row">

                <div class="form-group float-label-control col-md-3">

                    <label for="recipeName">Recipe Name</label>
                    <asp:TextBox ID="recipeName" runat="server" Style="width: 80%;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" validationgroup="recipeInfo" ID="recipeNameValidator" runat="server" ErrorMessage="You must type in a Recipe Name!" ControlToValidate="recipeName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group float-label-control col-md-3">
                  
                        <label for="category">Category</label>
                        <asp:DropDownList ID="category" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="category_SelectedIndexChanged" Style="width: auto;" runat="server">
                            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
                            <asp:ListItem Text="New Category" Value="100"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                        <div class="form-group float-label-control col-md-3">
                             <asp:Label ID="newCategoryLabel" runat="server" Font-Bold="true" Text="Create New Category"></asp:Label>
                        <asp:TextBox ID="addCategoryText" class="form-control" runat="server"></asp:TextBox>  
                        </div>
                        <div class="col-md-3">  
                            <label for="addCategoryButton"></label>
                        <asp:Button ID="addCategoryButton" CssClass="form-control" CausesValidation="false" runat="server" Text="Add new Category" OnClick="addCategoryButton_Click"/>
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
                        <asp:RequiredFieldValidator ForeColor="Red" validationgroup="recipeInfo" ID="servesValidator" InitialValue="0" runat="server" ErrorMessage="You must select the number of servings!" ControlToValidate="serves" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group float-label-control" style="float: right; width: 100%;">
                        <label for="description">Description</label>
                        <asp:TextBox ID="description" TextMode="multiline" Columns="50" Rows="3" class="form-control" runat="server" style="resize: none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" validationgroup="recipeInfo" ID="descriptionValidator" runat="server" ErrorMessage="You must describe the recipe!" ControlToValidate="description" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <hr />  
            <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
                <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
        </div>        
            <div>       

                <uc1:IngredientsList runat="server" id="IngredientsList" />
                <asp:Button ID="createNewIngredient" CssClass="form-control" CausesValidation="false" runat="server" Text="Add New Ingredient" OnClick="createNewIngredient_Click" />
                <br />
                <br />
         
                <h2 class="h2">Your ingredients!</h2>
                <asp:GridView CssClass="table" ID="GridView1" OnRowUpdated="GridView1_RowUpdated" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" AutoGenerateDeleteButton="true" AutoGenerateEditButton="True" runat="server" AutoGenerateColumns="False" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="idIngredient" HeaderText="idIngredient" SortExpression="idIngredient" Visible="False" />
                        <asp:TemplateField HeaderText="Ingredient" SortExpression="nameIngredient">
                            <EditItemTemplate>
                                <asp:DropDownList ID="editNameIngredient" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="idIngredient"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecipePot %>" SelectCommand="SELECT * FROM [ingredient]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("nameIngredient") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idUnit" HeaderText="idUnit" SortExpression="idUnit" Visible="False" />
                        <asp:TemplateField HeaderText="Unit of Measure" SortExpression="nameUnit">
                            <EditItemTemplate>
                                <asp:DropDownList ID="editUnit" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="idUnit"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RecipePot %>" SelectCommand="SELECT * FROM [unitOfMeasure]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nameUnit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity" SortExpression="quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="editQuantity" CssClass="form-control" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <hr />


                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getRecipeIngredients" TypeName="IngredientAuxiliar"></asp:ObjectDataSource>


            </div>
            <div class="form-group float-label-control">
                <label for="prepareCookingTime">Prepare/Cooking Time</label>      
                  <asp:TextBox ID="prepareCookingTime" TextMode="multiline" Columns="50" Rows="8" class="form-control" runat="server" style="resize: none;"></asp:TextBox>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 form-group float-label-control">
                    <label for="submittedBy">Submitted By</label>
                    <asp:TextBox ID="submittedBy" runat="server" Enabled="false" Style="width: auto;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" validationgroup="recipeInfo" ID="submittedByValidator" runat="server" ErrorMessage="You must type in the user who is creating this recipe!" ControlToValidate="submittedBy" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="cancelRecipe" Width="65px" ImageUrl="img/cancel.png" Style="float: right;" runat="server" OnClick="cancelRecipe_Click" title="Cancel Recipe" CausesValidation="false"/>
                    <asp:ImageButton ID="submitRecipe" Width="65px" ImageUrl="img/add.png" Style="float: right; margin-right:45px;" runat="server" OnClick="submitRecipe_Click" title="Add Recipe" CausesValidation="true" validationgroup="recipeInfo" />
                </div>
            </div>

        </form>

    </div><!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    <script>
        document.getElementById("logOut").hidden = false;
    </script>

</asp:Content>