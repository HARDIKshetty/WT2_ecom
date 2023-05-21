<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ecom.WebForm2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .product-item {
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

        .product-item:hover {
            transform: translateY(-2px);
        }

        .image-container {
            flex: 0 0 150px;
            margin-right: 20px;
        }

        .image-container img {
            width: 100%;
            height: auto;
        }

        .details-container {
            flex: 1;
        }

        .details-container h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333333;
        }

        .righter {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .price {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #16192c;
        }

        .btn-add-to-cart {
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

        .btn-add-to-cart:hover {
            background-color: #0c0f19;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="form1" runat="server">
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView2_SelectedIndexChanged">
                <ItemTemplate>
                    <div class="product-item">
                        <div class="image-container">
                            <img src='<%# Eval("img_loc") %>' width="150px" />
                        </div>
                        <div class="details-container">
                            <h3><%# Eval("Name") %></h3>
                        </div>
                        <div class="righter">
                            <p class="price">₹<%# Eval("Price") %></p>
                            <asp:Button ID="Button2" runat="server" Text="Add to Cart" OnClick="Button2_Click" CssClass="btn-add-to-cart" />
                        </div>
                    </div>
                    <hr />
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style=""></div>
                </LayoutTemplate>
            </asp:ListView>
        </form>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
    </div>
</asp:Content>
