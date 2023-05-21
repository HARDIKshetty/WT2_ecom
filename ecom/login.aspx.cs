using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ecom
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }
        SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\App_Data\\ecom.mdf;Integrated Security=True");

        protected void login_Click(object sender, EventArgs e)
        {
            string email = login_email.Text;
            string password = login_password.Text;
            connection.Open();
            SqlCommand checkEmailCommand = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE Email = @Email AND Password = @Password", connection);
            checkEmailCommand.Parameters.AddWithValue("@Email", email);
            checkEmailCommand.Parameters.AddWithValue("@Password", password);
            int count = (int)checkEmailCommand.ExecuteScalar();
            connection.Close();

            if (count > 0)
            {
                Session["LoggedInUser"] = email;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Logged in.');", true);

                Response.Redirect("index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid email or password.');", true);
            }

        }
        
    }
}