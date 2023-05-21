<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="ecom.admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #007bff;
            padding: 8px;
            margin-bottom: 20px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .navbar li {
            display: inline-block;
            margin-right: 10px;
        }

        .navbar li:last-child {
            margin-right: 0;
        }

        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 8px;
            border-radius: 4px;
        }

        .navbar a:hover,
        .navbar a:focus {
            background-color: #0069d9;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        table td {
            padding: 8px;
            vertical-align: middle;
            border-bottom: 1px solid #e9ecef;
        }

        table td:first-child {
            width: 120px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input[type="text"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 4px;
            padding: 8px 16px;
            color: #ffffff;
            font-weight: bold;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background-color: #0069d9;
            border-color: #0062cc;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="#">View Product</a></li>
            <li><a href="#">Add Admin</a></li>
            <li style="float: right;"><a href="#">Logout</a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Product Name:</td>
                    <td>
                        <asp:TextBox ID="p_name" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Price:</td>
                    <td>
                        <asp:TextBox ID="price" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Image Location:</td>
                    <td>
                        <asp:FileUpload ID="file_upload1" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>SKU:</td>
                    <td>
                        <asp:TextBox ID="skuu" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="insert" runat="server" OnClick="insert_Click" Text="Insert" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>
