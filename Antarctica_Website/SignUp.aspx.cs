using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Antarctica_Website
{
    public partial class Forms : System.Web.UI.Page
    {
        public string birthYearStr = "";
        public string st = "";
        public string msg = "";
        public string sqlMsg = "";
        public string yrBorn = "";
        public string cityStr = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            

           

            if (Request.Form["submit"] != null)
            {
                //------ אחזור פרטים מהטופס -------
                string uName = Request.Form["userName"];
                string lName = Request.Form["lastName"];
                string fName = Request.Form["firstName"];
                string email = Request.Form["email"];

                string gender = Request.Form["gender"];
                string prefix = Request.Form["prefix"];

                string phone = Request.Form["phone"];
                string city = Request.Form["city"];
                city = (city == "גת") ? "ג'ת" : city;
                city = (city == "סחנין") ? "סח'נין" : city;

                string yearBorn = Request.Form["birthYear"];       //  שנת לידה כמחרוזת
                int yBorn = int.Parse(yearBorn);                  //  המרת שנת לידה למספר

                string pw = Request.Form["password"];             //  סיסמה          
                string hob1, hob2, hob3, hob4, hob5;
                if (Request.Form["hobby"] != null)
                {
                    string hobby = Request.Form["hobby"].ToString();
                    hob1 = "F";
                    hob2 = "F";
                    hob3 = "F";
                    hob4 = "F";
                    hob5 = "F";

                    if (hobby.Contains('1')) hob1 = "T";
                    if (hobby.Contains('2')) hob2 = "T";
                    if (hobby.Contains('3')) hob3 = "T";
                    if (hobby.Contains('4')) hob4 = "T";
                    if (hobby.Contains('5')) hob5 = "T";
                }
                else
                {
                    hob1 = "F";
                    hob2 = "F";
                    hob3 = "F";
                    hob4 = "F";
                    hob5 = "F";
                }

                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";

                string sqlselect = $"select * from {tableName} where uName = '{uName}'";
                if (Helper.IsExist(fileName, sqlselect))
                {
                    msg = "שם המשתמש קיים, נסה שוב עם שם אחר";
                    sqlMsg = sqlselect;

                }
                else
                {
                    string sqlInsert = $" insert Into {tableName} ";
                    sqlInsert += $" Values ('{uName}' , N'{fName}', N'{lName}', '{email}',  ";
                    sqlInsert += $" {yBorn} , '{gender}', '{prefix}', '{phone}', ";
                    sqlInsert += $"N'{city}' , '{hob1}', '{hob2}', '{hob3}', ";
                    sqlInsert += $"'{hob4}' , '{hob5}', '{pw}' ) ";

                    sqlMsg = sqlInsert;

                    Helper.DoQuery(fileName, sqlInsert);
                    msg = "הרשומה התווספה בהצלחה";

                }
            }




                for (int i = 2015; i >= 1990; i--)
                {
                    birthYearStr += "<option value='" + i + "'>" + i + "</option>";
                }

            

        }
    }
}