<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ecom.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .register-card {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .register-card-title {
            font-weight: bold;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
                align-items: center;
    display: flex;
    justify-content: center;
        }

        .form-control {
            border-radius: 25px;
            padding: 12px 20px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #80bdff;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 25px;
            padding: 12px 30px;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .custom-label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-card">
            <h3 class="register-card-title">Register</h3>
            <div class="form-group">
                <label for="u_name" class="custom-label">Name:</label>
                <asp:TextBox ID="u_name" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="u_email" class="custom-label">Email:</label>
                <asp:TextBox ID="u_email" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="u_password" class="custom-label">Password:</label>
                <asp:TextBox ID="u_password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
            </div>
            <div class="d-grid" style="
    justify-content: center;
    display: flex;
">
                <asp:Button ID="reg" runat="server" Text="Register" OnClick="reg_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
