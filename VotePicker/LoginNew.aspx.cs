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
using System.Web.Services;
using Newtonsoft.Json;


namespace votepicker_webproj
{
    public partial class LoginNew : System.Web.UI.Page
    {

        static string role, accountstatus, status, usernamecheck, err1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void loginuser()
        {

        }

        [WebMethod]
        public static string saveData(string username, string password)
        {

            string result = "haha";


            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);


            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                    MySqlCommand dummy1 = new MySqlCommand("SELECT username,password,role,accountStatus FROM accounts WHERE username = '" + username + "' and password = '" + password + "' ", conn);
                    MySqlDataReader lectura;
                    lectura = dummy1.ExecuteReader();


                    int count = 0;
                    while (lectura.Read())
                    {
                        count = count + 1;
                        username = lectura[0].ToString();
                        password = lectura[1].ToString();
                        role = lectura[2].ToString();
                        accountstatus = lectura[3].ToString();


                    }
                    if (count == 1)
                    {
                        if (role == "admin")
                        {

                            result = "admin";


                        }
                        else if (role == "presenter" && accountstatus == "Active")
                        {
                            result = "presenter";


                        }
                        else if (role == "presenter" && accountstatus == "Suspended")
                        {
                            result = "suspended";

                        }
                    }
                    else
                    {
                        result = "invalid";

                    }


                }
            }
            catch (MySqlException ex)
            {

            }
            return result;
        }
        // string result = "unsucessful";
        //   if(username=="a")
        //      {
        // result = "sucessful";
        //  }

        //    return result;

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            chceckaccount();
            string user, password, role, name1, email1, accountStatus;
            user = this.Username.Text;
            password = this.Password.Text;
            name1 = this.name.Text;
            email1 = this.Email.Text;
            role = "presenter";
            accountStatus = "Active";



            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);


            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    if (Username.Text != "" && Password.Text != "" && status == "true")
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
                        Username.Text = String.Empty;
                        Password.Text = String.Empty;
                        name.Text = String.Empty;
                        Email.Text = String.Empty;
                        readerrortext.InnerHtml = "<font color=#FF0000>Account Successfully Created </font>";





                    }

                    else if (Username.Text == "" && Password.Text == "")
                    {
                        Username.Text = String.Empty;
                        Password.Text = String.Empty;
                        readerrortext.InnerHtml = "<font color=#FF0000>Username or Password fields cannot be empty </font>";
                    }
                }
            }

            catch (MySqlException ex)
            {
                readerrortext.InnerHtml = "<font color=#FF0000>" + ex.Message + "</font>";

                return;
            }

        }


        private void chceckaccount()
        {
            string username1 = this.Username.Text;

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
                readerrortext.InnerHtml = "<font color=#FF0000>" + err1 + "</font>";
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
  


    