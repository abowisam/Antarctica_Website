<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Antarctica_Website.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>דף הבית</title>
    <style>
        hr {
            width: 86%;
        }
        h1 {
            color: #04aa6d;
            text-align:center;
        }
        h2 {
            color: #dddddd;
            text-align: center;
        }
        p {
            margin-left:7%;
            margin-right:7%;
            font-size: 20px;
        }
        img {
            margin-left: auto;
            margin-right: auto;
            width: 30%; 
            border:groove;
            border-width:10px;
        }   
        a {
            color:#dddddd;
        }
        body {
            direction: ltr;
            font-family: Segoe UI,Arial,sans-serif;
            background-image: url("Media/Pictures/bg_pic2.png");
            background-size: cover;
            background-position-x: center;
            color: #dddddd;
        }
        .nav-bar {
            
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    
    <h2 id="capybara">Introduction</h2>

    
    <p>
        Antarctica is Earth's southernmost and least-populated continent. Situated almost entirely south of the Antarctic Circle and surrounded by the Southern Ocean (Antarctic Ocean), it contains the geographic South Pole. Antarctica is the fifth-largest continent, being about 40% larger than Europe, and has an area of 14,200,000 km2. Most of Antarctica is covered by the Antarctic ice sheet, with an average thickness of 1.9 km.
    </p>
    <a style="margin-left: 7%; font-family: Lucida Calligraphy; color:navajowhite; font-size:large;" href="Geography.aspx">Read more..</a>

    <hr />

    <h2 id="arctic_fox">Arctic Fox</h2>
    <img style=" margin-left: 20%;" src="Media/Pictures/arcticfox.jpg" />
    <img style="width:25%;object-fit:cover;margin-left:5px;" src="Media/Pictures/arcticfox1.jpg" />
    <p>
        The Arctic fox (Vulpes lagopus), also known as the white fox, polar fox, or snow fox, is a small fox native to the Arctic regions of the Northern Hemisphere and common throughout the Arctic tundra biome. It is well adapted to living in cold environments, and is best known for its thick, warm fur that is also used as camouflage. It has a large and very fluffy tail. In the wild, most individuals do not live past their first year but some exceptional ones survive up to 11 years. Its body length ranges from 46 to 68 cm (18 to 27 in), with a generally rounded body shape to minimize the escape of body heat.
    </p>
    <a style="margin-left: 7%; font-family: Lucida Calligraphy; color:navajowhite; font-size:large;" href="ArcticFox.aspx">Read more..</a>
    <hr />
    <h2 id="polar_bear">Polar Bear</h2>
    <img style=" margin-left: 20%;margin-right:5px;" src="Media/Pictures/polarbear.jpg" />
    <img src="Media/Pictures/polarbear1-removebg-preview.png" />
    <p>
        The polar bear (Ursus maritimus) is a hypercarnivorous bear whose native range lies largely within the Arctic Circle, encompassing the Arctic Ocean, its surrounding seas and surrounding land masses. It is the largest extant bear species, as well as the largest extant land carnivore. A boar (adult male) weighs around 350–700 kg (770–1,540 lb), while a sow (adult female) is about half that size. Although it is the sister species of the brown bear, it has evolved to occupy a narrower ecological niche, with many body characteristics adapted for cold temperatures, for moving across snow, ice and open water, and for hunting seals, which make up most of its diet. Although most polar bears are born on land, they spend most of their time on the sea ice. Their scientific name means "maritime bear" and derives from this fact. Polar bears hunt their preferred food of seals from the edge of sea ice, often living off fat reserves when no sea ice is present. Because of their dependence on the sea ice, polar bears are classified as marine mammals.
    </p>
    <a style="margin-left: 7%; font-family: Lucida Calligraphy; color:navajowhite; font-size:large;" href="PolarBear.aspx">Read more..</a>
    
    <hr />

    <h2 id="penguin">Penguin</h2>
    <img style=" margin-left: 20%;" src="Media/Pictures/Penguins.jpg" />
    <img style="width:26.7%;margin-left:5px ;" src="Media\Pictures\penguins1.jpg" />
    <p style="direction:ltr;text-align:left;">
        Penguins are a group of aquatic flightless birds from the order Sphenisciformes (/sfɪˈnɪsəfɔːrmiːz/) of the family Spheniscidae (/sfɪˈnɪsɪdiː, -daɪ/). They live almost exclusively in the Southern Hemisphere: only one species, the Galápagos penguin, is found north of the Equator. Highly adapted for life in the ocean water, penguins have countershaded dark and white plumage and flippers for swimming. Most penguins feed on krill, fish, squid and other forms of sea life which they catch with their bills and swallow whole while swimming. A penguin has a spiny tongue and powerful jaws to grip slippery prey.
        <br />
They spend about half of their lives on land and the other half in the sea. The largest living species is the emperor penguin (Aptenodytes forsteri): on average, adults are about 1.1 m (3 ft 7 in) tall and weigh 35 kg (77 lb). The smallest penguin species is the little blue penguin (Eudyptula minor), also known as the fairy penguin, which stands around 30–33 cm (12–13 in) tall and weighs 1.2–1.3 kg (2.6–2.9 lb). Today, larger penguins generally inhabit colder regions, and smaller penguins inhabit regions with temperate or tropical climates. Some prehistoric penguin species were enormous: as tall or heavy as an adult human. There was a great diversity of species in subantarctic regions, and at least one giant species in a region around 2,000 km south of the equator 35 mya, during the Late Eocene, a climate decidedly warmer than today.
    </p>
    <a style="margin-left: 7%; font-family: Lucida Calligraphy; color:navajowhite; font-size:large;" href="Penguin.aspx">Read more..</a>
    <center>
    <a href="#">
    <img  style="border: unset; width: 5%; filter: invert(); " src="Media/Pictures/top arrow.png" /></a></center>


</asp:Content>
