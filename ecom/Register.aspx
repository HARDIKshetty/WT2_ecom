<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ecom.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

        :root {
            --main-bg: #16192c;
            --button-text-color: #ffffff;
            --font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--main-bg);
        }

        .register-card {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 30px;
            border-radius: 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .register-card-title {
            font-weight: bold;
            text-align: center;
            font-family: var(--font-family);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 0;
            padding: 12px 20px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            font-family: var(--font-family);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #80bdff;
        }

        .btn-primary {
            background-color: var(--main-bg);
            border-color: var(--main-bg);
            border-radius: 0;
            padding: 12px 30px;
            width: 100%;
            color: var(--button-text-color);
            font-family: var(--font-family);
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background-color: #0c0f19;
            border-color: #0c0f19;
        }

        .custom-label {
            display: inline-block;
            width: 100px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="register-card">
                        <h2 class="register-card-title">Register</h2>
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
                        <div class="d-grid">
                            <asp:Button ID="reg" runat="server" Text="Register" OnClick="reg_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
