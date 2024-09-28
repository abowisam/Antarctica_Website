using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Antarctica_Website
{
    public partial class ShowTable : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlSelect = "";
        public string userToDelete ="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                st += "You're not an admin!!";
                st += "<br/> <a href='Homepage.aspx'>[back]</a>";
            }
            else
            {

                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";
                sqlSelect = "SELECT * FROM " + tableName;

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "אין נרשמים בטבלה";
                }
                else
                {

                    st += "<tr>";
                    st += "<th rowspan='2'>Username</th>";
                    st += "<th rowspan='2'>First Name</th>";
                    st += "<th rowspan='2'>Last Name</th>";
                    st += "<th rowspan='2'>Email</th>";
                    st += "<th rowspan='2'>Gender</th>";
                    st += "<th rowspan='2'>Birth Year</th>";
                    st += "<th rowspan='2'>Phone Number</th>";
                    st += "<th rowspan='2'>City</th>";
                    st += "<th colspan=\"5\" style=\"\">Hobbies</th>";

                    st += "<th rowspan='2'>Password</th>";
                    st += "<th rowspan='2'>Delete</th>";
                    st += "</tr>";
                    st += "<tr>";
                    st += "<th>Programming</th>";
                    st += "<th>Swimming</th>";
                    st += "<th>Basketball</th>";
                    st += "<th>Karate</th>";
                    st += "<th>Baseball</th>";
                    
                    
                    
                    
                    st += "</tr>";


                }

                for (int i = 0; i < length; i++)
                {
                    st += "<tr>";
                    st += $"<td>{table.Rows[i]["uName"]}</td>";
                    st += $"<td>{table.Rows[i]["fName"]}</td>";
                    st += $"<td>{table.Rows[i]["lName"]}</td>";
                    st += $"<td class='alignLeft'>{table.Rows[i]["email"]}</td>";
                    st += $"<td>{table.Rows[i]["gender"]}</td>";
                    st += $"<td>{table.Rows[i]["YearBorn"]}</td>";
                    st += $"<td>{table.Rows[i]["prefix"]}-{table.Rows[i]["phone"]}</td>";
                    st += $"<td class='alignRight'>{table.Rows[i]["city"]}</td>";
                    st += $"<td>{table.Rows[i]["hob1"]}</td>";
                    st += $"<td>{table.Rows[i]["hob2"]}</td>";
                    st += $"<td>{table.Rows[i]["hob3"]}</td>";
                    st += $"<td>{table.Rows[i]["hob4"]}</td>";
                    st += $"<td>{table.Rows[i]["hob5"]}</td>";
                    st += $"<td>{table.Rows[i]["pw"]}</td>";

                    userToDelete = table.Rows[i]["uName"].ToString();
                    st += "<td> <a href='DeleteRecord.aspx?uName=" + userToDelete + "'><button class='clear_button'>delete</button></a></td>";
                    st += "</tr>";
                }
                msg = "נרשמו " + length + " אנשים ";
            }
        }
    }
}