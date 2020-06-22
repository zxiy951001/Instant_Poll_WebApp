using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void CreateEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvents.aspx");
        }

        protected void btnCreateEvent(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvents.aspx");
        }
        protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName == "ViewEvent")
            {

                int id = Convert.ToInt32(e.CommandArgument);
                Session["eventid"] = id;
                Response.Redirect("ViewEvent.aspx");

            }
            else if (e.CommandName == "EventResult")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Session["eventid"] = id;
                Response.Redirect("Default.aspx");

            }
            else
            {
                return;
            }



        }
    }
}