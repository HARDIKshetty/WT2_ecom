using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecom
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string productId = e.CommandArgument.ToString();
                AddToCart(productId);
            }
        }

        private void AddToCart(string productId)
        {
            if (Session["User"] != null)
            {
                if (Session["Cart"] != null && Session["Cart"].ToString().Contains(productId))
                {
                    // Product already in cart
                    // Update UI or display a message
                }
                else
                {
                    Session["Cart"] = (Session["Cart"] == null) ? productId : Session["Cart"] + "," + productId;
                    // Product added to cart
                    // Update UI or display a message
                }
            }
            else
            {
                Response.Redirect("WebForm4.aspx");
            }
        }
    }
}