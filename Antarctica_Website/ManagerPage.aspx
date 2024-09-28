<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManagerPage.aspx.cs" Inherits="Antarctica_Website.ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            direction: ltr;
            font-family: Assistant;
            color: #dddddd;
        }

        h1, h2, h3, h4, h5 {
            text-align: center;
        }

        .container {
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            width: 20%;
        }

        .button3 {
            width: 100%;
            background-color: transparent;
            color: #04aa6d;
            border: 2px solid #008CBA;
            cursor: pointer;
            font-family: Assistant;
            font-size: 200%;
            padding-bottom: 5px;
            border-radius: 10px;
            margin-bottom: 2%;
            transition: 0.3s;
        }

            .button3:hover {
                background-color: #008CBA;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!---    body place holder     --->

    <% if (Session["admin"].ToString() == "yes")
        {  %>
    <br /><br /><br /><br />
    <h1 style="text-align: center;">Control Page - דף בקרה</h1>
    <div class="container">
                <button onclick="window.location.href='ShowTable.aspx'" class="button3" >Show Users Table<br /><span style="font-size:15px;vertical-align:top;height:min-content;">(also delete)</span></button>

        <button onclick="window.location.href='SimpleQuery.aspx'" class="button3">שאילתה פשוטה </button>
        


        <button onclick="window.location.href='ComplexQuery.aspx'" class="button3">שאילתה מרוכבת </button>
        

        <br /><br /><br /><br /><br /><br /><br /><br />
    </div>

  
    <%}
        else
        {
    %>
    <center>
    You're not an admin!!
        <br />
        <a href='Homepage.aspx'>[back]</a>
        </center>
                
    
    <% } %>

</asp:Content>
