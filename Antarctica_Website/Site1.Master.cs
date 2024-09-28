using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Antarctica_Website
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string add ="";
        public string uNameMsg ="";
        public string loginMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            uNameMsg += Session["fName"].ToString();
            

            if (Session["admin"].ToString() == "yes")
            {
                loginMsg += "<a class=\"headermsg\" href = 'ManagerPage.aspx'><button class='button2'>Admin Panel</button></a>";
                loginMsg += "<a class=\"headermsg\" href = 'Logout.aspx'><button class='button2'>Logout</button></a>";
            }
            else if (Session["uName"].ToString() == "Guest")
            {
                loginMsg += "<a class=\"headermsg\"  href = 'SignUp.aspx'><button class='button2'>Register</button></a>";
                loginMsg += "<a class=\"headermsg\" href = 'Login.aspx'><button class='button2'>Login</button></a>";
                loginMsg += "<a class=\"headermsg\" href=\"LoginAdmin.aspx\" style=\"font-size: 20px;\"><button class='button2'>Admin Login</button></a>";

            } else
            {
                loginMsg += "<a class=\"headermsg\" href = 'UpdateUser.aspx'><button class='button2'>Update Info</button></a>";
                //loginMsg += "<a class=\"headermsg\" href=\"LoginAdmin.aspx\" style=\"font-size: 20px;\"><button class='button2'>Admin Login</button></a>";
                loginMsg += "<a  class=\"headermsg\" href = 'Logout.aspx'><button class='button_logout'>Logout</button></a> ";
                
            }

            if (Session["uName"].ToString() != "Guest" || Session["admin"].ToString() == "yes")
            {
                add += "<a class=\"rw\" href=\"Gallery.aspx\">Gallery</a><a class =\"rw\" href=\"HowToGo.aspx\">How to go to Antarctica</a>";
            }

        }
        
    }
}