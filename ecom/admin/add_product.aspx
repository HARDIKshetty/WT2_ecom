<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="ecom.admin.WebForm1" %>

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
                    <td>Image Location:
                    </td>
                    <td>
                    <asp:FileUpload ID="file_upload1" runat="server" />
                    
                    </td>
                </tr>

                <tr>
                    <td>SKU:</td>
                    <td>
                    <asp:TextBox ID="skuu" runat="server"></asp:TextBox></td>
                </tr>
             
                
            </table>
            <asp:Button ID="insert" runat="server" OnClick="insert_Click" Text="Insert" />
            <br />
        </div>
    </form>
</body>
</html>
