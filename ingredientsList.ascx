<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IngredientsList.ascx.cs" Inherits="IngredientsList" %>
<div class="row">
                <div class="col-md-4">
                    <label for="ingredientName">Ingredient Name</label>
                 
                     <asp:DropDownList ID="ingredient" CssClass="form-control" Style="width: auto;" runat="server">
                         <asp:ListItem Text="Select an Ingredient" Value="0"></asp:ListItem>
                         </asp:DropDownList>
                    <asp:CustomValidator ID="ingredientValidator" validationgroup="recipeInfo" Display="Dynamic" OnServerValidate="ingredientNameValidator_ServerValidate"
                         ValidateEmptyText="true" ForeColor="Red" runat="server" ErrorMessage="You must select an ingredient" ControlToValidate="ingredient" SetFocusOnError="true"></asp:CustomValidator>
                </div>
                <div class="col-md-4">
                    <label for="unitOfMeasure">Unit of Measure</label>
                    <asp:DropDownList ID="unitOfMeasure" CssClass="form-control" Style="width: auto;" runat="server">
                        <asp:ListItem Text="Select Unit of Measure" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label for="quantity">Quantity</label>
                    <asp:TextBox ID="quantity" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                   <asp:CustomValidator ID="quantityCustomValidator" validationgroup="recipeInfo" ValidateEmptyText="true" runat="server" ErrorMessage="Quantity is required!"
                       SetFocusOnError="true" ForeColor="Red" Display="Dynamic" OnServerValidate="quantityCustomValidator_ServerValidate" ControlToValidate="quantity"></asp:CustomValidator> 
                     <asp:RegularExpressionValidator ForeColor="Red" validationgroup="recipeInfo" Display="Dynamic" ID="quantityValidatorExpression" runat="server" ErrorMessage="Quantity must be a number!" ControlToValidate="quantity"
                         ValidationExpression="^[0-9]{1,10}$" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>             
            </div>
<hr />