using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ecom
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductData(); // Bind the product data to the GridView
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            AddToCart(productId);
        }
    }

    private void BindProductData()
    {
        // Retrieve product data from the database and set it as the GridView's DataSource
        // Replace the following code with your own data retrieval logic
        DataTable productsTable = GetProductsFromDatabase();
        GridView1.DataSource = productsTable;
        GridView1.DataBind();
    }

    private void AddToCart(int productId)
    {
        // Retrieve the product details based on the productId
        // Replace the following code with your own logic to retrieve the product details
        DataTable productDetails = GetProductDetails(productId);

        // Add the product to the cart session
        DataTable cartItems = Session["CartItems"] as DataTable;
        if (cartItems == null)
        {
            // If the cart session doesn't exist, create a new DataTable and store it in the session
            cartItems = new DataTable();
            cartItems.Columns.Add("id", typeof(int));
            cartItems.Columns.Add("Name", typeof(string));
            cartItems.Columns.Add("Price", typeof(decimal));
            cartItems.Columns.Add("img_loc", typeof(string));
            Session["CartItems"] = cartItems;
        }

        // Add the product details to the cart DataTable
        DataRow cartItem = cartItems.NewRow();
        cartItem["id"] = productDetails.Rows[0]["id"];
        cartItem["Name"] = productDetails.Rows[0]["Name"];
        cartItem["Price"] = productDetails.Rows[0]["Price"];
        cartItem["img_loc"] = productDetails.Rows[0]["img_loc"];
        cartItems.Rows.Add(cartItem);

        // Rebind the GridView to display the updated cart items
        GridView1.DataSource = cartItems;
        GridView1.DataBind();
    }

}