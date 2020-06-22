using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class ViewEvent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eventid"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string command = SqlDataSource2.SelectCommand; // added just for debug purpose
                SqlDataSource2.SelectCommand = "SELECT  * from votequestions where eventid='" + Session["eventid"].ToString() + "' AND question LIKE '%" + TextBox1.Text + "%'";
                SqlDataSource2.DataBind();
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                if (TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "")
                {
                    Response.Write("<script>alert('Add Questions have missing Fields')</script>");
                }
                else
                {
                    SqlDataSource2.InsertParameters["question"].DefaultValue = TextBox2.Text;
                    SqlDataSource2.InsertParameters["Choice1"].DefaultValue = TextBox3.Text;
                    SqlDataSource2.InsertParameters["Choice2"].DefaultValue = TextBox4.Text;
                    SqlDataSource2.InsertParameters["Choice3"].DefaultValue = TextBox5.Text;
                    SqlDataSource2.InsertParameters["Choice4"].DefaultValue = TextBox6.Text;
                    SqlDataSource2.Insert();
                    SqlDataSource2.DataBind();
                    GridView1.DataBind();
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                }
            }
        }
    }
}

    
