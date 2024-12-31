<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="suanhannv.aspx.cs" Inherits="WebApplication1.suanhanvn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa Thuốc</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    padding: 0;
     margin: 0;
    padding: 0;
    overflow-x: hidden; /* Ẩn thanh cuộn ngang */
}
  .footer {
    background-color: #343a40;
    color: white;
    text-align: center;
    padding: 20px;
    bottom: 0;
    left: 0;
    width: 100%;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
}

.footer .footer-content {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.footer p {
    margin: 5px 0;
    font-size: 14px;
}

.footer a {
    color: #007bff;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}

/* Header Styles */
.header {
    background-color: #343a40;
    color: white;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #007bff;
}

.header h1 {
    margin: 0;
    font-size: 24px;
}

.header .logo {
    display: flex;
    align-items: center;
}

.header .logo img {
    width: 40px;
    height: 40px;
    margin-right: 10px;
}

.header .logo span {
    font-size: 24px;
    font-weight: bold;
}

.header .user-info {
    display: flex;
    align-items: center;
    color: white;
}

.header .user-info img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

.header .user-name {
    font-size: 16px;
}

/* Sidebar Styles */
.menu {
        width: 100%;
    background-color: #343a40;
    position: relative; /* Bỏ position: fixed, sử dụng relative */
    height: 38px; /* Đảm bảo chiều cao của menu chiếm hết chiều cao màn hình */
    flex-direction: column;
    padding-top: 20px;
    border-right: 1px solid #007bff;
    text-align:center;
}

.menu a {
   color: white;
    text-decoration: none;
    padding: 15px;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 10px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.menu a:hover {
    background-color: #007bff;
}

.menu a.active {
    background-color: #0056b3;
}

/* Main Content */
.content {
    margin-left: 220px;
    padding: 20px;
    background-color: #fff;
    min-height: 100vh;
}

/* Table Styles */
.table-container {
    max-width: 100%;
    margin: 0 auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    overflow-x: auto;
}

.table-container h1 {
    text-align: center;
    color: #007bff;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    text-align: left;
    padding: 10px;
    border: 1px solid #ccc;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
    color: #007bff;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Form Add and Search */
.form-add, .form-expired {
    margin-top: 40px;
    padding: 20px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-add h2, .form-expired h2 {
    color: #007bff;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input, .form-group select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}

.form-buttons {
    display: flex;
    gap: 10px;
}

.form-buttons button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: opacity 0.3s;
}

.form-buttons button:hover {
    opacity: 0.9;
}

/* Search Bar */
.search-container {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.search-box {
   width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 10px;
    outline: none;
    transition: border-color 0.3s;
}

.search-box:focus {
    border-color: #007bff;
}

.search-button {
    padding: 9px 20px;
    font-size: 16px;
    font-weight: bold;
    color: white;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s, box-shadow 0.3s;
}

.search-button:hover {
    background-color: #0056b3;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.search-button:active {
    background-color: #004494;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
}

.search-button:disabled {
    background-color: #cccccc;
    cursor: not-allowed;
}

.search-message {
    margin-top: 10px;
    font-size: 14px;
    font-weight: bold;
    color: #ff0000;
    text-align: center;
}

/* Button Links */
.button-link {
    display: inline-block;
    text-decoration: none;
    padding: 8px 15px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.button-link:hover {
    background-color: #0056b3;
}

/* Dropdown List */
.form-group select, .form-group .aspDropDownList {
    padding: 8px 12px;
    font-size: 14px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background-color: white;
    width: 150px;
    margin-bottom: 15px;
}

.form-group select:hover, .form-group select:focus {
    border-color: #007bff;
}

/* Responsive Table */
@media screen and (max-width: 768px) {
    .menu {
        width: 200px;
    }

   

    table, th, td {
        font-size: 12px;
    }

    .search-box {
        width: 200px;
    }
}
.vua{
    display:flexbox;
}

.action-buttons {
    display: flex;
    gap: 10px; /* Khoảng cách giữa các nút */
}

.action-buttons a {
    text-decoration: none; /* Loại bỏ gạch chân */
    padding: 8px 16px; /* Đệm cho nút */
    font-size: 14px; /* Kích thước chữ */
    border-radius: 4px; /* Bo tròn các góc */
    transition: all 0.3s ease; /* Hiệu ứng mượt */
    text-align: center; /* Căn giữa nội dung */
}

/* Nút sửa */
.action-buttons .edit {
    background-color: #007bff; /* Màu xanh lam */
    color: white; /* Chữ trắng */
    border: 1px solid #0056b3; /* Viền màu xanh đậm */
}

.action-buttons .edit:hover {
    background-color: #0056b3; /* Màu xanh đậm khi hover */
    border-color: #003f7f; /* Viền tối hơn */
    transform: scale(1.05); /* Phóng to nhẹ */
}

/* Nút hồ sơ */
.action-buttons .edit:nth-of-type(2) {
    background-color: #28a745; /* Màu xanh lá */
    border: 1px solid #1e7e34; /* Viền màu xanh đậm */
}

.action-buttons .edit:nth-of-type(2):hover {
    background-color: #1e7e34; /* Màu xanh đậm khi hover */
    border-color: #155d27; /* Viền tối hơn */
    transform: scale(1.05); /* Phóng to nhẹ */
}

/* Nút xóa */
.action-buttons .delete {
    background-color: #dc3545; /* Màu đỏ */
    color: white; /* Chữ trắng */
    border: 1px solid #b21f30; /* Viền màu đỏ đậm */
}

.action-buttons .delete:hover {
    background-color: #b21f30; /* Màu đỏ đậm khi hover */
    border-color: #8a1c25; /* Viền tối hơn */
    transform: scale(1.05); /* Phóng to nhẹ */
}
/* Container for the form */
.form-container {
    width: 100%;
    max-width: 500px; /* Adjust max-width as needed */
    margin: 0 auto; /* Centers the form horizontally */
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1 {
    font-size: 24px;
    color: #007bff;
    margin-bottom: 20px;
}

/* Form Group */
.form-group {
    margin-bottom: 15px;
    text-align: left;
}

/* Label Styles */
label {
    font-weight: bold;
    color: #333;
    display: block;
    margin-bottom: 8px;
}

/* Input and Textarea Styles */
input, textarea, .form-control {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f9f9f9;
    outline: none;
}

/* Focus State */
input:focus, textarea:focus, .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* Button Styles */
#UpdateButton {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#UpdateButton:hover {
    background-color: #0056b3;
}

/* Adjust form control to make dropdowns consistent with inputs */
.form-control {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f9f9f9;
}

    </style>
</head>
<body>
            <!-- Header Section -->
        <div class="header">
            <!-- Logo and Title -->
            <div class="logo">
                <img src="https://marketplace.canva.com/EAE00hkstG4/1/0/1600w/canva-green-creative-pharmacy-concept-logo-design-vrYTrSUJ0U4.jpg" alt="Logo">
                <span>Quản Lý Thuốc</span>
            </div>
             <span id="lblFullName1" class="user-name1" runat="server">Xin Chào</span>
            
      <a href="profile.aspx" class="linkprofile">
                  <div class="user-info">
                  <!-- Hiển thị ảnh đại diện -->
                <img id="imgAvatar" src="https://anime-dandadan.com/_assets/images/char/nav/ken.png" alt="Avatar" class="avatar" runat="server" />
                <!-- Hiển thị tên người dùng -->
          <span id="lblFullName" class="user-name" runat="server">Nguyễn Hữu Tín</span>


            </div>
          </a>
        </div>
   <div class="menu">
    <!-- Trang chủ -->
      <a href="TrangChu.aspx" class="add-button"><i class="fas fa-house-user"></i> TRANG CHỦ</a>

    <!-- Nhập hàng -->
    <a href="nhaphang.aspx" class="add-button"><i class="fas fa-box-open"></i> NHẬP HÀNG</a>

    <!-- Thuốc -->
      <a href="thuoc.aspx" class="add-button"><i class="fas fa-pills"></i>SẢN PHẨM</a>

    <!-- Hóa đơn nhập -->
    <a href="hoadon.aspx" class="add-button"><i class="fas fa-file-alt"></i> HÓA ĐƠN NHẬP</a>

    <!-- Hóa đơn xuất -->
    <a href="HoaDonBan.aspx" class="add-button"><i class="fas fa-file-export"></i> HÓA ĐƠN XUẤT</a>

    <!-- Bán thuốc -->
    <a href="banthuoc.aspx" class="add-button"><i class="fas fa-shopping-cart"></i> BÁN THUỐC</a>

    <!-- Nhà cung cấp -->
    <a href="NhaCungCap.aspx" class="add-button"><i class="fas fa-truck"></i> NHÀ CUNG CẤP</a>

    <!-- Quản lý nhân viên -->
    <a href="nhanvien.aspx" class="add-button"><i class="fas fa-user-tie"></i> QUẢN LÍ NHÂN VIÊN</a>

     <a href="KhachHang.aspx" class="add-button"><i class="fas fa-users"></i> KHÁCH HÀNG</a>
</div>


   <div class="form-container">
    <h1>NHÂN VIÊN <%=nv.TenNV %></h1>
    <form id="editNhanVienForm" runat="server" method="post">
        <div class="form-group">
            <label for="TenNV">Tên Nhân Viên</label>
            <input type="text" id="TenNV" name="TenNV" runat="server" required />
        </div>
        
        <div class="form-group">
            <label for="MaCN">Chi Nhánh</label>
            <asp:DropDownList ID="MaCN" runat="server" class="form-control">
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="Email">Email</label>
            <input type="email" id="Email" name="Email" runat="server" required />
        </div>
        
        <div class="form-group">
            <label for="DiaChi">Địa Chỉ</label>
            <textarea id="DiaChi" name="DiaChi" rows="4" runat="server" required></textarea>
        </div>

        <div class="form-group">
            <label for="SDT">Số Điện Thoại</label>
            <input type="tel" id="SDT" name="SDT" runat="server" required />
        </div>
        
        <div class="form-group">
            <label for="GioiTinh">Giới Tính</label>
            <asp:DropDownList ID="GioiTinh" runat="server" class="form-control">
                <asp:ListItem Text="Nam" Value="Nam" />
                <asp:ListItem Text="Nữ" Value="Nữ" />
            </asp:DropDownList>
        </div>
          <div class="form-group">
            <label for="GioiTinh">Quyền Hạn</label>
            <asp:DropDownList ID="userrole" runat="server" class="form-control">
                <asp:ListItem Text="Admin" Value="Admin" />
                <asp:ListItem Text="User" Value="User" />
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Button ID="UpdateButton" runat="server" Text="CẬP NHẬT" OnClick="UpdateButton_Click" />
        </div>
    </form>
</div>
    </html>