<%@ page language="C#" autoeventwireup="true" inherits="HomePage, App_Web_syrzg4zt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.0.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div> <asp:Button ID="uxLogout" runat="server" CssClass="btn btn-danger pull-right" Text="LogOut" OnClick="uxLogout_Click"/>
    <h1>welcome To Flexiple</h1> 
        <h3><asp:Label ID="uxUserName" runat="server" Style="color:greenyellow"></asp:Label></h3>
        
       
    </div>
    </form>
</body>
</html>
