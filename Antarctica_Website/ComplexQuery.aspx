<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ComplexQuery.aspx.cs" Inherits="Antarctica_Website.ComplexQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>שאילתה מורכבת</title>
    <style>
        body {
            direction: ltr;
            font-family: Assistant;
            color: #dddddd;
        }



        .alignRight {
            text-align: right;
        }

        .alignLeft {
            text-align: left;
        }

        td, th, tr, table {
            border: 1px ridge #04aa6d;
            direction: rtl;
            border-collapse: collapse;
            padding: 5px;
            text-align: center;
        }

        h1, h2, h3, h4, h5, form {
            text-align: center;
        }
    </style>
    <script>
        function detectField1() {
            if (document.getElementById("field1").value == "gender") {
                document.getElementById("query1").innerHTML =
                    "<span dir='rtl'><input type='radio' name='value1' value='male' checked='checked' /> זכר" +
                    "<input type='radio' name='value1' value='female' /> נקבה</span>";
            }
            else {
                if (document.getElementById("field1").value == "yearBorn" || document.getElementById("field1").value == "yearFrom") {
                    var yearStr = "<select name='value1'><option value='0'>--בחר שנה--</option>";
                    var currYear = new Date().getFullYear();
                    var fromYear = currYear - 40;
                    var toYear = currYear - 10;

                    for (var i = fromYear; i < toYear; ++i)
                        yearStr += "<option value='" + i + "'>" + i + "</option>\n";
                    document.getElementById("query1").innerHTML = yearStr + "</select>";

                }
                else {
                    if (document.getElementById("field1").value == "prefix") {
                        var prefixStr = "<select name='value1'>";
                        prefixStr += "<option value='050'>050</option>"
                        prefixStr += "<option value ='052'>052</option>";
                        prefixStr += "<option value='053'>053</option>";
                        prefixStr += "<option value='054'>054</option>";
                        prefixStr += "<option value='055'>055</option>";
                        prefixStr += "<option value='056'>056</option>";
                        prefixStr += "<option value='057'>057</option>";
                        prefixStr += "<option value='058'>058</option>";
                        prefixStr += "<option value='059'>059</option>";
                        prefixStr += "<option value='077'>077</option>";
                        prefixStr += "</select>";
                        document.getElementById("query1").innerHTML = prefixStr;
                    }
                    else {
                        if (document.getElementById("field1").value == "hobby") {
                            var hobbyStr = "<select name='value1'>";
                            hobbyStr += "<option value='1'>Baseball</option>";
                            hobbyStr += "<option value='2'>Karate</option>";
                            hobbyStr += "<option value='3'>Basketball</option>";
                            hobbyStr += "<option value='4'>Swimming</option>";
                            hobbyStr += "<option value='5'>Programming</option>";
                            hobbyStr += "</select>";
                            document.getElementById("query1").innerHTML = hobbyStr;
                        }
                        else
                            document.getElementById("query1").innerHTML = "<input type='text' name='value1' />";
                    }
                }
            }
        }
        function detectField2() {
            if (document.getElementById("field2").value == "gender") {
                document.getElementById("query2").innerHTML =
                    "<span dir='rtl'><input type='radio' name='value2' value='male' checked='checked' /> זכר" +
                    "<input type='radio' name='value2' value='female' /> נקבה</span>";
            }
            else {
                if (document.getElementById("field2").value == "yearBorn" || document.getElementById("field2").value == "yearTo") {
                    var yearStr = "<select name='value2'><option value='0'>--בחר שנה--</option>";
                    var currYear = new Date().getFullYear();
                    var fromYear = currYear - 40;
                    var toYear = currYear - 10;

                    for (var i = fromYear; i < toYear; ++i)
                        yearStr += "<option value='" + i + "'>" + i + "</option>\n";
                    document.getElementById("query2").innerHTML = yearStr + "</select>";

                }
                else {
                    if (document.getElementById("field2").value == "prefix") {
                        var prefixStr = "<select name='value2'>";
                        prefixStr += "<option value='050'>050</option>"
                        prefixStr += "<option value ='052'>052</option>";
                        prefixStr += "<option value='053'>053</option>";
                        prefixStr += "<option value='054'>054</option>";
                        prefixStr += "<option value='055'>055</option>";
                        prefixStr += "<option value='056'>056</option>";
                        prefixStr += "<option value='057'>057</option>";
                        prefixStr += "<option value='058'>058</option>";
                        prefixStr += "<option value='059'>059</option>";
                        prefixStr += "<option value='077'>077</option>";
                        prefixStr += "</select>";
                        document.getElementById("query2").innerHTML = prefixStr;
                    }
                    else {
                        if (document.getElementById("field2").value == "hobby") {
                            var hobbyStr = "<select name='value2'>";
                            hobbyStr += "<option value='1'>Baseball</option>";
                            hobbyStr += "<option value='2'>Karate</option>";
                            hobbyStr += "<option value='3'>Basketball</option>";
                            hobbyStr += "<option value='4'>Swimming</option>";
                            hobbyStr += "<option value='5'>Programming</option>";
                            hobbyStr += "</select>";
                            document.getElementById("query2").innerHTML = hobbyStr;
                        }
                        else
                            document.getElementById("query2").innerHTML = "<input type='text' name='value2' />";
                    }
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <% if (Session["admin"].ToString() == "yes")
        {  %>
    <h1>הצגת משתמשים רשומים המקיימים תנאי אחד או שני תנאים</h1>

    <form id="Form1" method="post" runat="server">

        <table border="1" style="margin-right: auto; margin-left: auto; direction: rtl">

            <tr>
                <td style="width: 20px;">
                    <select name="field1" id="field1" onchange="detectField1();">
                        <option value="lName">שם משפחה</option>

                        <option value="fName">שם פרטי</option>

                        <option value="email">דואר אלקטרוני</option>

                        <option value="gender">מגדר</option>

                        <option value="yearBorn">שנת לידה</option>

                        <option value="yearFrom">משנה</option>

                        <option value="prefix">קידומת טלפון</option>

                        <option value="phone">טלפון</option>

                        <option value="hobby">תחביב</option>
                    </select>
                </td>

                <td style="width: 150px;">
                    <div id="query1" style="text-align: center;"></div>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center; direction: ltr;">
                    <input type="radio" name="op" value="and" checked="checked" />
                    AND &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                       
                    <input type="radio" name="op" value="or" />
                    OR                    </td>
            </tr>

            <tr>
                <td style="width: 20px;">
                    <select name="field2" id="field2" onclick="detectField2();">
                        <option value="lName">שם משפחה</option>

                        <option value="fName">שם פרטי</option>

                        <option value="email">דואר אלקטרוני</option>

                        <option value="gender">מגדר</option>

                        <option value="yearBorn">שנת לידה</option>

                        <option value="yearTo">עד שנה</option>

                        <option value="prefix">קידומת טלפון</option>

                        <option value="phone">טלפון</option>

                        <option value="hobby">תחביב</option>
                    </select>
                </td>

                <td style="width: 150px;">
                    <div id="query2" style="text-align: center;"></div>
                </td>
            </tr>

            <tr>

                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="submit" value="חפש" />
                </td>
            </tr>
        </table>
    </form>

    <h2 style="text-align: center; direction: ltr;">
        <%= sql %>
    </h2>

    <table border="1" dir="rtl" style="margin: 0px auto">
        <%= st %>
    </table>
    <h3 dir="rtl"><%= msg %></h3>
    <%}
        else
        {
    %>
    You're not an admin!!
                <br />
    <a href='Homepage.aspx'>[back]</a>
    <% } %>
</asp:Content>
