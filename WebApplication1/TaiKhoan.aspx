<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaiKhoan.aspx.cs" Inherits="WebApplication1.TaiKhoan1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Thuốc</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <style>
       /* General Body Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #47476d;
    margin: 0;
    padding: 0;
}

/* Header Styling */
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
/* Sidebar Menu */
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
    background-color: #007bff; /* Highlight on hover */
    color: white;
    transition: 0.2s;
}

.menu a.active {
    background-color: #007bff; /* Highlight active menu item */
}

.menu a:last-child {
    border-bottom: none; /* Remove border for the last menu item */
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

        header {
            background-color: #003366;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        .company-info {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .company-info img {
            height: 50px;
        }

        .company-info .company-name {
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .company-info .company-contact {
            font-size: 14px;
            color: #ccc;
        }

        .profile-container {
            max-width: 1000px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-container h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .profile-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .profile-info div {
            margin-bottom: 15px;
            width: 48%;
        }

        .profile-info label {
            font-weight: bold;
        }

        .profile-info p {
            font-size: 14px;
        }
        .vua {
            display:flex;
        }
        .employee-image {
    text-align: center; /* Căn giữa ảnh */
    width: 100%;        /* Chiếm hết chiều rộng của phần chứa */
    margin-bottom: 20px; /* Khoảng cách dưới ảnh */
}

.employee-image img {
    max-width: 150px;        /* Chiều rộng tối đa của ảnh */
    height: auto;            /* Giữ tỷ lệ ảnh */
    border-radius: 50%;      /* Cắt ảnh thành hình tròn */
    border: 2px solid #003366; /* Đường viền quanh ảnh, có thể tùy chỉnh màu sắc */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ cho ảnh */
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


        <div class="vua"> 
   
        <div class="profile-container">

        <h2>Thông Tin Nhân Viên</h2>
                    <div class="employee-image">
            <img src="https://i.pinimg.com/736x/00/38/a9/0038a9b7ca2d0e0bcd8154c25aebf0e7.jpg" alt="Employee Image">
        </div>
        <div class="profile-info">

            <div>
                <label for="manv">Mã nhân viên:</label>
                <p id="manv"><%=listtk.MaNV %></p>
            </div>
            <div>
                <label for="ten">Họ Và Tên:</label>
                <p id="ten"><%=listtk.Ten %></p>
            </div>
            <div>
                <label for="chucDanh">Chức danh:</label>
                <p id="chucDanh"><%=listtk.UserRole %></p>
            </div>
            <div>
                <label for="email">Email:</label>
                <p id="email"><%=listtk.Email %></p>
            </div>
            <div>
                <label for="thoiGianLamViec">Thời gian làm việc:</label>
                <p id="thoiGianLamViec">8:00 AM - 5:00 PM</p>
            </div>
            <div>
                <label for="diaChi">Địa chỉ:</label>
                <p id="diaChi">Số 123, Đường ABC, TP HCM</p>
            </div>
     
            <div>
                <label for="soDienThoai">Số điện thoại:</label>
                <p id="soDienThoai"><%=listtk.SDT %></p>
            </div>
          
            <div>
                <label for="tk">Tài khoản:</label>
                <p id="tk"><%=listtk.Username %></p>
            </div>
              <div>
                <label for="mk">mật khẩu:</label>
                <p id="mk"><%=listtk.Pass %></p>
            </div>
              <div>
                <label for="chiNhanh">Chi nhánh:</label>
                <p id="chiNhanh">Chi nhánh TP Cần Thơ</p>
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
