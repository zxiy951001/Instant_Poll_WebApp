using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "DELTETO")
            {

                string username = e.CommandArgument.ToString();
                string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
                MySqlConnection conn = new MySqlConnection(connString);
                conn.Open();
                MySqlCommand comm = conn.CreateCommand();
                comm.CommandText = "DELETE FROM accounts WHERE username='" + username + "'";
                comm.ExecuteNonQuery();
                comm.Dispose();
                conn.Close();
                SqlDataSource1.DataBind();
                GridView1.DataBind();
            }
            else
            {
                return;
            }

        }

    }
}