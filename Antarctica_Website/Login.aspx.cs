using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Antarctica_Website
{
    public partial class SignUp : System.Web.UI.Page
    {
        public string msg;
        public string sqlLogin;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string uName = Request.Form["userName"];
                string pw = Request.Form["password"];
                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";
                sqlLogin = $" select * From {tableName} where uName = '{uName}' AND pw = '{pw}' ";
                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "<h1 style=\"font-size:30px; width:fit-content;direction:ltr;text-align: center; color:red; font-family:Bahnschrift; margin-left:auto; margin-right:auto;\">" + "User Not Found!" +"</h1>";
                    msg += "<center><a margin:0px auto; href='Homepage.aspx'><button  class='button2'>Back</button></a></center></div>";
                }
                else
                {
                    
                    Session["uName"] = table.Rows[0]["uName"];
                    Session["fName"] = table.Rows[0]["fName"];
                    
                    Response.Redirect("Homepage.aspx");
                }

                
            }

        }
    }
}