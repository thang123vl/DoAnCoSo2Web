<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inhoadonban.aspx.cs" Inherits="WebApplication1.inhoadonban" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa Đơn</title>
    <style>
        /* Reset cơ bản */
        body, h1, h2, p, table {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #fff;
            padding: 20px;
            color: #000;
        }

        /* Container hóa đơn */
        .invoice {
             width: 104mm;
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .invoice-header {
            text-align: center;
            margin-bottom: 10px;
        }

        .invoice-header h1 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .invoice-header p {
            font-size: 12px;
        }

        .customer-info {
            margin-bottom: 10px;
            font-size: 12px;
        }

        .customer-info p {
            line-height: 1.4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            margin-bottom: 10px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 4px;
            text-align: center;
        }

        table th {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .total {
            text-align: right;
            font-size: 14px;
            font-weight: bold;
            margin-top: 5px;
        }

        .footer {
            text-align: center;
            font-size: 12px;
            margin-top: 10px;
            border-top: 1px dashed #000;
            padding-top: 5px;
        }

        /* Ẩn nút in khi in */
        @media print {
            .btn-print {
                display: none;
            }

            body {
                background-color: #fff;
            }
        }

        .btn-print {
            display: block;
            width: 100px;
            margin: 10px auto;
            padding: 10px;
            text-align: center;
            background-color: #000;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn-print:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
    <div class="invoice">
        <!-- Header -->
        <div class="invoice-header">
            <h1>Pharmacy</h1>
            <p>Địa chỉ: 123 Đường XYZ, TP. HCM</p>
            <p>Hotline: 0987240571</p>
        </div>

        <!-- Customer Info -->
        <!-- Product Table -->
        <table>
            <thead>
                <tr>
                    <th>Tên Thuốc</th>
                    <th>Mã Nhân Viên Phụ Trách</th>
                       <th>SL</th>
                    <th>Ngày</th>
                 
                    <th>Đơn giá</th>
                    <th>Giảm Giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <%decimal tongCong = 0;
                    for (int i=0;i<chitiethoadonList.Count;i++){
                        tongCong += chitiethoadonList[i].ThanhTien;
                        
                        %>
                <tr>
               <td><%= chitiethoadonList[i].TenThuoc %></td>
                    <td><%= chitiethoadonList[i].MaNV %></td>
                <td><%= chitiethoadonList[i].SoLuong %></td>
                    <td><%= chitiethoadonList[i].NgayBan %></td>
                <td><%= chitiethoadonList[i].DonGia.ToString("N0") %></td>
                <td><%= chitiethoadonList[i].GiamGia.ToString("N0") %></td>
                <td><%= chitiethoadonList[i].ThanhTien.ToString("N0") %></td>
                        </tr>
                <%} %>
     
            </tbody>
        </table>

       
<p class="total">Tổng cộng: <%= tongCong.ToString("N0") %>đ</p>

        <div class="footer">
            <p>Cảm ơn quý khách đã mua hàng!</p>
            <p>Hẹn gặp lại!</p>
        </div>
    </div>

    <a href="thuoc.aspx" class="btn-print" onclick="window.print()">In Hóa Đơn</a>
    
    </form>

</body>
</html>

