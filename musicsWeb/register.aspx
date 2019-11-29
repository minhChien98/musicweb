<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="musicsWeb.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng kí</title>
    <link type="text/css" rel="stylesheet" href="css/login.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="formDiv">
            <h2>Đăng kí</h2>
            <hr style="margin-bottom: 10px;" />
            <div class="username">
                Họ và tên <br />
                <asp:TextBox ID="name" runat="server" CssClass="textField" Width="70%" Height="30px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="name" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
            </div>
            <div class="username">
                Tên đăng nhập <br />
                <asp:TextBox ID="username" runat="server" CssClass="textField" Width="70%" Height="30px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rusername" ControlToValidate="username" CssClass="errMess" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                <asp:RegularExpressionValidator ID="expusername" runat="server" ControlToValidate="username" CssClass="errMess" ValidationExpression="[A-Za-z0-9]{5,}" ForeColor="Red" ErrorMessage="Không được chứa kí tự đặc biệt! Lớn hơn 5 kí tự" />
            </div>
            <div class="username">
                Mật khẩu <br />
                <asp:TextBox ID="password" runat="server" CssClass="textField" Width="70%" Height="30px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rpassword" CssClass="errMess" ControlToValidate="password" ErrorMessage="Bạn không được để trống trường này!" ForeColor="Red" runat="server" />
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="errMess" ControlToValidate="password" ValidationExpression="\w{8,}" ForeColor="Red" ErrorMessage="Mật khẩu phải lớn hơn 8 kí tự" />
            </div>
            <div class="username">
                Nhập lại mật khẩu <br />
                <asp:TextBox ID="repass" runat="server" CssClass="textField" Width="70%" Height="30px" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="repassword" ControlToCompare="password" CssClass="errMess" ControlToValidate="repass" ErrorMessage="Mật khẩu không khớp!" ForeColor="Red" runat="server" />
            </div>
            <hr />
            <asp:Button ID="btnRegister" runat="server" CssClass="btnLogin" Text="Đăng kí" OnClick="btnRegister_Click"/>
            <br />
            <a href="homePage.aspx" style="position: absolute; bottom: 10px; left: 10px; text-decoration: none;"><i>Về trang chủ</i></a>
            <a href="login.aspx" style="position: absolute; bottom: 10px; right: 10px; text-decoration: none;"><i>Đã có tài khoản? Đăng nhập</i></a>
        </div>
    </form>
</body>
</html>
