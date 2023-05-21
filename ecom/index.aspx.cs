using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecom
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                Button btnAddToCart = (Button)sender;
                ListViewItem item = (ListViewItem)btnAddToCart.NamingContainer;
                string id = ListView2.DataKeys[item.DataItemIndex].Value.ToString();

                if (Session["Cart"] != null && Session["Cart"].ToString().Contains(id))
                {
                    btnAddToCart.Text = "Added to Cart";
                    btnAddToCart.Enabled = false;

                }
                else
                {
                    Session["Cart"] = (Session["Cart"] == null) ? id : Session["Cart"] + "," + id;

                    btnAddToCart.Text = "Added to Cart";
                    btnAddToCart.Enabled = false;
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}