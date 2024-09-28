using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.DynamicData;

namespace Antarctica_Website
{
    public partial class SimpleQuery : System.Web.UI.Page
    {

        public string st = "";
        public string msg = "";
        public string sqlSelect = "";
        public string sql = "";
        protected void Page_Load(object sender, EventArgs e)
        {



            string field = Request.Form["field"];
            string value = Request.Form["value"];

            string fileName = "usersDB.mdf";
            string tableName = "usersTbl";

            if (field == "gender" || field == "prefix")
                sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = '" + value + "');";
            else if (field == "yearBorn")
                sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = " + value + ");";
            else if (field == "hobby")
            {
                var val = int.Parse(value);
                switch (val)
                {
                    case 1: field = "hob1"; break;
                    case 2: field = "hob2"; break;
                    case 3: field = "hob3"; break;
                    case 4: field = "hob4"; break;
                    case 5: field = "hob5"; break;
                }
                sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = 'T');";
            }
            else if (field == "email")
                sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like '%" + value + "%');";
            else
                sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like N'" + value + "%');";

            sql = sqlSelect;
            //enabling shielatah:
            if (sqlSelect != "" && sqlSelect != "SELECT * FROM " + tableName + " where (" + " like '%" + "%');" && sqlSelect != "SELECT * FROM " + tableName + " where (" + " like N'" + "%');")
            {
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "לא נמצאו רשומות תואמות לחיפוש";
                }
                else
                {
                    st += "<tr>";
                    st += "<th>שם משתמש</th>";
                    st += "<th>שם פרטי</th>";
                    st += "<th>שם משפחה</th>";
                    st += "<th>דואר אלקטרוני</th>";
                    st += "<th>מגדר</th>";
                    st += "<th>שנת לידה</th>";
                    st += "<th>מספר טלפון</th>";
                    st += "<th>יישוב</th>";
                    st += "<th>Baseball</th>";
                    st += "<th>Karate</th>";
                    st += "<th>Basketball</th>";
                    st += "<th>Swimming</th>";
                    st += "<th>Programming</th>";
                    //st += "<th>סיסמה</th>";
                    st += "</tr>";


                    for (int i = 0; i < length; i++)
                    {
                        st += "<tr>";
                        st += $"<td>{table.Rows[i]["uName"]}</td>";
                        st += $"<td class='alignRight'>{table.Rows[i]["fName"]}</td>";
                        st += $"<td class='alignRight'>{table.Rows[i]["lName"]}</td>";
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
                        //st += $"<td>{table.Rows[i]["pw"]}</td>";
                        st += "</tr>";
                    }
                    msg = length + " אנשים עונים לתוצאות החיפוש ";
                }
            }
        }
    }

}
