<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="billing.aspx.cs" Inherits="ecom.billing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .user-details {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .bill-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .product-image {
            width: 60px;
            height: 60px;
            margin-right: 15px;
            object-fit: cover;
            border-radius: 5px;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #16192c;
        }

        .total-amount {
            font-weight: bold;
            margin-top: 30px;
            text-align: right;
            font-size: 20px;
        }

        .home-button {
            background-color: #16192c;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
            margin-top: 30px;
            font-size: 16px;
        }

        .home-button:hover {
            background-color: #0c0f19;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Bill Details</h2>
            <div>
                <strong>Name:</strong>
                <asp:Label ID="UserNameLabel" runat="server" CssClass="user-details"></asp:Label>
            </div>
            <div>
                <strong>Email:</strong>
                <asp:Label ID="UserEmailLabel" runat="server" CssClass="user-details"></asp:Label>
            </div>
            <h2>Product Details</h2>
            <asp:Repeater ID="BillRepeater" runat="server">
                <ItemTemplate>
                    <div class="bill-item">
                        <img src="<%# Eval("img_loc") %>" alt="Product Image" class="product-image" />
                        <div>
                            <span class="product-name"><%# Eval("ProductName") %></span>
                            <span class="product-price">Price: ₹<%# Eval("Price") %></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="total-amount">
                Total Amount: ₹<asp:Label ID="TotalAmountLabel" runat="server"></asp:Label>
            </div>
            
            <asp:Button ID="HomeButton" runat="server" Text="Go Back to Home" CssClass="home-button" OnClick="HomeButton_Click" />
        </div>
    </form>
</body>
</html>
