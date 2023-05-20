using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecom.admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] != null)
            {
                // Session has started, redirect to the home page or any other protected page
                Response.Redirect("admin_login.aspx");
            }
        }
        SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\App_Data\\ecom.mdf;Integrated Security=True");

        protected void reg_Click(object sender, EventArgs e)
        {
            string name = a_name.Text;
            string email = a_email.Text;
            string password = a_password.Text;
            connection.Open();
            SqlCommand checkEmailCommand = new SqlCommand("SELECT COUNT(*) FROM [admin] WHERE Email = @Email", connection);
            checkEmailCommand.Parameters.AddWithValue("@Email", email);
            int count = (int)checkEmailCommand.ExecuteScalar();
            connection.Close();

            if (count > 0)
            {
                // Email already exists, show error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Email already exists.');", true);
            }
            else
            {



                connection.Open();

                SqlCommand command = new SqlCommand("insert into [admin] values ('" + name + "', '" + email + "', '" + password + "') ", connection);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);
                Response.Redirect("login.aspx");
            }
        }
    }
}