<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ingredientsList.ascx.cs" Inherits="ingredientsList" %>
 <div class="row">
                <div class="col-md-4">
                    <label for="ingredientName">Ingredient Name</label>
                    <asp:TextBox ID="ingredientName" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label for="unitOfMeasure">Unit of Measure</label>
                    <asp:DropDownList ID="unitOfMeasure" CssClass="form-control" Style="width: auto;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="unitOfMeasure_TextChanged">
                        <asp:ListItem Text="Select Unit of Measure" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Kg" Value="1"></asp:ListItem>
                        <asp:ListItem Text="G" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Cups" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Table Spoons" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Pieces" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                  <!--  <label for="quantity">Quantity</label>
                    <asp:TextBox ID="quantity2_" runat="server" Style="width: auto;" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="quantityValidator" runat="server" ErrorMessage="Quantity is required" ControlToValidate="quantity2_"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="quantityRangeValidator" runat="server" ErrorMessage="Number must be greater than 0"
                    MinimumValue="1" MaximumValue="400" ControlToValidate="quantity2_" Type="Integer"></asp:RangeValidator>
                    <asp:CompareValidator ID="quantityCompareValidator" runat="server" ErrorMessage="Quantity must be a number!"
                    ControlToValidate="quantity2_" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator> -->
                    <label for="quantity">Quantity</label>
                    <asp:DropDownList ID="quantityDrop" CssClass="form-control" Style="width: auto;" runat="server">
                        <asp:ListItem Text="Select Quantity" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                    </asp:DropDownList>
                </div>             
            </div>
<hr />