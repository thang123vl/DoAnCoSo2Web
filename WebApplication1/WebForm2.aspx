<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biểu đồ thống kê doanh thu</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        #myChart {
            max-width: 600px; /* Thu nhỏ biểu đồ (chiều rộng tối đa) */
            max-height: 600px; /* Thu nhỏ biểu đồ (chiều cao tối đa) */
            margin: 0 auto; /* Canh giữa biểu đồ */
            display: block;
        }

        /* CSS cho vùng chứa */
        div {
            text-align: center; /* Canh giữa toàn bộ nội dung */
            padding: 20px; /* Thêm khoảng cách giữa nội dung */
        }

        h2 {
            font-family: Arial, sans-serif;
            font-size: 18px; /* Thu nhỏ tiêu đề */
            color: #333; /* Màu sắc của tiêu đề */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Biểu đồ thống kê doanh thu hàng tháng</h2>
            <canvas id="myChart" width="400" height="200"></canvas>
        </div>

        <script>
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
    </form>
</body>
</html>

