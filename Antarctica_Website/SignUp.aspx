<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Antarctica_Website.Forms" %>


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

            var userName = document.getElementById("userName").value;
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var gender = document.getElementsByName("gender");
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var passwordConfirm = document.getElementById("passwordConfirm").value;
            var phone = document.getElementById("phone").value;
            var city = document.getElementById("city").value;

            var counter = 0;
            if ((checkUserName(userName, "mUserName"))) {
                counter++;
            }
            if (checkName(firstName, "mFirstName")) {
                counter++;
            }
            if (checkName(lastName, "mLastName")) {
                counter++;
            }
            if (checkRadioButton(gender, "mGender")) {
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
            if (counter === 7 && checkEmail(email, "mEmail")) {

                return true;
            } else {
                return false;
            }




        }


        function checkUserName(name, mName) {
            if (name.length < 2) {
                document.getElementById(mName).value = "Username too short";
                document.getElementById(mName).style.display = "inline";
                return false;
            } else {
                document.getElementById(mName).style.display = "none";
                return true;
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


        function checkRadioButton(name, mGender) {
            if (!name[0].checked && !name[1].checked) {
                document.getElementById(mGender).value = "Choose a gender";
                document.getElementById(mGender).style.display = "inline";
                return false;
            } else {
                document.getElementById(mGender).style.display = "none";
                return true;

            }


        }

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

    <h1 style="text-align: center;">Registration Form</h1>
    <form method="post" runat="server" onsubmit="return checkAll();">
        <table style="margin: 0px auto; direction: ltr;">
            <tr>
                <td>Username</td>
                <td>
                    <input class="textbox"  type="text" id="userName" name="userName" /></td>

                <td>
                    <input type="text" id="mUserName" class="msg" disabled="disabled" />
                </td>
            </tr>


            <tr>
                <td>First Name</td>
                <td>
                    <input class="textbox"  type="text" id="firstName" name="firstName" /></td>
                <td>
                    <input type="text" id="mFirstName" class="msg" disabled="disabled" />
                </td>
            </tr>

            <tr>
                <td>Last Name</td>
                <td>
                    <input class="textbox"  type="text" id="lastName" name="lastName" /></td>
                <td>
                    <input type="text" id="mLastName" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Email address</td>
                <td>
                    <input  class="textbox" type="email" id="email" name="email" /></td>
                <td>
                    <input type="text" id="mEmail" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input class="check" type="radio" value="male" id="male" name="gender" />Male
                    <input type="radio" value="female" id="female" name="gender" />Female
                    

                </td>

                <td>
                    <input  type="text" id="mGender" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Birth Year</td>
                <td>
                    <select class="textbox"  name="birthYear" id="birthYear">

                        <% Response.Write(birthYearStr); %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Phone Number
                </td>
                <td dir="ltr" style="justify-content: start; display: flex;">
                    <select class="textbox"  name="prefix" id="prefix">
                        <option value="050">050</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="056">056</option>
                        <option value="057">057</option>
                        <option value="058">058</option>
                        <option value="059">059</option>
                        <option value="077">077</option>
                    </select>&nbsp; - &nbsp;
                    <input class="textbox"  type="text" id="phone" name="phone" size="10" />
                </td>
                <td>
                    <input type="text" id="mPhone" class="msg" disabled="disabled" />
                </td>

            </tr>
            <tr>
                <td>Place of Residence
                </td>
                <td>
                    <select class="textbox"  name="city" id="city" dir="rtl">
                        <option value="other">&nbsp;&nbsp;&nbsp;--- Choose a city    ---&nbsp;&nbsp;&nbsp;</option>
                        <option value="אום אל פחם">אום אל פחם</option>
                        <option value="אום אל-קטף">אום אל-קטף</option>
                        <option value="אשקלון">אשקלון</option>
                        <option value="באקה אל גרביה">באקה אל גרביה</option>
                        <option value="באר שבע">באר שבע</option>
                        <option value="בנימינה">בנימינה</option>
                        <option value="בסמה">בסמה</option>
                        <option value="גן שמואל">גן שמואל</option>
                        <option value="גת">ג'ת</option>
                        <option value="דבוריה">דבוריה</option>
                        <option value="חדרה">חדרה</option>
                        <option value="חולון">חולון</option>
                        <option value="חיפה">חיפה</option>
                        <option value="כפר קרע">כפר קרע</option>
                        <option value="מודיעין">מודיעין</option>
                        <option value="מיסר">מיסר</option>
                        <option value="נהריה">נהריה</option>
                        <option value="נצרת">נצרת</option>
                        <option value="נתניה">נתניה</option>
                        <option value="עארה">עארה</option>
                        <option value="עראבה">עראבה</option>
                        <option value="ערערה">ערערה</option>
                        <option value="פרדס חנה">פרדס חנה - כרכור</option>
                        <option value="ראש העין">ראש העין</option>
                        <option value="רחובות">רחובות</option>
                        <option value="סחנין">סח'נין</option>
                        <option value="עתלית">עתלית</option>
                        <option value="זמר">זמר</option>
                        <option value="קריית ים">קריית ים</option>
                        <option value="קריית שמונה">קריית שמונה</option>
                        <option value="ראמה">ראמה</option>
                        <option value="ראשון לציון">ראשון לציון</option>

                    </select>

                </td>
                <td>
                    <input type="text" id="mCity" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Hobbies</td>
                <td>
                    <input type="checkbox" name="hobby" value="1" /><label>Programming</label>
                    <input type="checkbox" value="2" name="hobby" /><label>Swimming</label>
                    <input type="checkbox" value="3" name="hobby" /><label>Basketball</label>
                    <input type="checkbox" value="4" name="hobby" /><label>Karate</label>
                    <input type="checkbox" value="5" name="hobby" /><label>Baseball</label>

                </td>

            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <input class="textbox"  type="password" id="password" name="password" /></td>
                <td>
                    <input type="text" id="mPassword" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <input class="textbox"  type="password" id="passwordConfirm" name="passwordConfirm" /></td>
                <td>
                    <input type="text" id="mPasswordConfirm" class="msg" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input class="submit_button" type="submit" name="submit" value=" Send " />
                    <input class="clear_button" type="reset" name="reset" onclick="location.reload();" value=" Clear " />


                </td>
            </tr>


        </table>

    </form>
    <!--
     <center>
    < Response.Write(str); >
        </table>
    </center>
    -->
</asp:Content>
