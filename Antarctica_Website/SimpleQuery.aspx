<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SimpleQuery.aspx.cs" Inherits="Antarctica_Website.SimpleQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>שאילתה פשוטה</title>
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
        function detectField() {
            if (document.getElementById("field").value == "gender") {
                document.getElementById("query").innerHTML = "<span dir='rtl'><input type='radio' name='value' value='male' checked='checked' />זכר" + "<input type='radio' name='value' value='female' />נקבה</span>";
            }
            else {
                if (document.getElementById("field").value == "yearBorn") {
                    var yearStr = "<select name ='value'> <option value='0'>--בחר שנה--</option>";
                    var currYear = new Date().getFullYear();
                    var fromYear = currYear - 40;
                    var toYear = currYear - 10;
                    for (var i = fromYear; i < toYear; i++) {
                        yearStr += "<option value='" + i + "'>" + i + "</option>";
                    }
                    document.getElementById("query").innerHTML = yearStr + "</select>";
                }
                else {
                    if (document.getElementById("field").value == "prefix") {
                        var prefixStr = "<select name='value'>";
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
                        document.getElementById("query").innerHTML = prefixStr;
                    }
                    else {
                        if (document.getElementById("field").value == "hobby") {
                            var hobbyStr = "<select name='value'>";
                            hobbyStr += "<option value='5'>Programming</option>";
                            hobbyStr += "<option value='4'>Swimming</option>";
                            hobbyStr += "<option value='3'>Basketball</option>";
                            hobbyStr += "<option value='2'>Karate</option>";
                            hobbyStr += "<option value='1'>Baseball</option>";
                           
                            
                            
                            
                            hobbyStr += "</select>";
                            document.getElementById("query").innerHTML = hobbyStr;
                        }
                        else
                            document.getElementById("query").innerHTML = "<input type='text' name='value' />";
                    }
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (Session["admin"].ToString() == "yes") {  %>
    <h1>הצגת נתונים לפי חתך </h1>
    <form method="post" runat="server">
        <select name="field" id="field" onclick="detectField();">
            <option value="lName">שם משפחה </option>
            <option value="fName">שם פרטי </option>
            <option value="email">דואר אלקטרוני </option>
            <option value="gender">מגדר </option>
            <option value="yearBorn">שנת לידה </option>
            <option value="prefix">קידומת טלפון </option>
            <option value="phone">טלפון </option>
            <option value="hobby">תחביב </option>
        </select>
        <br />
        <br />
        <div id="query"></div>
        <br style="font-size: small;" />
        <input type="submit" name="submit" value="חפש" />
    </form>
    <h2 dir = "ltr" ><%= sql %> </h2>
        
    <table style="margin: 0px auto; direction: rtl">
        <%= st %>
    </table>
    <h3><%= msg %> </h3>
    
    <% } else
        {
    %>
    You're not an admin!!
                <br />
    <a href='Homepage.aspx'>[back]</a>
    <% } %>
</asp:Content>
