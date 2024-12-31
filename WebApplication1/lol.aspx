<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lol.aspx.cs" Inherits="WebApplication1.lol" %>

<<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thêm Nhân Viên</title>
    <link rel="stylesheet" href="test.css">
</head>
    <style>
        .chart-container {
    width: 90%;
    margin: 0 auto;
}

.chart {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    height: 235px;
    border-left: 2px solid #333;
    border-bottom: 2px solid #333;
    padding: 0;
    position: relative;
}

.bar {
    width: 30px;
    background-color: #17a2b8;
    text-align: center;
    position: relative;
    height: 0;
    /* Bắt đầu từ 0 */
    animation: grow 1.5s ease forwards;
    /* Hiệu ứng grow */
    cursor: pointer;
}

.bar:hover {
    background-color: #138496;
    opacity: 0.9;
}

.bar span {
    position: absolute;
    bottom: 100%;
    transform: translateY(-10px);
    font-size: 14px;
    color: #333;
    white-space: nowrap;
}

.month {
    text-align: center;
    margin-top: 10px;
    font-size: 14px;
}

.y-axis-label {
    position: absolute;
    left: -40px;
    font-size: 12px;
    text-align: right;
}

.y-axis {
    position: absolute;
    left: -50px;
    top: 0;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.months {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
}

/* Hiệu ứng grow height */
@keyframes grow {
    from {
        height: 0;
        /* Bắt đầu từ 0 */
    }

    to {
        height: var(--final-height);
        /* Chiều cao thực tế */
    }
}
    </style>
<body>

    <div class="chart-container">
        <asp:Repeater ID="rptDoanhThu" runat="server">
    <ItemTemplate>
        <div class="chart-container">
            <h4>Khách thuê phòng</h4>
            <div class="chart">
                <div class="y-axis">
                    <div>100M</div>
                    <div>75M</div>
                    <div>50M</div>
                    <div>25M</div>
                    <div>0</div>
                </div>
                
                <div class="bar" style="--final-height: <%# Eval("DoanhThu") %>%;" title="Doanh thu: <%# Eval("DoanhThu") %>M"></div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

    </div>
    
</body>
</html>
