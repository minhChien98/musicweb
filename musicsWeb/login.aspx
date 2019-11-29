<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="musicsWeb.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/login.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="formDiv">
            <h2>Đăng nhập</h2>
            <hr style="margin-bottom: 10px;" />
            <div class="username">
                Tên đăng nhập <br />
                <asp:TextBox ID="username" runat="server" CssClass="textField" Width="70%" Height="30px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rusername" ControlToValidate="username" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
            </div>
            <div class="username">
                Mật khẩu <br />
                <asp:TextBox ID="password" runat="server" CssClass="textField" Width="70%" Height="30px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rpassword" CssClass="errMess" ControlToValidate="password" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
            </div>
            <hr />
            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btnLogin" Text="Đăng nhập" OnClick="btnLogin_Click" />
            <br />
            <a href="homePage.aspx" style="position: absolute; bottom: 10px; left: 10px; text-decoration: none;"><i>Về trang chủ</i></a>
            <a href="register.aspx" style="position: absolute; bottom: 10px; right: 10px; text-decoration: none;"><i>Đăng kí tài khoản</i></a>
        </div>
    </form>
</body>
</html>
