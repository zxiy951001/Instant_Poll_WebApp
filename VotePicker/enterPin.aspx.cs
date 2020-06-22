using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Diagnostics;

namespace votepicker_webproj
{
    public partial class enterPin : System.Web.UI.Page
    {
        string status, pintext, err1, aftcheckpintext;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
                if (string.IsNullOrWhiteSpace(TextBox1.Text))
                {
                    errtext.InnerHtml = "<font color=#FF0000>Empty fields detected! </font>";
                }
                else
                {
                    checkPin();
                }
            
        }



            private void checkPin()
        {
           
                string pintext = TextBox1.Text;
                string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connString);
                conn.Open();

                MySqlCommand dummy1 = new MySqlCommand("SELECT pin FROM voteEvents WHERE pin = '" + pintext + "'", conn);
                MySqlDataReader lectura;
                lectura = dummy1.ExecuteReader();

                if (lectura.Read())
                {
                    status = "true";
                    Session["pin"] = pintext;
                    conn.Close();
                    Response.Redirect("quiz.aspx");
                    return;

                }

                else
                {
                    conn.Close();
                    errtext.InnerHtml = "<font color=#FF0000>Invalid PIN </font>";
                    return;
                }
            
        }
    }
}