<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="ecom.AddtoCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .cart-item:hover {
            transform: translateY(-2px);
        }

        .product-details {
            flex: 1;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            color: #333333;
        }

        .product-price {
            font-size: 16px;
            font-weight: bold;
            color: #16192c;
        }

        .total-amount {
            margin-top: 20px;
            text-align: right;
        }

        .proceed-button {
            background-color: #16192c;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }

        .reset-button {
            background-color: #f8f9fa;
            color: #16192c;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
            margin-left: 10px;
        }

        .proceed-button:hover,
        .reset-button:hover {
            background-color: #0c0f19;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 style="text-decoration: underline;">Details Items</h2>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                            <img src='<%# Eval("img_loc") %>' width="150px" />
                      
                        <div class="product-details">
                            <span class="product-name"><%# Eval("Name") %></span>
                        </div>
                        <span class="product-price">Price: ₹<%# Eval("Price") %></span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="Label1" runat="server" Text="No Item Selected!" Font-Bold="True" Font-Size="Large" ForeColor="#999999"></asp:Label>
            <div class="total-amount">
                <asp:Label ID="totalAmountLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div>
                <asp:Button ID="ProceedButton" runat="server" Text="Proceed" CssClass="proceed-button" OnClick="ProceedButton_Click" />
                <asp:Button ID="Button1" runat="server" Text="Clear Cart" OnClick="Button1_Click1" CssClass="reset-button" />
            </div>
        </div>
    </form>
</body>
</html>
