<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ecom.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Product Name:</td>
                    <td>
                    <asp:TextBox ID="p_name" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Price:</td>
                    <td>
                    <asp:TextBox ID="price" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Image Location:</td>
                    <td>
                    <asp:TextBox ID="image_loc" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>SKU:</td>
                    <td>
                    <asp:TextBox ID="sku" runat="server"></asp:TextBox></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
