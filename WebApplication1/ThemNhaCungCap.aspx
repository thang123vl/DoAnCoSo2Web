<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNhaCungCap.aspx.cs" Inherits="WebApplication1.ThemNhaCungCap" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Thuốc</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
   body {
    font-family: Arial, sans-serif;
    background-color: #f4f5f7;
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

/* Main Content */


/* Table Container */
.table-container {
    width: 60%;
    margin: 20px auto;
    background-color: #343a40;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.table-container h1 {
    text-align: center;
    color: #007bff;
    margin-bottom: 15px;
    font-size: 18px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    text-align: left;
}

th, td {
    padding: 8px;
    border: 1px solid #ccc;
}

th {
    background-color: #f4f4f4;
    font-weight: bold;
    color: #007bff;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

td button {
    background-color: #f44336;
    color: white;
    border: none;
    padding: 4px 8px;
    cursor: pointer;
    border-radius: 4px;
    font-size: 12px;
}

td button:hover {
    background-color: #d32f2f;
}

/* Form Add and Search */
.form-add {
    margin-top: 40px;
    padding: 20px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-add h2 {
    color: #007bff;
    margin-bottom: 20px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #00000075;
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

/* Responsive Table */
@media (max-width: 768px) {
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
/* Input Field Styles */
input[type="text"],
input[type="password"],
input[type="email"],
input[type="number"],
textarea,
select {
    width: 100%; /* Chiếm toàn bộ chiều rộng container */
    padding: 10px; /* Khoảng cách bên trong */
    font-size: 14px; /* Kích thước chữ */
    border: 1px solid #ccc; /* Viền mặc định */
    border-radius: 4px; /* Góc bo tròn */
    background-color: #f9f9f9; /* Nền nhạt */
    outline: none; /* Loại bỏ viền mặc định khi focus */
    transition: border-color 0.3s, box-shadow 0.3s; /* Hiệu ứng mượt */
}

/* Focus State */
input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
input[type="number"]:focus,
textarea:focus,
select:focus {
    border-color: #007bff; /* Đổi màu viền khi focus */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Tạo hiệu ứng ánh sáng */
    background-color: #ffffff; /* Nền trắng */
}

/* Placeholder Styling */
input::placeholder,
textarea::placeholder {
    color: #999;
    font-style: italic; /* Văn bản placeholder in nghiêng */
}

/* Disabled Input */
input:disabled,
textarea:disabled,
select:disabled {
    background-color: #e9ecef; /* Màu nền xám nhạt */
    cursor: not-allowed; /* Thay đổi con trỏ */
}

/* Error State */
input.error,
textarea.error,
select.error {
    border-color: #dc3545; /* Viền đỏ */
    background-color: #f8d7da; /* Nền lỗi */
}

input.error:focus,
textarea.error:focus,
select.error:focus {
    box-shadow: 0 0 5px rgba(220, 53, 69, 0.5); /* Hiệu ứng focus lỗi */
}

/* Success State */
input.success,
textarea.success,
select.success {
    border-color: #28a745; /* Viền xanh */
    background-color: #d4edda; /* Nền thành công */
}

input.success:focus,
textarea.success:focus,
select.success:focus {
    box-shadow: 0 0 5px rgba(40, 167, 69, 0.5); /* Hiệu ứng focus thành công */
}

/* Textarea Resizing */
textarea {
    resize: vertical; /* Chỉ cho phép thay đổi chiều cao */
}

/* Label Styles */
label {
    font-weight: bold; /* In đậm */
    margin-bottom: 5px;
    display: block; /* Đặt nhãn trên đầu ô nhập */
    color: white; /* Màu chữ */
}

#btnXacNhan, #btnThem{
    width:155px;
    margin: 20px auto;   
    padding:10px;
    background-color: #ffffff00;
   color:black;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
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

        <!-- Layout -->
        <div class="layout">
            <!-- Sidebar -->
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


            <!-- Content -->
            <main class="content">
                <div class="form-add">
                    <h2>Thêm Nhà Cung Cấp</h2>
                    <div class="form-group">
                        <label for="txttennhacc">Tên Nhà Cung Cấp</label>
                        <asp:TextBox ID="txttennhacc" runat="server" Placeholder="Nhập họ tên"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtmst">MST</label>
                        <asp:TextBox ID="txtmst" runat="server" Placeholder="Mã số thuế"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtdiachinhacc">Địa Chỉ</label>
                        <asp:TextBox ID="txtdiachinhacc" runat="server" Placeholder="Nhập địa chỉ"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtDienThoai">Số Điện Thoại</label>
                        <asp:TextBox ID="txtDienThoai" runat="server" Placeholder="Nhập số điện thoại"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtemail">Email</label>
                        <asp:TextBox ID="txtemail" runat="server" Placeholder="Nhập email"></asp:TextBox>
                    </div>
                  <div class="form-buttons">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm Nhà Cung Cấp" OnClick="btnThem_Click" />
                    </div>
                </div>
            </main>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>© 2024 Quản Lý Thuốc. Designed by YourName.</p>
            <p>Liên hệ: <a href="mailto:contact@example.com">contact@example.com</a> | Hotline: 123-456-789</p>
        </footer>
    </form>
</body>
</html>
