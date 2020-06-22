using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace votepicker_webproj
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Label1.Visible = true;
                    Label1.Text = Session["username"].ToString();
                }

                else
                {
                    Response.Redirect("LoginNew.Aspx");
                }

            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}