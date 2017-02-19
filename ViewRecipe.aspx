<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewRecipe.aspx.cs" Inherits="ViewRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="Server">
    <form id="form1" runat="server">
    <div class="container well well-lg" style="width: 80%; padding: 70px; background-color: #ffffff;">

        <h2 class="h2 page-header" style="margin-top: -20px; margin-bottom: 40px;">Your recipes in the pot so far!</h2>

        <asp:ListView ID="ListRecipeView" runat="server" DataSourceID="recipeItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>                
                    <td>
                        <asp:Label ID="prepareLabel" runat="server" Text='<%# Eval("prepare") %>' />
                    </td>
                    <td>
                        <asp:Label ID="submitterLabel" runat="server" Text='<%# Eval("submitter") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>                   
                    <td>
                        <asp:TextBox ID="prepareTextBox" runat="server" Text='<%# Bind("prepare") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="submitterTextBox" runat="server" Text='<%# Bind("submitter") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>                   
                    <td>
                        <asp:TextBox ID="prepareTextBox" runat="server" Text='<%# Bind("prepare") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="submitterTextBox" runat="server" Text='<%# Bind("submitter") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>                  
                    <td>
                        <asp:Label ID="prepareLabel" runat="server" Text='<%# Eval("prepare") %>' />
                    </td>
                    <td>
                        <asp:Label ID="submitterLabel" runat="server" Text='<%# Eval("submitter") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#EF6C00;color: #000000;">
                                    <th runat="server">Name of the Recipe</th>
                                    <th runat="server">Prepare Time/Cooking Time</th>
                                    <th runat="server">Submitter's Name</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>                   
                    <td>
                        <asp:Label ID="prepareLabel" runat="server" Text='<%# Eval("prepare") %>' />
                    </td>
                    <td>
                        <asp:Label ID="submitterLabel" runat="server" Text='<%# Eval("submitter") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="recipeItem" runat="server" SelectMethod="getRecipes" TypeName="Recipe"></asp:ObjectDataSource>
    </div>
    </form>
</asp:Content>

