<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="RecipeDetail.aspx.cs" Inherits="RecipeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" Runat="Server">
    <form id="form1" runat="server">
    <div class="container well well-lg" Runat="Server" style="width: 80%; padding: 70px; background-color: #ffffff;">

        <h2 class="h2 page-header" runat="server" style="margin-top: -20px; margin-bottom: 40px;">Your recipes in the pot so far!</h2>

        <asp:DataList ID="recipeList" runat="server"  DataKeyField="ID" DataSourceID="SqlDataSource2">

               
            
                <ItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Category:
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    Serves:
                    <asp:Label ID="ServesLabel" runat="server" Text='<%# Eval("Serves") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    Prepare:
                    <asp:Label ID="PrepareLabel" runat="server" Text='<%# Eval("Prepare") %>' />
                    <br />
                    Author:
                    <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                    <br />
                    idCategory:
                    <asp:Label ID="idCategoryLabel" runat="server" Text='<%# Eval("idCategory") %>' />
                    <asp:LinkButton id="button1"  Text="Display Operations" CommandName="select" runat="server"/>
                    <br />
                    <br />
                </ItemTemplate>

               
            
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RecipePot %>" SelectCommand="SELECT A.idRecipe AS ID, A.name AS Name, B.name AS Category, A.serves AS Serves, A.description AS Description, A.prepareCookingTime AS Prepare, A.submittedBy AS Author, B.idCategory FROM recipe AS A INNER JOIN category AS B ON A.idCategory = B.idCategory WHERE (A.idRecipe = @idRecipe)">
            <SelectParameters>
                <asp:QueryStringParameter Name="idRecipe" QueryStringField="idRecipe" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:DetailsView ID="DetailsView1" OnModeChanging = "ModeChanging"  OnItemUpdated="recipe_ItemUpdated" OnItemDeleted="recipe_ItemDeleted" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="idRecipe" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="idRecipe" HeaderText="idRecipe" InsertVisible="False" ReadOnly="True" SortExpression="idRecipe" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:TemplateField HeaderText="serves" SortExpression="serves">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" SelectedValue='<%# Bind("serves") %>' runat="server">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("serves") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("serves") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="prepareCookingTime" HeaderText="prepareCookingTime" SortExpression="prepareCookingTime" />
                <asp:TemplateField HeaderText="idCategory" SortExpression="idCategory">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("idCategory") %>' DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="idCategory"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecipePot %>" SelectCommand="SELECT [idCategory], [name] FROM [category]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idCategory") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idCategory") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
          
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecipePot %>" DeleteCommand="DELETE FROM [recipe] WHERE [idRecipe] = @idRecipe" InsertCommand="INSERT INTO [recipe] ([name], [serves], [description], [prepareCookingTime], [idCategory]) VALUES (@name, @serves, @description, @prepareCookingTime, @idCategory)" SelectCommand="SELECT [idRecipe], [name], [serves], [description], [prepareCookingTime], [idCategory] FROM [recipe] WHERE ([idRecipe] = @idRecipe)" UpdateCommand="UPDATE [recipe] SET [name] = @name, [serves] = @serves, [description] = @description, [prepareCookingTime] = @prepareCookingTime, [idCategory] = @idCategory WHERE [idRecipe] = @idRecipe">
            <DeleteParameters>
                <asp:Parameter Name="idRecipe" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="serves" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="prepareCookingTime" Type="String" />
                <asp:Parameter Name="idCategory" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="recipeList" Name="idRecipe" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="serves" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="prepareCookingTime" Type="String" />
                <asp:Parameter Name="idCategory" Type="Int32" />
                <asp:Parameter Name="idRecipe" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="form-group float-label-control" runat="server" id="addNewCategory">
        <asp:TextBox ID="addCategoryText" runat="server"></asp:TextBox>    
        <asp:Button ID="addCategoryButton" runat="server" Text="Add new Category" OnClick="addCategoryButton_Click"/>
        </div>
       <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>

      

    </div>
        </form>

</asp:Content>

