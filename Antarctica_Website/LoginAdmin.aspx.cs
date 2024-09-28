using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Antarctica_Website
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlAdmin = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string name = Request.Form["userName"];
                string pw = Request.Form["password"];
                string fileName = "usersDB.mdf";
                /* managerTbl */
                sqlAdmin = "SELECT * FROM managerTbl WHERE mName = '"+name+"' AND mPw = '"+pw+"';";
                
                    
                    DataTable table = Helper.ExecuteDataTable(fileName, sqlAdmin);
                    int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "<div style='text-align:center;'> ";
                    msg = "<h1 style=\"font-size:30px; width:fit-content;direction:ltr;text-align: center; color:red; font-family:Bahnschrift; margin-left:auto; margin-right:auto;\">" + "Admin Not Found!" + "</h1>";
                    msg += "<center><a margin:0px auto; href='Homepage.aspx'><button class='button2'>Back</button></a></center></div>";
                }
                else
                {
                    Session["uName"] = "admin";
                    Session["fName"] = "admin";
                    Session["admin"] = "yes";
                    Response.Redirect("Homepage.aspx");


                }
            }

        }   
    }
}