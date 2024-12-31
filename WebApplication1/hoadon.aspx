<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hoadon.aspx.cs" Inherits="WebApplication1.hoadon" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Thuốc</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
       /* Global Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    padding: 0;
   margin: 0;
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

       #myChart {
            max-width: 600px; /* Thu nhỏ biểu đồ (chiều rộng tối đa) */
            max-height: 600px; /* Thu nhỏ biểu đồ (chiều cao tối đa) */
            margin: 0 auto; /* Canh giữa biểu đồ */
            display: block;
        }

        /* CSS cho vùng chứa */

        h2 {
            text-align: center;
            font-family: Arial, sans-serif;
            font-size: 18px; /* Thu nhỏ tiêu đề */
            color: #333; /* Màu sắc của tiêu đề */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <!-- ScriptManager for Ajax functionality -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

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

    <!-- Sidebar menu -->

<div class="vua">
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



        <div class="table-container">
            <h1>Danh Sách Hóa Đơn Nhập</h1>
            
                <div class="search-container">
                    <asp:TextBox ID="txtTimKiem" runat="server" CssClass="search-box" Placeholder="Nhập tên Nhân Viên"></asp:TextBox>
                    <asp:Button ID="btnTimKiem" runat="server" CssClass="search-button" Text="Tìm" OnClick="btnTimKiem_Click" />
                </div>
            <table>
                <div class="form-group">
    <label for="ddlMonth">Tháng</label>
    <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
<asp:ListItem Text="không chọn" Value="0" /> 
    <asp:ListItem Text="Tháng 1" Value="1" />
    <asp:ListItem Text="Tháng 2" Value="2" />
    <asp:ListItem Text="Tháng 3" Value="3" />
    <asp:ListItem Text="Tháng 4" Value="4" />
    <asp:ListItem Text="Tháng 5" Value="5" />
    <asp:ListItem Text="Tháng 6" Value="6" />
    <asp:ListItem Text="Tháng 7" Value="7" />
    <asp:ListItem Text="Tháng 8" Value="8" />
    <asp:ListItem Text="Tháng 9" Value="9" />
    <asp:ListItem Text="Tháng 10" Value="10" />
    <asp:ListItem Text="Tháng 11" Value="11" />
    <asp:ListItem Text="Tháng 12" Value="12" />
</asp:DropDownList>


    <label for="ddlYear">Năm</label>
    <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
         <asp:ListItem Text="Không chọn" Value="0" />
        <asp:ListItem Text="2023" Value="2023" />
        <asp:ListItem Text="2024" Value="2024" />
        <asp:ListItem Text="2025" Value="2025" />
    </asp:DropDownList>
</div>
                <thead>
                    <tr>
                        <th>Mã Hóa Đơn Nhập</th>
                        <th>Mã Nhân Viên</th>
                        <th>Mã Nhà Cung Cấp</th>
                        <th>Ngày Đặt</th>
                        <th>Tổng Tiền</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>


                    <% for (int i = 0; i < hdnhap.Count; i++) { %>
                    <tr>
                        <td><%= hdnhap[i].MaHDNhap %></td>
                        <td><%= hdnhap[i].MaNV %></td>
                        <td><%= hdnhap[i].MaNCC %></td>
                        <td><%= hdnhap[i].NgayDat.ToString("yyyy-MM-dd") %></td>
                        <td><%= hdnhap[i].TongTien.ToString() %> VND</td>
                        <td>
                            <a href="chitietnhap.aspx?mahoadon=<%= hdnhap[i].MaHDNhap %>" class="button-link">In hóa đơn</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        

    </div>

    <asp:Label ID="lblThongBao" runat="server" CssClass="search-message" Text=""></asp:Label>

    </form>

  <div>
            <h2>Biểu đồ thống kê doanh thu hàng tháng</h2>
            <canvas id="myChart" width="900" height="500"></canvas>
        </div>
        <footer class="footer">
        <div class="footer-content">
            <p>© 2024 Quản Lý Thuốc. Designed by YourName.</p>
            <p>Liên hệ: <a href="mailto:contact@example.com">contact@example.com</a> | Hotline: 123-456-789</p>
        </div>
    </footer>
</body>
<script>

    // Script for handling active link
    var currentPage = window.location.pathname;
    var menuLinks = document.querySelectorAll('.menu a');
    menuLinks.forEach(function (link) {
        if (currentPage.indexOf(link.getAttribute('href')) !== -1) {
            link.classList.add('active');
        }
    });
    var totalRevenues = [<%= string.Join(",", (decimal[])ViewState["TotalMonths"] ?? new decimal[12]) %>];
    var months = ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'];
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: months,
            datasets: [{
                label: 'Doanh thu (triệu VND)',
                data: totalRevenues,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>
</html>