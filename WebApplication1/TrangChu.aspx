<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giới thiệu Nhà Thuốc - HealthCare</title>

    <!-- Liên kết Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Liên kết FontAwesome cho các icon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <!-- CSS tùy chỉnh -->
    <style>
        .hero-section {
            background: url('https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center/cover;
            color: white;
            padding: 100px 0;
            text-align: center;
        }

        .cta-button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            padding: 15px 30px;
            border-radius: 50px;
            transition: background-color 0.3s ease;
        }

        .cta-button:hover {
            background-color: #0056b3;
        }

        .feature-item {
            padding: 20px;
            border: 1px solid #e7e7e7;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .testimonial-item {
            border-left: 4px solid #007bff;
            padding-left: 20px;
            font-style: italic;
            margin-bottom: 30px;
        }

        .contact-info {
            font-size: 1.2rem;
        }
    </style>
</head>

<body>

    <!-- Thanh điều hướng (Navbar) -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Pharmacy</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="banthuoc.aspx">Chuyển đến Trang Quản lí</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Phần Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1 class="display-4">Chào mừng đến với Nhà Thuốc HealthCare</h1>
            <p class="lead">Chúng tôi cung cấp các sản phẩm dược phẩm chất lượng, an toàn và hiệu quả cho sức khỏe của bạn.</p>
            <a href="#services" class="cta-button">Khám Phá Dịch Vụ</a>
        </div>
    </section>

    <!-- Phần Giới thiệu Nhà Thuốc -->
    <section class="container my-5">
        <div class="row">
            <div class="col-lg-6">
                <h2 class="text-primary">Về Nhà Thuốc Pharmacy</h2>
                <p>Chúng tôi là nhà thuốc chuyên cung cấp các loại thuốc điều trị và chăm sóc sức khỏe cho mọi lứa tuổi. Với cam kết mang lại chất lượng và sự an tâm cho khách hàng, chúng tôi luôn lựa chọn các sản phẩm dược phẩm từ những thương hiệu uy tín và đảm bảo tiêu chuẩn chất lượng cao nhất.</p>
                <ul>
                    <li>Thuốc điều trị các bệnh lý thông thường và mãn tính.</li>
                    <li>Chăm sóc sức khỏe và dinh dưỡng cho trẻ em, người lớn và người cao tuổi.</li>
                    <li>Đội ngũ nhân viên dày dặn kinh nghiệm, nhiệt tình tư vấn.</li>
                </ul>
            </div>
            <div class="col-lg-6">
                <img src="https://i.pinimg.com/736x/31/12/a3/3112a3acbd2dbd3d5d614b358635d09d.jpg" alt="Nhà thuốc" class="img-fluid rounded shadow-lg">
            </div>
        </div>
    </section>

    <!-- Phần Dịch Vụ và Sản Phẩm -->
    <section id="services" class="bg-light py-5">
        <div class="container">
            <h2 class="text-center text-primary mb-4">Dịch Vụ và Sản Phẩm</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-item text-center">
                        <i class="fas fa-pills fa-3x text-primary mb-3"></i>
                        <h4>Thuốc Chữa Bệnh</h4>
                        <p>Cung cấp thuốc điều trị các bệnh lý thông thường và chuyên biệt.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-item text-center">
                        <i class="fas fa-heartbeat fa-3x text-primary mb-3"></i>
                        <h4>Chăm Sóc Sức Khỏe</h4>
                        <p>Cung cấp các sản phẩm chăm sóc sức khỏe, tăng cường miễn dịch.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-item text-center">
                        <i class="fas fa-baby fa-3x text-primary mb-3"></i>
                        <h4>Sản Phẩm Cho Trẻ Em</h4>
                        <p>Thuốc và sản phẩm hỗ trợ sự phát triển của trẻ em.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Phần Đánh Giá Khách Hàng -->
    <section class="container my-5">
        <h2 class="text-center text-primary mb-4">Đánh Giá Khách Hàng</h2>
        <div class="row">
            <div class="col-md-6 testimonial-item">
                <p>"Nhà thuốc này có đội ngũ nhân viên rất chuyên nghiệp và thân thiện. Tôi luôn nhận được sự tư vấn tận tình và sản phẩm chất lượng." - Nguyễn Thị Lan</p>
            </div>
            <div class="col-md-6 testimonial-item">
                <p>"Tôi đã mua thuốc ở đây nhiều lần và đều rất hài lòng với chất lượng dịch vụ cũng như hiệu quả sản phẩm." - Trần Minh Hoàng</p>
            </div>
        </div>
    </section>

    <!-- Phần Liên Hệ -->
    <section id="contact" class="bg-primary text-white py-5">
        <div class="container">
            <h2 class="text-center mb-4">Liên Hệ Với Chúng Tôi</h2>
            <p class="text-center">Bạn có bất kỳ câu hỏi nào? Hãy liên hệ với chúng tôi để được tư vấn thêm!</p>
            <div class="row text-center">
                <div class="col-md-4">
                    <p class="contact-info"><i class="fas fa-phone-alt"></i>0987240571</p>
                </div>
                <div class="col-md-4">
                    <p class="contact-info"><i class="fas fa-envelope"></i>sieunhangaoden333@gmail.com</p>
                </div>
                <div class="col-md-4">
                    <p class="contact-info"><i class="fas fa-map-marker-alt"></i>160B, Đường 3/2, Phường Xuân Khánh, Quận Ninh Kiều, Tp. Cần Thơ.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Liên kết Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
