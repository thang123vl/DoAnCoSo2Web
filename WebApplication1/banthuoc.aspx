<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="banthuoc.aspx.cs" Inherits="WebApplication1.WebForm5" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Thêm Thuốc</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
     body {
    font-family: Arial, sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    align-items:center;
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
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #999;
}

.form-group input, .form-group select {
        width: 222px;
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
input[type="password"],
input[type="email"],
input[type="number"],
textarea,
select {
    width: 400px;
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

#btnXacNhan, #btnThem {
    width: 120px;
    margin: 20px auto;
    padding: 10px;
    background-color: #ffffff00; /* Nền trong suốt */
    color: #000000ab; /* Màu chữ xám đậm */
    border: 1px solid #000000ab; /* Viền mờ */
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease; /* Hiệu ứng mượt */
}

#btnXacNhan:hover, #btnThem:hover {
    background-color: #000000ab; /* Nền xám đậm */
    color: #ffffff; /* Chữ trắng */
    transform: scale(1.1); /* Tăng kích thước */
    border-color: #ffffff; /* Viền trắng */
}

/* Repeater Container */
/* Repeater Container */
#ProductRepeater {
 
    flex-wrap: nowrap; /* Không cho phép xuống dòng */
    gap: 10px;
    justify-content: flex-start;
    overflow-x: auto; /* Cuộn ngang nếu nội dung vượt quá kích thước container */
    padding: 10px;
    margin:0 auto;
}

/* Individual Product Card */
.product {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-top:60px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 120px; /* Giảm kích thước sản phẩm */
    text-align: center;
    padding: 8px;
    transition: transform 0.2s, box-shadow 0.2s;
    flex-shrink: 0; /* Ngăn sản phẩm co lại trong container */
}

.product:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

/* Product Image */
.product img {
    width: 80%;
    border-radius: 5px;
    margin-bottom: 5px;
}

/* Product Name */
.product h3 {
    font-size: 12px; /* Giảm kích thước chữ */
    color: #333;
    margin-bottom: 5px;
}

/* Product Price and Quantity */
.product p {
    font-size: 10px; /* Giảm kích thước chữ */
    color: #666;
    margin-bottom: 5px;
}

/* Add to Cart Button */
.btn-add-cart {
    display: inline-block;
    background-color: #28a745;
    color: #fff;
    font-size: 10px; /* Giảm kích thước chữ */
    border: none;
    border-radius: 4px;
    padding: 4px 8px; /* Giảm kích thước padding */
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-add-cart:hover {
    background-color: #218838;
}
/* Container for the Repeater */
#ProductRepeater {
    display: flex; /* Kích hoạt Flexbox */
    flex-wrap: nowrap; /* Không cho phép xuống dòng */
    gap: 10px; /* Khoảng cách giữa các sản phẩm */
    justify-content: flex-start; /* Sắp xếp từ trái sang phải */
    overflow-x: auto; /* Cuộn ngang nếu nội dung vượt chiều rộng container */
    padding: 10px;
    white-space: nowrap; /* Đảm bảo nội dung không xuống dòng */
    background-color: #f8f9fa; /* Tùy chọn màu nền */
}

/* Individual Product Card */
.product {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 120px; /* Giảm kích thước sản phẩm */
    text-align: center;
    padding: 8px;
    transition: transform 0.2s, box-shadow 0.2s;
    flex-shrink: 0; /* Ngăn sản phẩm co lại */
    margin-right:20px;
    Height: 200px;
}

.product:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

/* Product Image */
.product img {
    width: 80%;
    border-radius: 5px;
    margin-bottom: 5px;
}

/* Product Name */
.product h3 {
    font-size: 12px;
    color: #333;
    margin-bottom: 5px;
}

/* Product Price and Quantity */
.product p {
    font-size: 10px;
    color: #666;
    margin-bottom: 5px;
}

/* Add to Cart Button */
.btn-add-cart {
    display: inline-block;
    background-color: #28a745;
    color: #fff;
    font-size: 10px;
    border: none;
    border-radius: 4px;
    padding: 4px 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-add-cart:hover {
    background-color: #218838;
}
    .long {
        display:flex;
        justify-content: center;
    }
.itemPlaceholder{
    width:100px
}
.ko {
    width:200px;
}
/* Footer Styles */
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
.choi{
   justify-content:center;
   margin-left:200px;
   column-count:2;
   column-span:all;
}
.loichoi{
    display:flex;
    width:200px
}
.add-button1{
        background-color: #0056b3;
}
    </style>
</head>
<body>        
   <form id="form1" runat="server">
       <!-- Header Section --><!-- Header Section --><div class="header">
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
    <div class="container">
     
        <!-- Thông tin khách hàng -->
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
    <a href="banthuoc.aspx" class="add-button1"><i class="fas fa-shopping-cart"></i> BÁN THUỐC</a>

    <!-- Nhà cung cấp -->
    <a href="NhaCungCap.aspx" class="add-button"><i class="fas fa-truck"></i> NHÀ CUNG CẤP</a>

    <!-- Quản lý nhân viên -->
    <a href="nhanvien.aspx" class="add-button"><i class="fas fa-user-tie"></i> QUẢN LÍ NHÂN VIÊN</a>

     <a href="KhachHang.aspx" class="add-button"><i class="fas fa-users"></i> KHÁCH HÀNG</a>
</div>



        <!-- Giỏ hàng -->
        <div class="ftr">
           
    

       

        
                 <div class="search-container">
            <asp:TextBox ID="txtTimKiem" runat="server" CssClass="search-box" Placeholder="Nhập tên thuốc..."></asp:TextBox>
            <asp:Button ID="Button1" runat="server" CssClass="search-button" Text="Tìm" OnClick="btnTimKiem_Click" />
        </div>
            </div>
            <div class="long">
            <asp:Repeater ID="ProductRepeater" runat="server">
                    
                <ItemTemplate>
                    <div class="product">
                        <img src="https://via.placeholder.com/150" alt="Product">
                        <h3><%# Eval("TenThuoc") %></h3>
                        <p>Giá: <%# Eval("DonGia") %> VND</p>
                        <p>Còn lại: <%# Eval("SoLuong") %> </p>
                        <asp:Button ID="btnAddToCart" runat="server" Text="+" CommandArgument='<%# Eval("MaThuoc") %>' OnClick="btnAddToCart_Click" CssClass="btn-add-cart" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
              

            </div>
           <div class="choiloi">
                             <asp:Label ID="lblTongTien" runat="server" CssClass="total-label"></asp:Label>
                 <asp:ListView ID="CartListView" runat="server">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <th>Tên Thuốc</th>
                            <th>Số Lượng</th>
                            <th>Đơn Giá</th>
                            <th>Thành Tiền</th>
                            <th>Hành Động</th>
                        </tr>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("TenThuoc") %></td>
                        <td><%# Eval("SoLuong") %></td>
                        <td><%# Eval("DonGia") %> VND</td>
                        <td><%# Eval("ThanhTien") %> VND</td>
                        <td>
                            <asp:Button ID="btnRemove" runat="server" Text="Xóa" CommandArgument='<%# Eval("MaThuoc") %>' OnClick="btnRemove_Click" />
                        </td>                         
                    </tr>
                </ItemTemplate>

            </asp:ListView>
               </div>
        <div class="choi">
    <!-- Căn giữa tiêu đề -->
   <h2>Thông Tin Khách Hàng</h2>
    <!-- Cột 1: Tên khách hàng, Email, Địa chỉ -->
    <div class="form-group">
        <label for="TenKH">Tên Khách Hàng</label>
        <input type="text" id="TenKH" name="TenKH" runat="server" class="form-control" />
    </div>

    <div class="form-group">
        <label for="Email">Email</label>
        <input type="email" id="Email" name="Email" runat="server" class="form-control" />
    </div>

    <div class="form-group">
        <label for="DiaChi">Địa Chỉ</label>
        <textarea id="DiaChi" name="DiaChi" rows="4" runat="server" class="form-control"></textarea>
    </div>

    <!-- Cột 2: Nhân viên, giảm giá, Số điện thoại, Giới tính -->
    <div class="form-group">
        <label for="chonNhanVien">Nhân Viên</label>
        <asp:DropDownList ID="chonNhanVien" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    <div class="form-group">
        <label for="txtDiscount">Phần trăm giảm giá:</label>
        <input type="number" id="txtDiscount" runat="server" placeholder="Nhập % giảm giá" class="form-control" />
    </div>

    <div class="form-group">
        <label for="SDT">Số Điện Thoại</label>
        <input type="tel" id="SDT" name="SDT" runat="server" class="form-control" />
    </div>

    <div class="form-group">
        <label for="GioiTinh">Giới Tính</label>
        <asp:DropDownList ID="GioiTinh" runat="server" CssClass="form-control">
            <asp:ListItem Text="Nam" Value="Nam" />
            <asp:ListItem Text="Nữ" Value="Nữ" />
        </asp:DropDownList>
    </div>

    <!-- Nút Thanh toán (chạy rộng cả 2 cột) -->
    <div class="form-group">
        <asp:Button ID="UpdateButton" runat="server" Text="THANH TOÁN" OnClick="UpdateButton_Click" CssClass="btn-primary" />
    </div>
</div>
        </div>
         
           </div>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-content">
            <p>© 2024 Quản Lý Thuốc. Designed by YourName.</p>
            <p>Liên hệ: <a href="mailto:contact@example.com">contact@example.com</a> | Hotline: 123-456-789</p>
        </div>
    </footer>
</form>
    </body>
