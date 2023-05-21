<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_order.aspx.cs" Inherits="ecom.admin.view_product" %>

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
            background-color: #000084;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            color: #ffffff;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }

        .navbar-links {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar-links li {
            margin-left: 10px;
        }

        .navbar-links li a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
        }

        form {
            max-width: 800px;
            margin: 0 auto;
            margin-top: 50px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        h1 {
            text-align: center;
            color: #000084;
        }

        .grid-container {
            margin-top: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .gridview th,
        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #dee2e6;
        }

        .gridview th {
            background-color: #000084;
            color: #ffffff;
        }

        .gridview tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .gridview tbody tr:hover {
            background-color: #e9ecef;
        }

        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-primary {
            color: #ffffff;
            background-color: #000084;
            border-color: #000084;
        }

        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active,
        .open .dropdown-toggle.btn-primary {
            color: #ffffff;
            background-color: #000065;
            border-color: #000065;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#" class="navbar-brand">Admin Panel</a>
        <ul class="navbar-links">
            <li><a href="#">Logout</a></li>
            <li><a href="#">View Products</a></li>
            <li><a href="#">Add Admin</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <form id="form1" runat="server">
        <div>
            <h1>View Order</h1>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [order]">
            </asp:SqlDataSource>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="gridview">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                        <asp:BoundField DataField="ProductIds" HeaderText="ProductIds" SortExpression="ProductIds" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
