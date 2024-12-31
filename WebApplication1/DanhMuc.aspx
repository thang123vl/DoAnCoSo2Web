﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="WebApplication1.DanhMuc1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Ly Nhà Cung Cấp</title>
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
    background-color: #343a40;
    height: 38px;
    text-align: center;
    padding-top: 20px;
    border-right: 1px solid #007bff;
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


/* Content Area Styling */
.content {
    padding: 20px;
}

/* Add and Expired Forms */
.form-add, .form-expired {
    margin-top: 40px;
    padding: 20px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-add h2, .form-expired h2 {
    margin-bottom: 20px;
    color: #007bff;
}

/* Form Group Styling */
.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}

/* Buttons in Forms */
.form-buttons {
    display: flex;
    justify-content: flex-start;
    gap: 10px;
}

.form-buttons button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.form-buttons button:hover {
    opacity: 0.9;
}

/* Table Styling */
.table-container {
    max-width: 100%;
    margin: 0 auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    overflow-x: auto;
}

.table-container h1 {
    text-align: center;
    color: #2d7aff;
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
    text-align: center;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
    color: #2d7aff;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Action Buttons Styling */
.action-buttons {
    display: flex;
    gap: 10px;
    justify-content: center;
}

.action-buttons a {
    text-decoration: none;
    color: white;
    padding: 5px 15px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: bold;
}

.action-buttons .edit {
    background-color: #007bff;
}

.action-buttons .delete {
    background-color: #dc3545;
}

.action-buttons a:hover {
    opacity: 0.8;
}

/* Button Links Styling */
.button-link {
    display: inline-block;
    text-decoration: none;
    text-align: center;
    padding: 10px 20px;
    margin: 5px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
}

#btnAdd, #btnhh {
    background-color: #00ff3a00;
    color: #2d7aff;
    border: 1px solid #2d7aff;
}

#btnAdd:hover, #btnhh:hover {
    background-color: #47476d;
}

.search-container {
    display: flex;
    align-items: center;
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

.menu a.active {
    background-color: #007bff;
    color: white;
}

.footer {
    background-color: #343a40;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 20px;
    border-top: 1px solid #007bff;
}

.footer a {
    color: #007bff;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}

.footer-content p {
    margin: 5px 0;
    font-size: 14px;
}

    </style>
</head>
<body>        
    <form id="form1" runat="server">

        <!-- Header Section -->
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
        <div class="baoboc">
        <!-- Sidebar menu -->
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



        <!-- Main content area -->
        <div class="content">
            <div class="table-container">
                <h1>Danh Sách Nhà Cung cấp</h1>
                  
            <div class="search-container">
                <asp:TextBox ID="txtTimKiem" runat="server" CssClass="search-box" Placeholder="Nhập tên danh mục"></asp:TextBox>
                <asp:Button ID="btnTimKiem" runat="server" CssClass="search-button" Text="Tìm" OnClick="btnTimKiem_Click1"  />
            </div>

                <table>
                    <thead>
                        <tr>
                            <th>Mã Danh Mục</th>
                            <th>Tên Danh Mục</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                               <% for (int i = 0; i < DM.Count;i++ )
                                  { %>
                            <tr>
                             
                                 <td><%=DM[i].MaDM%></td>
                                 <td><%=DM[i].TenDM%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="DanhMuc.aspx?action=delete&MaNCC=<%= DM[i].MaDM%>" class="delete" onclick="return confirm('Bạn chắc chắn muốn xóa danh mục này?');">Xóa</a>

                                    </div>
                                </td>
                            </tr>
                        <%} %>

                    </tbody>
                  
                </table>                      
                <div class="form-add">
                <div class="form-buttons">
                      <a href="ThemNhaCungCap.aspx"  id="btnhh" class="button-link"><i class="fas fa-pills"></i>Thêm Nhà Cung Cấp Mới</a>
                </div>
            </div>
               
            </div>

      

        </div>
            </div>
        
    </form>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-content">
            <p>© 2024 Quản Lý Thuốc. Designed by YourName.</p>
            <p>Liên hệ: <a href="mailto:contact@example.com">contact@example.com</a> | Hotline: 123-456-789</p>
        </div>
    </footer>

    <script>
        var currentPage = window.location.pathname;
        var menuLinks = document.querySelectorAll('.menu a');
        menuLinks.forEach(function (link) {
            if (currentPage.indexOf(link.getAttribute('href')) !== -1) {
                link.classList.add('active');
            }
        });
    </script>
</body>
    </html>