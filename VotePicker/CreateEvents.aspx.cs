using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class CreateEvents : Page
    {
        static int add = 0;
        string eventid;
        static bool tests = false;
        protected void Page_PreInIt(object sender, EventArgs e)
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack)
                {
                    var collection = new List<string>();
                    add = 1;

                    int count = Int32.Parse(question.Text);
                    for (int i = 0; i < count; i++)
                    {

                        TableRow row = new TableRow();
                        row.Attributes.Add("runat", "server");
                        for (int j = 0; j < 6; j++)
                        {

                            TableCell cell = new TableCell();
                            cell.Attributes.Add("runat", "server");
                            if (j == 0)
                            {
                                cell.Text = i.ToString();
                                cell.Width = 30;
                            }
                            else
                            {
                                TextBox a = new TextBox();
                                if (j == 1) { a.Width = 300; }
                                a.ID = "que" + (i * 6 + j - add);

                                Console.WriteLine(a.ID);
                                cell.Controls.Add(a);
                            }
                            row.Cells.Add(cell);

                        }
                        add++;
                        myTable.Rows.Add(row);

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnsaveProduct_Click(object sender, EventArgs e)
        {


            /*

             SqlDataSource1.Insert();

             this.lblAddingNewItem.Text = "Item Has Been Added into the Database";
             btnsaveProduct.Visible = false;
             TextBox1.Enabled = false;
             TextBox2.Enabled = false;
             TextBox3.Enabled = false;
             TextBox4.Enabled = false;
             TextBox5.Enabled = false;
             */
        }

        private List<string> TextBoxIdCollection
        {
            get
            {
                var collection = ViewState["TextBoxIdCollection"] as List<string>;
                return collection ?? new List<string>();
            }
            set { ViewState["TextBoxIdCollection"] = value; }
        }

        protected void quesnum(object sender, EventArgs e)
        {

        }

        protected void CreateEvent(object sender, EventArgs e)
        {
            int checkemptybox = add - 1;
            string eventname = name.Value.ToString();
            int questionnum;
            bool isNumeric = int.TryParse(question.Text, out questionnum);
            if (isNumeric == false)
            {
                Response.Write("<script>alert('There are no questions')</script>");
                return;
            }
            else if (eventname == "" || questionnum < 0)
            {
                Response.Write("<script>alert('There are no questions')</script>");
                return;
            }
            else
            {
                for (int i = 0; i < checkemptybox; i++)
                {
                    for (int j = 0; j < 5; j++)
                    {
                        string id = "que" + (i * 5 + j);

                        TextBox textbox = FindControlRecursive(myTable, id) as TextBox;
                        if (textbox.Text == "")
                        {
                            Response.Write("<script>alert('There are empty fields')</script>");
                            return;
                        }
                    }
                }
            }


            int numofinsert = add - 1;
            string connString = ConfigurationManager.ConnectionStrings["sql12"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            string date = DateTime.Now.ToString("MM/dd/yyyy h:mm tt");
            comm.CommandText = "INSERT INTO voteEvents(eventName,dateCreated,pin) VALUES(@eventname, @date,@pin)";
            DateTime today = DateTime.Today;
            comm.Parameters.AddWithValue("@eventname", name.Value.ToString());
            comm.Parameters.AddWithValue("@date", today.ToString("yyyy/MM/dd"));
            comm.Parameters.AddWithValue("@pin", pin.Value.ToString());
            comm.ExecuteNonQuery();

            MySqlCommand cmd = new MySqlCommand("Select id from voteEvents WHERE eventname = '" + name.Value.ToString() + "'", conn);
            MySqlDataReader myReader;
            myReader = cmd.ExecuteReader();
            while (myReader.Read())
            {
                eventid = myReader.GetString(0);
            }

            testl.InnerText = numofinsert.ToString();
            comm.Dispose();
            conn.Close();
            conn.Open();

            for (int i = 0; i < numofinsert; i++)
            {
                comm.CommandText = "INSERT INTO votequestions(eventid,Question,Choice1,Choice2,Choice3,Choice4) VALUES(@eventid, @question,@c1,@c2,@c3,@c4)";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("@eventid", Int32.Parse(eventid));
                for (int j = 0; j < 5; j++)
                {
                    string id = "que" + (i * 5 + j);

                    TextBox textbox = FindControlRecursive(myTable, id) as TextBox;

                    if (j == 0)
                    {
                        testl.InnerText = textbox.Text;
                        comm.Parameters.AddWithValue("@question", textbox.Text);
                    }
                    if (j == 1)
                    {
                        comm.Parameters.AddWithValue("@c1", textbox.Text);
                    }
                    if (j == 2)
                    {
                        comm.Parameters.AddWithValue("@c2", textbox.Text);
                    }
                    if (j == 3)
                    {
                        comm.Parameters.AddWithValue("@c3", textbox.Text);
                    }
                    if (j == 4)
                    {
                        comm.Parameters.AddWithValue("@c4", textbox.Text);
                    }

                }
                comm.ExecuteNonQuery();
                comm.Dispose();
            }

            conn.Close();
            Response.Write("<script>alert('Event Created')</script>");
            Response.Redirect("Default.aspx");
        }



        private Control FindControlRecursive(Table rootControl, string controlID)
        {
            foreach (TableRow a in rootControl.Rows)
            {
                foreach (TableCell b in a.Cells)
                {
                    ControlCollection wtf = b.Controls;
                    foreach (Control controlToSearch in b.Controls)
                    {
                        if (controlToSearch.ID == controlID)
                        {
                            return controlToSearch;
                        }
                    }
                }
            }

            return null;
        }




        protected void button2_Load(object sender, EventArgs e)
        {

        }
    }
}