<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ChangeTheme.aspx.cs" Inherits="ChangeTheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" Runat="Server">
    <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    <div class="container well well-lg" style="width: 60%; padding: 70px; margin-left:142px; background-color: #ffffff">
    <h3 class="h3 page-header" style="margin-top:0px;">Change the page theme here!</h3>
        <br />
    <form role="form" runat="server">
    <div class="row">
    <div class="col-md-6" style="padding-left:60px; padding-top:20px;">
    <label class="radio-inline"><asp:RadioButton ID="light" GroupName="themes" runat="server"/>Light</label>
    <label class="radio-inline" style="padding-left:90px;"><asp:RadioButton ID="dark" GroupName="themes" runat="server"/>Dark</label>
    </div>
        <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
        <div class="container" style="text-align:center;" id="footer">
            <h5 class="footerText" style="color:#283593;"><b>Author: Kenny Perroni. #300825160 &copy; Copyright 2017</b></h5>
        </div>
    <div class="col-md-6">
    <asp:ImageButton ID="changeTheme" runat="server" Width="65px" ImageUrl="img/apply.png" Style="float: right;" title="Change theme" OnClick="changeTheme_Click"/>
    </div>
    </div>
            </form>
        </div>
  <!--Author: Kenny Perroni. #300825160 &copy; Copyright 2017-->
    <script>
        document.getElementById("logOut").hidden = false;
    </script>
</asp:Content>

