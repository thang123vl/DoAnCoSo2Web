<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chitietnhap.aspx.cs" Inherits="WebApplication1.chitietnhap" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phiếu Hóa Đơn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .invoice-container {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px;
            background-color: #f9f9f9;
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
        .invoice-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .invoice-header h2 {
            margin: 0;
            font-size: 24px;
        }

        .invoice-header p {
            margin: 5px 0;
        }

        .invoice-details {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .invoice-details th, .invoice-details td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }

        .invoice-details th {
            background-color: #f2f2f2;
        }

        .invoice-footer {
            text-align: right;
            margin-top: 20px;
        }

        .invoice-footer p {
            margin: 5px 0;
            font-weight: bold;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        @media print {
            .button-container {
                display: none;
            }
            body {
                width: 100%;
                margin: 0;
                padding: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="invoice-container">
            <div class="invoice-header">
                <h2>Phiếu Nhập</h2>
                <p>Mã hóa đơn: <span id="invoiceCode"><%= Request.QueryString["mahoadon"] %></span></p>
                <p>Ngày: <span id="invoiceDate"><%= DateTime.Now.ToString("dd/MM/yyyy") %></span></p>
            </div>

            <table class="invoice-details">
                <thead>
                    <tr>
                        <th>Tên thuốc</th>
                        <th>Số lượng</th>
                        <th>Chiết khấu (%)</th>
                        <th>VAT (%)</th>
                        <th>Thành tiền</th>
                        <th>Đơn vị tính</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < chitiethoadonList.Count; i++) { %>
                        <tr>
                            <td><%= chitiethoadonList[i].TenThuoc %></td>
                            <td><%= chitiethoadonList[i].SoLuong %></td>
                            <td><%= chitiethoadonList[i].ChietKhau %></td>
                            <td><%= chitiethoadonList[i].VAT %></td>
                            <td><%= chitiethoadonList[i].ThanhTien %></td>
                            <td><%= chitiethoadonList[i].DonViTinh %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="invoice-footer">
                <p>Tổng thành tiền: <span id="totalAmountDisplay">
                    <%= chitiethoadonList.Sum(item => item.ThanhTien) %> VND
                </span></p>
                <p>Cảm ơn quý khách đã mua hàng!</p>
            </div>
        </div>

        <div class="button-container">
            <button onclick="window.print()">In Phiếu Hóa Đơn</button>
            <asp:Button ID="Button1" runat="server" Text="Quay Về" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
