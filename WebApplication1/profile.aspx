<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication1.profile" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
    <style>
 /* Reset margin và padding cho tất cả các phần tử */
/* Reset margin và padding cho tất cả các phần tử */
/* Reset margin and padding for all elements */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Set font for the entire page */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f7fc;
    padding: 20px;
}

/* Main layout of the profile */
.profile-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Profile title */
.profile-container h1 {
    font-size: 28px;
    margin-bottom: 20px;
    color: #333;
    font-weight: 600;
}

/* Layout for left and right sections */
.profile-form {
    display: flex;
    justify-content: space-between;
    gap: 30px;
}

/* Left section (user information) */
.profile-left {
    flex: 1;
}

/* Right section (profile picture) */
.profile-right {
    width: 200px;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.profile-picture img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
}

/* Input group styling */
.input-group {
    margin-bottom: 20px;
}

.input-group label {
    font-weight: 600;
    color: #555;
    margin-bottom: 5px;
    display: block;
}

/* Improved label styling */
label {
    font-size: 16px;
    color: #555;
}

/* Input field styling */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="date"],
input[type="tel"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    background-color: #f7f7f7;
}

/* Focus state for input fields */
input:focus {
    border-color: #6c8efc;
    outline: none;
}

/* Button styling */
button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #45a049;
}

/* Footer styling */
.footer {
    background-color: #343a40;
    color: white;
    text-align: center;
    padding: 20px;
    position: relative;
    bottom: 0;
    left: 0;
    width: 100%;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
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

/* Responsive design */
@media (max-width: 768px) {
    .profile-form {
        flex-direction: column;
    }

    .profile-right {
        width: 100%;
        height: 180px;
    }

    .profile-container {
        padding: 15px;
    }
}   


    </style>
<body>
    <div class="profile-container">
        <h1>Profile:<asp:Label ID="profilename" runat="server" Text="John"></asp:Label></h1>
        <form runat="server">
            <div class="profile-form">
                <div class="profile-left">
                    <div class="input-group">
                        <label for="name">Name:</label>
                        <asp:Label ID="lblName" runat="server" Text="John"></asp:Label>
                    </div>
                       <div class="input-group">
                        <label for="userrole">Chức Vụ:</label>
                        <asp:Label ID="userrole" runat="server" Text="John"></asp:Label>
                    </div>
  
                    <div class="input-group">
                        <label for="dob">Birthday:</label>
                        <asp:Label ID="lblDob" runat="server" Text="1978.05.14"></asp:Label>
                    </div>
                    <div class="input-group">
                        <label for="phone">Phone:</label>
                        <asp:Label ID="lblPhone" runat="server" Text="123-456-7890"></asp:Label>
                    </div>
                    <div class="input-group">
                        <label for="email">Email:</label>
                        <asp:Label ID="lblEmail" runat="server" Text="john.smith@example.com"></asp:Label>
                    </div>
                    <div class="input-group">
                        <label for="username">Username:</label>
                        <asp:Label ID="lblUsername" runat="server" Text="johnsmith"></asp:Label>
                    </div>
                    <div class="input-group">
                        <label for="password">Password:</label>
                        <asp:Label ID="lblPassword" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="input-group">
                        <label for="id">ID:</label>
                        <asp:Label ID="lblId" runat="server" Text="12345"></asp:Label>
                    </div>
                </div>
                <div class="profile-right">
                    <div class="profile-picture">
                        <asp:Image ID="profileImage" runat="server" ImageUrl="https://cdn.myanimelist.net/images/characters/5/531081.jpg" Width="150" Height="150" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>