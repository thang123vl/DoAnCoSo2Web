<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dangnhap.css">
    <title>Document</title>
</head>
<body>
  
    <form id="form1" runat="server">
        <div class="Formdangnhap">
   
            <div class="tieude"> <h3 class="h1">ĐĂNG NHẬP</h3></div>
            <h3 class="h3">Tài khoản</h3>

            <div class="formtk">
                <asp:TextBox ID="txtTKNhap" runat="server" CssClass="inputtk" placeholder="Tài khoản" TextMode="SingleLine"></asp:TextBox>
            </div>

            <h3 class="h3">Mật khẩu</h3>
            <div id="formmk">
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="inputmk" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                <label class="showp">
                    <input type="checkbox" id="showPassword" onclick="togglePassword()"> Hiện mật khẩu
                </label>
            </div>
            <div class="forget"><a href="">Quên mật khẩu?</a></div>

            <div class="formdkdn">
                 <!-- Nút Button1 vẫn giữ nguyên -->
                 <asp:Button ID="Button1" runat="server" CssClass="bttdk" Text="Đăng Nhập" OnClick="Button1_Click"/>
            </div>
        </div>
                 <div class="center-label">
                     <asp:Label ID="thongbao" runat="server"></asp:Label>
</div>

    </form>

</body>
<script src="test.js"></script>
</html>
