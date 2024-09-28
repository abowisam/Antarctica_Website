<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowTable.aspx.cs" Inherits="Antarctica_Website.ShowTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--- head place holder --->
    <title>הצגת טבלה</title>
    <style>
        body {
            direction: ltr;
            font-family: Assistant;
            color: #dddddd;
        }

        h1, h2, h3, h4, h5 {
            text-align: center;
        }

        .alignRight {
            text-align: right;
        }

        .alignLeft {
            text-align: left;
        }
        td,th, tr, table {
            border: 1px ridge #04aa6d;
            direction : ltr;
            border-collapse: collapse;
            padding: 5px;
            text-align: center;
        }
        .clear_button {
            background-color: transparent;
            color: red;
            border: 2px solid red;
            cursor: pointer;
            font-family: Assistant;
            font-size: 20px;
            padding-bottom: 5%;
            border-radius: 10px;
            margin-bottom: 2%;
            transition: 0.3s;
        }

            .clear_button:hover {
                background-color: red;
                border: 2px solid red;
                color: #dddddd;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>טבלת משתמשים</h1>

    

    <table align="center">
        
        
        <%= st %>
    </table>
    <h3>
        <%= msg %>
    </h3>
</asp:Content>
