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
    public partial class Register : System.Web.UI.Page
    {

        string status,usernamecheck,err1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            chceckaccount();
            string user, password, role, name1,email1,accountStatus;
            user = this.username.Text;
            password = this.pass.Text;
            name1 = this.name.Text;
            email1 = this.email.Text;
            role = "presenter";
            accountStatus = "Active";



            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);


            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    if (username.Text != "" && pass.Text != "" && status == "true")
                    {
                        conn.Open();
                        MySqlCommand insert_command = new MySqlCommand("INSERT INTO accounts(username,password,role,email,name,accountStatus) VALUES(@username,@password,@role,@email,@name,@accountStatus)", conn);
                        insert_command.Parameters.AddWithValue("@username", user);
                        insert_command.Parameters.AddWithValue("@password", password);
                        insert_command.Parameters.AddWithValue("@role", role);
                        insert_command.Parameters.AddWithValue("@email", email1);
                        insert_command.Parameters.AddWithValue("@name", name1);
                        insert_command.Parameters.AddWithValue("@accountStatus", accountStatus);
                        insert_command.ExecuteNonQuery();
                        username.Text = String.Empty;
                        pass.Text = String.Empty;
                        name.Text = String.Empty;
                        email.Text = String.Empty;
                        errtext.InnerHtml = "<font color=#FF0000>Account Successfully Created </font>";
                        




                    }

                    else if(username.Text == "" && pass.Text == "")
                    {
                        username.Text = String.Empty;
                        pass.Text = String.Empty;
                        errtext.InnerHtml = "<font color=#FF0000>Username or Password fields cannot be empty </font>";
                    }
                }
            }

            catch (MySqlException ex)
            {
                errtext.InnerHtml = "<font color=#FF0000>" + ex.Message + "</font>";

                return;
            }

        }


        private void chceckaccount()
        {
            string username1 = this.username.Text;

            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand dummy1 = new MySqlCommand("SELECT username FROM accounts WHERE username = '" + username1 + "'", conn);
            MySqlDataReader lectura;
            lectura = dummy1.ExecuteReader();

            if (lectura.Read())
            {
                err1 = "This username has already been used.";
                status = "false";
                errtext.InnerHtml = "<font color=#FF0000>" + err1 + "</font>";
                conn.Close();
                return;
                

            }

            else
            {
                status = "true";
                conn.Close();
            }
            }
         
        }
    }

    