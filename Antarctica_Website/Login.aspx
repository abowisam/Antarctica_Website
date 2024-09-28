﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Antarctica_Website.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--- head place holder --->
    <title>התחברות</title>
    <style>
        body {
            direction: ltr;
            font-family: Assistant;
            background-image: url("Media/Pictures/bg_pic2.png");
            
            background-position-x: center;
            color: #dddddd;
        }
        td {
            font-size: 20px; 
        }
        input {
            font-size: 19px;
        }
        .msg {
            display: none;
            background-color: Silver;
            font-weight: bold;
            width: 150%;
        }
        .button1 {
            margin:2%;
            background-color: #038857;
            color: white;
            border: 2px solid #038857;
            cursor: pointer;
            font-family: Assistant;
            font-size:20px;
            padding-bottom:1.5%;
            border-radius: 10px;
            margin-bottom: 2%;
            transition: 0.3s;
        }

            .button1:hover {
                background-color: #047a4e;
                border: 2px solid #047a4e;
                color: white;
            }

       
    </style>
    <!--- end of head place holder --->
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!---    body place holder     --->
    <div style="height:450px; width:30%;margin:2.5% auto 1% auto;padding:10px;background-color:rgb(32, 34, 42,95%);border-radius:20px;">
        
    <h1 style="text-align: center;font-size:35px;">Login</h1>
    
    <form method="post" runat="server">
        <table style="margin-left: auto; margin-right:auto; margin-top:0px; direction: ltr;">
            <tr>
                
                <td>
                    <input class="textboxnew" type="text" id="userName" name="userName" placeholder="Username"  /></td>

                
            </tr>
                
            <tr>
                
                <td>
                    <input class="textboxnew" type="password" id="password" name="password" placeholder="Password" /></td>
                
            </tr>

            <tr>
                <td colspan="2" style="text-align: center;">
                    <input class="button1" type="submit" name="submit" value=" Login " />
                    <!--<input type="reset" name="reset" onclick="location.reload();" value=" נקה "/>-->


                </td>
            </tr>


        </table>

    </form>
        
         <%= msg %>
    </div>
   
        
    <!--
     <center>
    < Response.Write(str); >
        </table>
    </center>
    -->
</asp:Content>