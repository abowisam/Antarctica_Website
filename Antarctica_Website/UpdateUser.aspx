<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="Antarctica_Website.UpdateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--- head place holder --->
    <title>SignUp</title>
    <style>
        body {
            direction: ltr;
            font-family: Bahnschrift;
            color: #dddddd;
        }

        .msg {
            display: none;
            background-color: Silver;
            font-weight: bold;
            width: 150%;
        }

        .submit_button {
            background-color: transparent;
            color: #04aa6d;
            border: 2px solid #008CBA;
            cursor: pointer;
            font-family: Assistant;
            font-size: 20px;
            border-radius: 10px;
            margin-bottom: 2%;
            transition: 0.3s;
            padding-bottom: 0.5%;
        }

            .submit_button:hover {
                background-color: #008CBA;
                color: white;
            }

        .clear_button {
            background-color: transparent;
            color: red;
            border: 2px solid red;
            cursor: pointer;
            font-family: Assistant;
            font-size: 20px;
            border-radius: 10px;
            margin-bottom: 2%;
            transition: 0.3s;
            padding-bottom: 0.5%;
        }

            .clear_button:hover {
                background-color: red;
                color: white;
            }
    </style>

    <!--- script --->
    <script> 

        function checkAll() {

            
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var passwordConfirm = document.getElementById("passwordConfirm").value;
            var phone = document.getElementById("phone").value;
            var city = document.getElementById("city").value;

            var counter = 0;
            
            if (checkName(firstName, "mFirstName")) {
                counter++;
            }
            if (checkName(lastName, "mLastName")) {
                counter++;
            }
            if (checkPhone(phone, "mPhone")) {
                counter++;
            }
            if (checkPassword(password, "mPassword", passwordConfirm)) {
                counter++;
            }
            if (checkCity(city, "mCity")) {
                counter++;
            }
            if (counter === 5 && checkEmail(email, "mEmail")) {

                return true;
            } else {
                return false;
            }




        }


        

        function checkName(name, mName) {
            if (name.length < 2) {
                document.getElementById(mName).value = "Name too short";
                document.getElementById(mName).style.display = "inline";
                return false;
            } else {
                document.getElementById(mName).style.display = "none";
                return true;
            }
        }


        // -------- email functions:--------
        function checkEmail(email, mEmail) {
            var size = email.length;
            var msg = "";
            var atIndex = email.indexOf('@');
            var dotIndex = email.indexOf('.', atIndex);

            if (size < 6 || size > 30) {
                msg = "Illegal email length";
            } else if (atIndex < 0) {
                msg = "email address has to contain '@' symbol";
            } else if (atIndex != email.lastIndexOf('@')) {
                msg = "email adress cannot contain more than one '@' symbol";
            } else if (atIndex == 0 || (email.lastIndexOf('@') == size - 1)) {
                msg = "at sign cannot be the first/ last character.";
            } else if (dotIndex == 0 || (email.lastIndexOf('.') == size - 1)) {
                msg = "dot cannot be the first/ last character.";
            } else if (dotIndex - atIndex <= 1) {
                msg = "dot symbol has to be at least 2 characters apart from at sign.";
            } else if (email.indexof('\'') >= 0 || email.indexOf('\"') >= 0) {
                msg = "email cannot contain quotes or double quotes.";
            } else if (hasUnsupportedCharacters(email)) {
                msg = "email has unsupported character(s).";
            }

            if (msg != "") {
                document.getElementById(mEmail).value = msg;
                document.getElementById(mEmail).style.display = "inline";
                return false;
            }
            else {
                document.getElementById(mEmail).style.display = "none";

                return true;
            }
        }

        function hasUnsupportedCharacters(email) {
            for (var i = 0; i < email.length; i++) {
                var char = email[i];

                if (char.charCodeAt(0) > 127) {
                    return true;
                }

                if (char.match(/\s|<|>|,|;|'|"|\\|\[|\]|!|\?|#|\(|\)/)) {
                    return true;
                }
            }

            return false;
        }
        // --------------------------


        


        

        function checkPassword(password, mPassword, passwordConfirm) {
            if (password.length < 6) {
                document.getElementById(mPassword).value = "Password must at least contain six characters";
                document.getElementById(mPassword).style.display = "inline";
                return false;
            } else {
                document.getElementById(mPassword).style.display = "none";
            }

            if (password !== passwordConfirm) {
                document.getElementById(mPassword).value = "The passwords are not the same";
                document.getElementById(mPassword).style.display = "inline";
                return false;
            } else {
                document.getElementById(mPassword).style.display = "none";
            }

            return true;
        }


        function checkPhone(phone, mPhone) {
            if (phone.length !== 7) {
                document.getElementById(mPhone).value = "Illegal phone number";
                document.getElementById(mPhone).style.display = "inline";
                return false;
            } else {
                document.getElementById(mPhone).style.display = "none";
                return true;

            }
        }

        function checkCity(city, mCity) {
            if (city == "other") {
                document.getElementById(mCity).value = "You have to choose a city";
                document.getElementById(mCity).style.display = "inline";
                return false;
            } else {
                document.getElementById(mCity).style.display = "none";
                return true;
            }
        }
    </script>
    <!--- end of script --->
    <!--- end of head place holder --->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!---    body place holder     --->

    <h1 style="text-align: center;">Update Your Personal Information</h1>
    <form method="post" runat="server" onsubmit="return checkAll();">
        <table style="margin: 0px auto; direction: ltr;">
            <tr>
                <td>Username</td>
                <td colspan="2">
                    <input class="textbox" type="text" id="userName" name="userName" disabled="disabled" value="<%=uName %>" /></td>

                
            </tr>


            <tr>
                <td>First Name</td>
                <td>
                    <input class="textbox" type="text" id="firstName" name="firstName" value="<%=fName %>" /></td>
                <td>
                    <input type="text" id="mFirstName" class="msg" disabled="disabled" />
                </td>
            </tr>

            <tr>
                <td>Last Name</td>
                <td>
                    <input class="textbox" type="text" id="lastName" name="lastName" value="<%=lName %>" /></td>
                <td>
                    <input type="text" id="mLastName" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Email address</td>
                <td>
                    <input class="textbox" type="email" id="email" name="email" style="width:35%" value="<%=email %>" /></td>
                <td>
                    <input  type="text" id="mEmail" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <% if (gender == "male")
                        { %>
                    <input type="radio" value="male" id="male" name="gender" checked />Male
                    <input type="radio" value="female" id="female" name="gender" />Female
                    <% }
                        else
                        {  %>
                    <input type="radio" value="male" id="male" name="gender" />Male
                    <input type="radio" value="female" id="female" name="gender" checked />Female
                    <% } %>
                </td>

                <td>
                    <input type="text" id="mGender" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Birth Year</td>
                <td>
                    <select class="textbox" name="birthYear" id="birthYear">

                        <%= yearList %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Phone Number
                </td>
                <td dir="ltr"  style="justify-content: start; display: flex;">
                    <select class="textbox" name="prefix" id="prefix">
                        <% if (prefix == "050")
                            { %>
                        <option value="050" selected>050</option>
                        <% } else { %>
                        <option value="050">050</option>
                        <% } %>

                        <% if (prefix == "052")
                            { %>
                        <option value="052" selected>052</option>
                        <% } else { %>
                        <option value="052">052</option>
                        <% } %>

                        <% if (prefix == "053")
                            { %>
                        <option value="053" selected>053</option>
                        <% } else { %>
                        <option value="053">053</option>
                        <% } %>

                        <% if (prefix == "054")
                            { %>
                        <option value="054" selected>054</option>
                        <% } else { %>
                        <option value="054">054</option>
                        <% } %>

                        <% if (prefix == "055")
                            { %>
                        <option value="055" selected>055</option>
                        <% } else { %>
                        <option value="055">055</option>
                        <% } %>

                        <% if (prefix == "056")
                            { %>
                        <option value="056" selected>056</option>
                        <% } else { %>
                        <option value="056">056</option>
                        <% } %>

                       <% if (prefix == "057")
                            { %>
                        <option value="057" selected>057</option>
                        <% } else { %>
                        <option value="057">057</option>
                        <% } %>
                        
                        <% if (prefix == "058")
                            { %>
                        <option value="058" selected>058</option>
                        <% } else { %>
                        <option value="058">058</option>
                        <% } %>

                        <% if (prefix == "059")
                            { %>
                        <option value="059" selected>059</option>
                        <% } else { %>
                        <option value="059">059</option>
                        <% } %>
                        
                        <% if (prefix == "077")
                            { %>
                        <option value="077" selected>077</option>
                        <% } else { %>
                        <option value="077">077</option>
                        <% } %>

                        
                    </select>&nbsp; - &nbsp;
                    <input class="textbox" type="text" id="phone" name="phone" size="10" value="<%=phone %>" />
                </td>
                <td>
                    <input type="text" id="mPhone" class="msg" disabled="disabled" />
                </td>

            </tr>
            
                
            <tr>
                <td>Hobbies</td>
                <td>
                    <% if (hob1 == "T")
                        { %>
                    <input type="checkbox" name="hobby" value="1" checked="checked" /><label>Programming</label>
                    <% } else { %>
                    <input type="checkbox" name="hobby" value="1" /><label>Programming</label>
                    <% } %>

                    <% if (hob2 == "T")
                        { %>
                    <input type="checkbox" value="2" name="hobby" checked="checked" /><label>Swimming</label>
                    <% } else { %>
                    <input type="checkbox" value="2" name="hobby" /><label>Swimming</label>
                    <% } %>

                    <% if (hob3 == "T")
                        { %>
                    <input type="checkbox" value="3" name="hobby"  checked="checked"/><label>Basketball</label>
                    <% } else { %>
                    <input type="checkbox" value="3" name="hobby" /><label>Basketball</label>
                    <% } %>

                    <% if (hob4 == "T")
                        { %>
                    <input type="checkbox" value="4" name="hobby"  checked="checked"/><label>Karate</label>
                    <% } else { %>
                    <input type="checkbox" value="4" name="hobby" /><label>Karate</label>
                    <% } %>
                    
                    <% if (hob5 == "T")
                        { %>
                    <input type="checkbox" value="5" name="hobby"  checked="checked"/><label>Baseball</label>
                    <% } else { %>
                    <input type="checkbox" value="5" name="hobby" /><label>Baseball</label>
                    <% } %>

                    

                </td>

            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <input class="textbox" type="password" id="password" name="password" value="<%= pw %>" /></td>
                <td>
                    <input type="text" id="mPassword" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <input class="textbox" type="password" id="passwordConfirm" name="passwordConfirm" value="<%= pw %>" /></td>
                <td>
                    <input type="text" id="mPasswordConfirm" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input class="submit_button" type="submit" name="submit" value=" Update " />
                    <input class="clear_button" type="reset" name="reset" onclick="location.reload();" value=" Clear " />


                </td>
            </tr>


        </table>


    </form>




    <h3><%= sqlUpdate %></h3>
    <h3><%= msg %></h3>

</asp:Content>
