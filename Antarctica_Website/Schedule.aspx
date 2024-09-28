<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Antarctica_Website.Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>מערכת שעות</title>
    <style>
        .main {
            background-color: #dddddd;
            direction: rtl;
        }

        body {
            font-family: 'Segoe UI','David', 'Traditional Arabic';
        }

        table {
            margin: 0px auto;
            border-collapse: collapse;
        }

        td, th {
            border: solid 2px;
            width: 145px;
            height: 20px;
            text-align: center;
        }

        h1 {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .lesson_num {
            width: 25px;
            background-color: silver;
            font-family: David;
            font-size: 25px;
            font-weight: 900;
        }

        .physics {
            background-color: plum;
        }

        .math {
            background-color: limegreen;
        }

        .arabic {
            background-color: red;
            color: white;
            border-color: black;
        }

        .md3e {
            background-color: yellow;
        }

        .english {
            background-color: deepskyblue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>מערכת שעות י3</h1>
    <h2>טבלה לא מעוצבת:</h2>
    <table>
        <tr>
            <th></th>
            <th>ראשון</th>
            <th>שני</th>
            <th>שלישי</th>
            <th>רביעי</th>
            <th>חמישי</th>



        </tr>
        <tr>
            <td>1</td>
            <td>פיזיקה</td>
            <td>Web Development</td>
            <td>עברית</td>
            <td>מתמטיקה</td>
            <td>English</td>

        </tr>
        <tr>
            <td>2</td>
            <td>פיזיקה</td>
            <td>Web Development</td>
            <td>אזרחות</td>
            <td>השכלה כללית</td>
            <td>English</td>


        </tr>
        <tr>
            <td>3</td>
            <td>Java</td>
            <td>חינוך גופני</td>
            <td>English</td>
            <td>Java</td>
            <td>חינוך</td>


        </tr>
        <tr>
            <td>4</td>
            <td>Java</td>
            <td>Java</td>
            <td>English</td>
            <td>Java</td>
            <td>דת האסלים</td>


        </tr>
        <tr>
            <td>5</td>
            <td>ספרות ערבית</td>
            <td>Java</td>
            <td>מתמטיקה</td>
            <td>עברית</td>
            <td>מתמטיקה</td>


        </tr>
        <tr>
            <td>6</td>
            <td>הסטוריה</td>
            <td>השכלה כללית</td>
            <td>מתמטיקה</td>
            <td>עברית</td>
            <td>אזרחות</td>

        </tr>
        <tr>
            <td>7</td>
            <td>הסטוריה</td>
            <td>מתמטיקה</td>
            <td>חינוך גופני</td>
            <td>English</td>
            <td>חינוך תעבורתי</td>

        </tr>
        <tr>
            <td>8</td>
            <td>Java</td>
            <td>אזרחות</td>
            <td>לשון ערבית</td>
            <td>פיזיקה</td>
            <td>הסטוריה</td>

        </tr>
        <tr>
            <td>9</td>
            <td>Java</td>
            <td>ספרות ערבית</td>
            <td></td>
            <td>פיזיקה</td>
            <td></td>
        </tr>
    </table>
    <h2>טבלה מעוצבת:</h2>




    <table>
        <tr style="font-family: David; font-size: 30px; background-color: silver">
            <th class="lesson_num"></th>
            <th>ראשון</th>
            <th>שני</th>
            <th>שלישי</th>
            <th>רביעי</th>
            <th>חמישי</th>



        </tr>
        <tr>
            <td class="lesson_num">1</td>
            <td rowspan="2" class="physics">פיזיקה</td>
            <td rowspan="2" class="md3e">Web Development</td>
            <td>עברית</td>
            <td class="math">מתמטיקה</td>
            <td rowspan="2" class="english">English</td>


        </tr>
        <tr>
            <td class="lesson_num">2</td>
            <td>אזרחות</td>
            <td>השכלה כללית</td>


        </tr>
        <tr>
            <td class="lesson_num">3</td>
            <td rowspan="2" class="md3e">Java</td>
            <td>חינוך גופני</td>
            <td rowspan="2" class="english">English</td>
            <td rowspan="2" class="md3e">Java</td>
            <td>חינוך</td>


        </tr>
        <tr>
            <td class="lesson_num">4</td>
            <td rowspan="2" class="md3e">Java</td>
            <td>דת האסלים</td>


        </tr>
        <tr>
            <td class="lesson_num">5</td>
            <td class="arabic">ספרות ערבית</td>
            <td rowspan="2" class="math">מתמטיקה</td>
            <td rowspan="2">עברית</td>
            <td class="math">מתמטיקה</td>


        </tr>
        <tr>
            <td class="lesson_num">6</td>
            <td rowspan="2">הסטוריה</td>
            <td>השכלה כללית</td>
            <td>אזרחות</td>


        </tr>
        <tr>
            <td class="lesson_num">7</td>
            <td class="math">מתמטיקה</td>
            <td>חינוך גופני</td>
            <td class="english">English</td>
            <td>חינוך תעבורתי</td>


        </tr>
        <tr>
            <td class="lesson_num">8</td>
            <td rowspan="2" class="md3e">Java</td>
            <td>אזרחות</td>
            <td class="arabic">לשון ערבית</td>
            <td rowspan="2" class="physics">פיזיקה</td>
            <td>הסטוריה</td>


        </tr>
        <tr>
            <td class="lesson_num">9</td>
            <td class="arabic">ספרות ערבית</td>
            <td></td>
            <td></td>


        </tr>
    </table>

</asp:Content>
