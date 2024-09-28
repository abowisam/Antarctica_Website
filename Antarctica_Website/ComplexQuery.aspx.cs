using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Antarctica_Website
{
    public partial class ComplexQuery : System.Web.UI.Page
    {
        
        public string st = "";
        public string msg = "";
        public string sql = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
                
            
                
                string field1 = Request.Form["field1"];
                string field2 = Request.Form["field2"];

                string value1 = Request.Form["value1"];
                string value2 = Request.Form["value2"];

                string op = Request.Form["op"];

                string fileName = "usersDB.mdf"; //usersssssssssssssssssDB
                string tableName = "usersTbl";

                string qry1 = "", qry2 = "";

                if (value1 != null)
                {
                    if (field1 == "gender" || field1 == "prefix")
                        qry1 = field1 + " = '" + value1 + "'";
                    else if (field1 == "yearBorn")
                        qry1 = field1 + " = " + value1;
                    else if (field1 == "yearFrom")
                        qry1 = "yearBorn" + " >= " + value1;
                    else if (field1 == "hobby")
                    {
                        var val1 = int.Parse(value1);
                        switch (val1)
                        {
                            case 1: field1 = "hob1"; break;
                            case 2: field1 = "hob2"; break;
                            case 3: field1 = "hob3"; break;
                            case 4: field1 = "hob4"; break;
                            case 5: field1 = "hob5"; break;
                        }
                        qry1 = field1 + " = 'T'";
                    }
                    else if (field1 == "email")
                        qry1 = field1 + " like '%" + value1 + "%'";
                    else
                        qry1 = field1 + " like N'" + value1 + "%'";
                }

                //--- Second if statement: ---
                if (value2 != null)
                {
                    if (field2 == "gender" || field2 == "prefix")
                        qry2 = field2 + " = '" + value2 + "'";
                    else if (field2 == "yearBorn")
                        qry2 = field2 + " = " + value2;
                    else if (field2 == "yearTo")
                        qry2 = "yearBorn" + " <= " + value2;
                    else if (field2 == "hobby")
                    {
                        var val2 = int.Parse(value2);
                        switch (val2)
                        {
                            case 1: field2 = "hob1"; break;
                            case 2: field2 = "hob2"; break;
                            case 3: field2 = "hob3"; break;
                            case 4: field2 = "hob4"; break;
                            case 5: field2 = "hob5"; break;
                        }
                        qry2 = field2 + " = 'T'";
                    }
                    else if (field2 == "email")
                        qry2 = field2 + " like '%" + value2 + "%'";
                    else
                        qry2 = field2 + " like N'" + value2 + "%'";
                }

                string sqlSelect = "";
                if (qry1 != "" && qry2 != "")
                {
                    if (op == "and")
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " AND " + qry2 + ");";
                    else
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " OR " + qry2 + ");";
                }
                else
                {
                    if (qry1 != "")
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + ");";
                    else if (qry2 != "")
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry2 + ");";
                }
                sql = sqlSelect;


                //enabling the query:
                if (sqlSelect != "")
                {
                    DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                    int length = table.Rows.Count;
                    if (length == 0)
                    {
                        msg = "לא נמצאו רשומות תואמות לחיפוש!";
                    }
                    else
                    {
                        st += "<tr>";
                        st += "<th style='text-align: center; width 100px;'>שם משתמש</th>";
                        st += "<th style='text-align: center; width 80px;'>שם פרטי</th>";
                        st += "<th style='text-align: center; width 60px;'>שם משפחה</th>";
                        st += "<th style='text-align: center; width 140px;'>דואר אלקטרוני</th>";
                        st += "<th style='text-align: center; width 60px;'>מגדר</th>";
                        st += "<th style='text-align: center;'>שנת לידה</th>";
                        st += "<th style='text-align: center;'>מספר טלפון</th>";
                        st += "<th style='text-align: center;'>יישוב</th>";
                        st += "<th style='text-align: center;'>Baseball</th>";
                        st += "<th style='text-align: center;'>Karate</th>";
                        st += "<th style='text-align: center;'>Basketball</th>";
                        st += "<th style='text-align: center;'>Swimming</th>";
                        st += "<th style='text-align: center;'>Programming</th>";
                        //st += "<th style='text-align: center;  width:100px;'>>סיסמה</th>";
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
                        msg = "נמצאו  סה\"כ: " + length + " אנשים.";
                    }
                }
            }
        }
    }
