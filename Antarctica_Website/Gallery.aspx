<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Antarctica_Website.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gallery</title>
    <style>
        h1 {
            font-size: 35px;
        }

        body {
            direction: ltr;
            font-family: Segoe UI,Arial,sans-serif;
            color: #dddddd;
        }

        .bigPicImg {
            width: 375px;
            height: 255px;
            border: 1px solid gray;
            overflow: hidden;
            object-fit: cover;
        }
        
        .imgCell {
            width: 180px;
            height: 120px;
            border: 1px solid gray;
            overflow: hidden;
            object-fit: fill;
            margin: 0px auto;
        }
        .tdCell {
            width: 180px;
            height: 120px;
            
            
        }
    </style>
    <script>
        function picShow(picSrc) {
            bigPic.src = picSrc;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table style="margin: 0px auto;">
        <!--- 1 --->
        <tr>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g1.png" onmouseover="picShow('Media/GalleryPics/g1.png')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g2.jpg" onmouseover="picShow('Media/GalleryPics/g2.jpg')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g3.jpg" onmouseover="picShow('Media/GalleryPics/g3.jpg')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g4.jpg" onmouseover="picShow('Media/GalleryPics/g4.jpg')" />
            </td>
        </tr>

        <!--- 2 --->
        <tr>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g5.jpg" onmouseover="picShow('Media/GalleryPics/g5.jpg')" />
            </td>

            <td colspan="2" rowspan="2">
                <img class="bigPicImg" id="bigPic" src="Media/Pictures/bg_pic2.jpg" />
            </td>

            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g6.png" onmouseover="picShow('Media/GalleryPics/g6.png')" />
            </td>
        </tr>

        <!--- 3 --->
        <tr>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g7.jpg" onmouseover="picShow('Media/GalleryPics/g7.jpg')" />
            </td>



            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g8.jpg" onmouseover="picShow('Media/GalleryPics/g8.jpg')" />
            </td>
        </tr>



        <tr>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g9.jpg" onmouseover="picShow('Media/GalleryPics/g9.jpg')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g10.jpg" onmouseover="picShow('Media/GalleryPics/g10.jpg')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g11.jpg" onmouseover="picShow('Media/GalleryPics/g11.jpg')" />
            </td>
            <td class="tdCell">
                <img class="imgCell" src="Media/GalleryPics/g12.jpg" onmouseover="picShow('Media/GalleryPics/g12.jpg')" />
            </td>
        </tr>
    </table>
</asp:Content>
