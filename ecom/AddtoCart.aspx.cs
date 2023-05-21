using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecom
{
    public partial class AddtoCart : System.Web.UI.Page
    {
        protected double GetTotalAmount()
        {
            double totalAmount = 0;

            if (Session["Cart"] != null)
            {
                string[] productIds = Session["Cart"].ToString().Split(',');

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    foreach (string productId in productIds)
                    {
                        Product product = GetProductById(connection, productId);
                        if (product != null)
                        {
                            totalAmount += product.Price;
                        }
                    }

                    connection.Close();
                }
            }

            return totalAmount;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
                UpdateTotalAmount();
            }
        }

        private void UpdateTotalAmount()
        {
            double totalAmount = GetTotalAmount();
            totalAmountLabel.Text = "Total Amount: ₹" + totalAmount.ToString("0.00");
        }

        protected void ProceedButton_Click(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                string userId = Session["LoggedInUser"].ToString();

                if (Session["Cart"] != null)
                {
                    string[] productIds = Session["Cart"].ToString().Split(',');

                    string productIdsString = string.Join(",", productIds);

                    double totalAmount = GetTotalAmount();

                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string insertOrderQuery = "INSERT INTO [order] ([UserId], [ProductIds], [Amount]) VALUES (@UserId, @ProductIds, @Amount)";
                        using (SqlCommand insertOrderCommand = new SqlCommand(insertOrderQuery, connection))
                        {
                            insertOrderCommand.Parameters.AddWithValue("@UserId", userId);
                            insertOrderCommand.Parameters.AddWithValue("@ProductIds", productIdsString);
                            insertOrderCommand.Parameters.AddWithValue("@Amount", totalAmount);

                            insertOrderCommand.ExecuteNonQuery();
                        }

                        connection.Close();
                    }


                    Response.Redirect("billing.aspx");
                }
                else
                {
                    totalAmountLabel.Text = "No Items error";
                }
            }
            else
            {
                totalAmountLabel.Text = "No User error";
            }
        }

        public class Product
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public double Price { get; set; }

            public string img_loc { get; set; }
            // Add any other properties relevant to your product
        }

        private void LoadCartItems()
        {
            if (Session["Cart"] != null)
            {
                Label1.Visible = false;
                string[] productIds = Session["Cart"].ToString().Split(',');
                List<Product> cartProducts = new List<Product>();

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    foreach (string productId in productIds)
                    {
                        Product product = GetProductById(connection, productId);
                        if (product != null)
                        {
                            cartProducts.Add(product);
                        }
                    }

                    connection.Close();
                }

                Repeater1.DataSource = cartProducts;
                Repeater1.DataBind();
            }
            else
            {
                Label1.Visible = true;
            }
        }

        private Product GetProductById(SqlConnection connection, string productId)
        {
            Product product = null;

            string query = "SELECT * FROM product WHERE Id = @ProductId";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductId", productId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        product = new Product()
                        {
                            Id = reader["Id"].ToString(),
                            Name = reader["Name"].ToString(),
                            Price = Convert.ToDouble(reader["Price"]),
                            img_loc = reader["img_loc"].ToString()
                        };
                    }
                }
            }

            return product;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Clear the session cart
            Session["Cart"] = null;

            // Reload the page to reflect the cleared cart
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}