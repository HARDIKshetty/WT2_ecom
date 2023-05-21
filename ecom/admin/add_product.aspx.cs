using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Security.Policy;
using System.Xml.Linq;

namespace ecom.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminlogin"] != null)
            {
                // Session has started, redirect to the home page or any other protected page
                Response.Redirect("admin_login.aspx");
            }
        }

       // String conn = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\App_Data\\ecom.mdf;Integrated Security=True";
       SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\App_Data\\ecom.mdf;Integrated Security=True");

        protected void insert_Click(object sender, EventArgs e)
        {
            string fname = file_upload1.FileName;
            string flocation = "C:\\Users\\Asus\\source\\repos\\ecom\\ecom\\images\\";
            string pathstring = System.IO.Path.Combine(flocation,fname);
            file_upload1.SaveAs(pathstring);
            string Name = p_name.Text;
            string Price = price.Text;
           // string img_loc = image_loc.Text;
            string sku = skuu.Text;
            connection.Open();

            SqlCommand command = new SqlCommand("insert into product values ('"+ Name + "', '"+ Price + "', '"+ pathstring + "', '"+ sku + "') ", connection);
            command.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this,this.GetType(), "script", "alert('Successfully saved');", true);


            


        }
    }
}