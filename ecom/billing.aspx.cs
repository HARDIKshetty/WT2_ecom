using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ecom.AddtoCart;

namespace ecom
{
    public partial class billing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                GenerateBill();
                LoadUserDetails();
            }
        }

        protected void GenerateBill()
        {
            if (Session["Cart"] != null)
            {
                string cartItems = Session["Cart"].ToString();
                string[] productIds = cartItems.Split(',');

                if (productIds.Length > 0)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    double totalAmount = 0;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        Product[] products = GetProducts(connection, productIds);

                        BillRepeater.DataSource = products;
                        BillRepeater.DataBind();

                        // Calculate the total amount
                        foreach (Product product in products)
                        {
                            totalAmount += product.Price;
                        }
                    }

                    TotalAmountLabel.Text = totalAmount.ToString();
                }
            }
        }
        protected void LoadUserDetails()
        {
            if (Session["LoggedInUser"] != null)
            {
                string userEmail = Session["LoggedInUser"].ToString();

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT [name], email FROM [User] WHERE email = @UserEmail";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@UserEmail", userEmail);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string userName = reader["name"].ToString();
                                string userEmailValue = reader["email"].ToString();

                                // Set the user details in the labels
                                UserNameLabel.Text = userName;
                                UserEmailLabel.Text = userEmailValue;
                            }
                        }
                    }
                }
            }
        }
        protected Product[] GetProducts(SqlConnection connection, string[] productIds)
        {
            Product[] products = new Product[productIds.Length];

            for (int i = 0; i < productIds.Length; i++)
            {
                string productId = productIds[i];

                // Retrieve product details from the database
                string query = "SELECT * FROM Product WHERE Id = @ProductId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", productId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string productName = reader["Name"].ToString();
                            double price = Convert.ToDouble(reader["Price"]);
                            int quantity = 1; // Assuming the quantity is always 1 for each ordered item
                            string img_loc = reader["img_loc"].ToString(); // Assuming the column name for the image URL is "img_loc"

                            products[i] = new Product(productName, price, quantity, img_loc);
                        }
                    }
                }
            }

            return products;
        }


        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Response.Redirect("index.aspx");
        }
    }

    public class Product
    {
        public string ProductName { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string img_loc { get; set; }

        public Product(string productName, double price, int quantity, string img_loc)
        {
            ProductName = productName;
            Price = price;
            Quantity = quantity;
            this.img_loc = img_loc;
        }
    }

}