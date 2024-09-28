using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Antarctica_Website
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>You're Not an admin</h3>";
                msg += "<a href='Homepage.aspx'>[back]</a>";
            }
            else
            {
                string fileName = "usersDB.mdf";
                string uName = Request.QueryString["uName"].ToString();
                string sqlDelete = "DELETE FROM usersTbl WHERE uName ='" + uName + "'";
                Helper.DoQuery(fileName, sqlDelete);
                Response.Redirect("ShowTable.aspx");
            }
        }
    }
}