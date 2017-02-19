<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IngredientsList.ascx.cs" Inherits="IngredientsList" %>
<div class="row">
                <div class="col-md-4">
                    <label for="ingredientName">Ingredient Name</label>
                    <asp:TextBox ID="ingredientName" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="ingredientNameValidator" ValidateEmptyText="true" runat="server" ErrorMessage="You must enter a name for the ingredient!"
                        SetFocusOnError="true" ForeColor="Red" OnServerValidate="ingredientNameValidator_ServerValidate" ControlToValidate="ingredientName"></asp:CustomValidator> 
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
                <div class="col-md-4">
                    <label for="quantity">Quantity</label>
                    <asp:TextBox ID="quantity" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                   <asp:CustomValidator ID="quantityCustomValidator" ValidateEmptyText="true" runat="server" ErrorMessage="Quantity is required!"
                       SetFocusOnError="true" ForeColor="Red" Display="Dynamic" OnServerValidate="quantityCustomValidator_ServerValidate" ControlToValidate="quantity"></asp:CustomValidator> 
                     <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="quantityValidatorExpression" runat="server" ErrorMessage="Quantity must be a number!" ControlToValidate="quantity"
                         ValidationExpression="^[0-9]{1,10}$" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>             
            </div>
<hr />