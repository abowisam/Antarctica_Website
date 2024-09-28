using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Antarctica_Website
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        public int yearBorn;
        public string yearList = "";
        public string birthYearStr = "";
        public string msg = "";
        public string sqlUpdate = "";
        public string sqlSelect = "";
        public string yrBorn = "";
        public string uName, fName, lName, email, prefix, phone, gender, pw;
        public string hob1, hob2, hob3, hob4, hob5;
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "usersDB.mdf";
            uName = Session["uName"].ToString();

            string user = Session["uName"].ToString();

            if (uName == "Guest")
            {
                msg = "You're not registered in the system!";
                Response.Redirect("Homepage.aspx");
            }


            sqlSelect = "SELECT * FROM usersTbl WHERE uName =  '" + uName + "'";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

            int length = table.Rows.Count;
            if (length == 0)
                msg = "You're not registered!";
            else
            {
                fName = table.Rows[0]["fName"].ToString().Trim();
                lName = table.Rows[0]["lName"].ToString().Trim();
                email = table.Rows[0]["email"].ToString().Trim();
                prefix = table.Rows[0]["prefix"].ToString().Trim();
                phone = table.Rows[0]["phone"].ToString().Trim();
                gender = table.Rows[0]["gender"].ToString().Trim();
                yearBorn = Convert.ToInt16(table.Rows[0]["yearBorn"]);
                hob1 = table.Rows[0]["hob1"].ToString().Trim();
                hob2 = table.Rows[0]["hob2"].ToString().Trim();
                hob3 = table.Rows[0]["hob3"].ToString().Trim();
                hob4 = table.Rows[0]["hob4"].ToString().Trim();
                hob5 = table.Rows[0]["hob5"].ToString().Trim();

                pw = table.Rows[0]["pw"].ToString().Trim();
            }



            yearBorn = Convert.ToInt16(table.Rows[0]["yearBorn"]);
            for (int i = 2015; i >= 1990; i--)
            {
                if (i == yearBorn)
                    yearList += "<option value='" + i + "' selected='selected' >" + i + "</option>";
                else
                    yearList += "<option value = '" + i + "'>" + i + "</option>";
            }


            if (this.IsPostBack)
            {
                fName = Request.Form["firstName"];
                lName = Request.Form["lastName"];
                email = Request.Form["email"];
                prefix = Request.Form["prefix"];
                phone = Request.Form["phone"];
                gender = Request.Form["gender"];
                int yearBrn = int.Parse(Request.Form["birthYear"]);
                pw = Request.Form["password"];

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
                } else
                {
                    hob1 = "F";
                    hob2 = "F";
                    hob3 = "F";
                    hob4 = "F";
                    hob5 = "F";
                }
                sqlUpdate = "UPDATE usersTbl ";
                sqlUpdate += "SET fName = N'" + fName + "', ";
                sqlUpdate += "lName = N'" + lName + "', ";
                sqlUpdate += "email = '" + email + "', ";
                sqlUpdate += "prefix = '" + prefix + "', ";
                sqlUpdate += "phone = '"+phone + "', ";
                sqlUpdate += "gender = '" +gender+ "', ";
                sqlUpdate += "hob1 = '"+ hob1 +"', ";
                sqlUpdate += "hob2 = '"+ hob2 +"', ";
                sqlUpdate += "hob3 = '"+ hob3 +"', ";
                sqlUpdate += "hob4 = '"+ hob4 +"', ";
                sqlUpdate += "hob5 = '"+ hob5 +"', ";

                sqlUpdate += "pw = '"+ pw +"' ";
                sqlUpdate += "WHERE uName = '" + uName + "'";
                
                Helper.DoQuery(fileName, sqlUpdate);
                msg = "Success";
            }

            







            /*
            for (int i = 2015; i >= 1990; i--)
            {
                birthYearStr += "<option value='" + i + "'>" + i + "</option>";
            }
            */





        }
    }
}