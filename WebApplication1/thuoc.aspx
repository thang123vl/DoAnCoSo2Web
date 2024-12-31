<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thuoc.aspx.cs" Inherits="WebApplication1.WebForm3" %>

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
#formThemDanhMuc {
    position: absolute;
    top: 30%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    z-index: 1000;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

body.dimmed {
    background: rgba(0, 0, 0, 0.5);
    pointer-events: none;
}

/* Style cho form thêm danh mục */
#formThemDanhMuc {
    width: 400px;  /* Chiều rộng của form */
    margin: 50px auto;  /* Căn giữa form trong trang */
    padding: 20px;  /* Khoảng cách bên trong form */
    background-color: #f9f9f9;  /* Màu nền sáng */
    border-radius: 8px;  /* Bo góc cho form */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* Đổ bóng nhẹ cho form */
}

/* Style cho tiêu đề form */
#formThemDanhMuc h3 {
    text-align: center;  /* Căn giữa tiêu đề */
    color: #333;  /* Màu chữ tối */
    margin-bottom: 20px;  /* Khoảng cách dưới tiêu đề */
}

/* Style cho label */
#formThemDanhMuc label {
    font-weight: bold;  /* Làm đậm chữ */
    color: #555;  /* Màu chữ nhạt hơn */
}

/* Style cho TextBox */
#formThemDanhMuc .form-control {
    width: 380px;
    padding: 10px;  /* Khoảng cách bên trong */
    margin-bottom: 15px;  /* Khoảng cách dưới mỗi trường nhập */
    border: 1px solid #ccc;  /* Viền mỏng màu xám */
    border-radius: 5px;  /* Bo góc */
    font-size: 14px;  /* Kích thước chữ */
}

/* Style cho các nút */
#formThemDanhMuc .btn {
    width: 100%;  /* Nút rộng 100% */
    padding: 10px;  /* Khoảng cách bên trong nút */
    font-size: 16px;  /* Kích thước chữ nút */
    border-radius: 5px;  /* Bo góc cho nút */
    cursor: pointer;  /* Thêm con trỏ chuột khi hover */
    transition: background-color 0.3s ease, transform 0.3s ease;  /* Hiệu ứng chuyển màu và di chuyển khi hover */
}

/* Nút Lưu (green) */
#formThemDanhMuc .btn-success {
    background-color: #28a745;  /* Màu nền xanh lá */
    color: white;  /* Màu chữ trắng */
    border: none;  /* Không viền */
}

#formThemDanhMuc .btn-success:hover {
    background-color: #218838;  /* Màu nền khi hover */
    transform: translateY(-2px);  /* Di chuyển nhẹ lên khi hover */
}

/* Nút Hủy (red) */
#formThemDanhMuc .btn-danger {
    background-color: #dc3545;  /* Màu nền đỏ */
    color: white;  /* Màu chữ trắng */
    border: none;  /* Không viền */
}

#formThemDanhMuc .btn-danger:hover {
    background-color: #c82333;  /* Màu nền khi hover */
    transform: translateY(-2px);  /* Di chuyển nhẹ lên khi hover */
}

/* Hiển thị hộp thoại khi form có lỗi */
#formThemDanhMuc input:invalid {
    border-color: #dc3545;  /* Đổi màu viền khi dữ liệu không hợp lệ */
}


    </style>
</head>
<body>        
    <form id="form1" runat="server">

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
              <asp:Button ID="btnhh" runat="server" OnClick="Button1_Click" Text="Đăng Xuất" />
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

      
                    <h1> Sách Thuốc</h1>
                      <div class="search-container">
                <asp:TextBox ID="txtTimKiem" runat="server" CssClass="search-box" Placeholder="Nhập tên thuốc..."></asp:TextBox>
                <asp:Button ID="btnTimKiem" runat="server" CssClass="search-button" Text="Tìm" OnClick="btnTimKiem_Click" />
            </div>
                <table>
                    <thead>
                        <tr>
                            <th>Mã Thuốc</th>
                            <th>Mã Danh Mục</th>
                            <th>Mã Nhân Viên</th>
                            <th>Mã Nhà Cung Cấp</th>
                            <th>Tên Thuốc</th>
                            <th>Mô Tả</th>
                            <th>Tình Trạng</th>
                            <th>Đơn Giá</th>
                            <th>Số Lượng</th>
                            <th>Ngày Cung Cấp</th>
                            <th>Ngày Sản Xuất</th>
                            <th>Ngày Hết Hạn</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var thuocItem in thuoc) { %>
                            <tr>
                                <td><%= thuocItem.MaThuoc %></td>
                                <td><%= thuocItem.MaDM %></td>
                                <td><%= thuocItem.MaNV %></td>
                                <td><%= thuocItem.MaNCC %></td>
                                <td><%= thuocItem.TenThuoc %></td>
                                <td><%= thuocItem.MoTa %></td>
                                <td><%= thuocItem.TinhTrang %></td>
                                <td><%= thuocItem.DonGia.ToString() %> VND</td>
                                <td><%= thuocItem.SoLuong %></td>
                                <td><%= thuocItem.NgayCungCap.ToString("yyyy-MM-dd") %></td>
                                <td><%= thuocItem.NgaySX.ToString("yyyy-MM-dd") %></td>
                                <td><%= thuocItem.NgayHH.ToString("yyyy-MM-dd") %></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="chinhsuathuoc.aspx?idthuoc=<%= thuocItem.MaThuoc %>" class="edit"><i class="fas fa-edit"></i> Sửa</a>
                                        <a href="thuoc.aspx?action=delete&maThuoc=<%= thuocItem.MaThuoc %>" class="delete" onclick="return confirm('Bạn chắc chắn muốn xóa Thuốc  này?');"><i class="fas fa-trash"></i> Xóa</a>
                                    </div>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                      <div class="form-add">
                <div class="form-buttons">
                      <a href="addthuoc.aspx"  id="btnhh" class="button-link"><i class="fas fa-pills"></i>Thêm Thuốc</a>
                    <a href="thuochethan.aspx" id="btnhh" class="button-link"><i class="fas fa-exclamation-triangle"></i> Thuốc Hết Hạn!!</a>
                    <a href="thuochethang.aspx" id="btnhh" class="button-link"><i class="fas fa-box-open"></i> Hết Hàng</a>
                    <asp:Button ID="btnThemDanhMuc" runat="server" Text="Thêm danh mục" OnClick="btnThemDanhMuc_Click" CssClass="btn btn-primary" />
                    <div id="formThemDanhMuc" runat="server" style="display: none;">
                        <h3>Thêm danh mục mới</h3>
                        <label for="txtTenDanhMuc">Tên danh mục:</label>
                        <asp:TextBox ID="txtTenDanhMuc" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnLuuDanhMuc" runat="server" Text="Lưu" CssClass="btn btn-success" OnclientClick="" OnClick="btnLuuDanhMuc_Click" />
                        <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClientClick="hideForm(); return false;" CssClass="btn btn-danger" />
                    </div>

                </div>
            </div>
            </div>

      

            <asp:Label ID="lblThongBao" runat="server" CssClass="search-message" Text=""></asp:Label>
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
        function showForm() {
            document.getElementById('formThemDanhMuc').style.display = 'block';
            document.body.classList.add('dimmed');
        }

        function hideForm() {
            document.getElementById('formThemDanhMuc').style.display = 'none';
            document.body.classList.remove('dimmed');
        }
    </script>
</body>
