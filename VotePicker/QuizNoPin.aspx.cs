using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class QuizNoPin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "voting")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Session["voteeventid"] = id;
                Response.Redirect("UserVote.aspx");


            }
        }
     }
}