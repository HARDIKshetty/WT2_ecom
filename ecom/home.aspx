<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ecom.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="10" DataSourceID="SqlDataSource1" GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: center; margin-bottom: 0px" Width="395px" OnItemCommand="DataList1_ItemCommand">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2" style="text-align: center">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("img_loc") %>' Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="text-align: center">RS
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="text-align: center">
                                <asp:Button ID="Button1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="5px" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("prodid") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [prodid], [Name], [Price], [img_loc] FROM [product]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</asp:Content>
