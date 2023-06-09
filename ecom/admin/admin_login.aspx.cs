﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecom.admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] != null)
            {
                // Session has started, redirect to the home page or any other protected page
                Response.Redirect("add_product.aspx");
            }
        }

        SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\App_Data\\ecom.mdf;Integrated Security=True");

        protected void login_Click(object sender, EventArgs e)
        {
            string email = login_email.Text;
            string password = login_password.Text;
            connection.Open();
            SqlCommand checkEmailCommand = new SqlCommand("SELECT COUNT(*) FROM [admin] WHERE Email = @Email AND Password = @Password", connection);
            checkEmailCommand.Parameters.AddWithValue("@Email", email);
            checkEmailCommand.Parameters.AddWithValue("@Password", password);
            int count = (int)checkEmailCommand.ExecuteScalar();
            connection.Close();

            if (count > 0)
            {
                // Set the user as logged in using session
                Session["adminlogin"] = email;

                // Redirect to the home page or any other protected page
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Logged in.');", true);

                Response.Redirect("add_product.aspx");
            }
            else
            {
                // Invalid login, show error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid email or password.');", true);
            }
        }
    }
}