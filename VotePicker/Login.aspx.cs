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
    public partial class Login : System.Web.UI.Page
    {
        static string user, password, role,accountstatus;


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string user1, password1;
            user1 = this.username.Text;
            password1 = this.pass.Text;


            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);


            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                    MySqlCommand dummy1 = new MySqlCommand("SELECT username,password,role,accountStatus FROM accounts WHERE username = '" + username.Text + "' and password = '" + pass.Text + "' ", conn);
                    MySqlDataReader lectura;
                    lectura = dummy1.ExecuteReader();


                    int count = 0;
                    while (lectura.Read())
                    {
                        count = count + 1;
                        user = lectura[0].ToString();
                        password = lectura[1].ToString();
                        role = lectura[2].ToString();
                        accountstatus = lectura[3].ToString();


                    }
                    if (count == 1)
                    {
                        if (role == "admin")
                        {
                            Session["username"] = username.Text;
                            Response.Redirect("admin.aspx");
                            
                        }
                        else if(role =="presenter" && accountstatus == "Active")
                        {
                            Session["username"] = username.Text;
                            Response.Redirect("Default.aspx");

                        }
                        else if (role == "presenter" && accountstatus == "Suspended")
                        {
                            username.Text = String.Empty;
                            pass.Text = String.Empty;
                            errtext.InnerHtml = "<font color=#FF0000>Invalid Login: Account Suspended </font>";

                        }
                    }
                    else
                    {
                        username.Text= String.Empty;
                        pass.Text = String.Empty;
                        errtext.InnerHtml = "<font color=#FF0000>Invalid Login: Wrong Username and Password </font>";
                        return;
                    }

                }
            }
            catch (MySqlException ex)
            {
                errtext.InnerHtml = "<font color=#FF0000>" + ex.Message + "</font>";

                return;
            }

        }


    }
}

    