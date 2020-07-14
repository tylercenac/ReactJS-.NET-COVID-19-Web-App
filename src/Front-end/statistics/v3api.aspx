<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="v3api.aspx.cs" Inherits="Ibm.Br.Cic.Internship.Covid.Fe.statistics.v3api" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IBM Code Blue - Statistics by COVID-19 API</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" type="image/jpg" href="/codeblue.jpg" />
    <link rel="stylesheet" href="../css/main.css" />
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        }

        #chartdiv {
            height: 500px;
        }

        thead th {
            text-align: left;
            background: #005fbb;
            color: white
        }

        h2 {
            color: #005fbb;
            font-size: 60px;
            font-weight: 900;
            text-align: center;
        }

        button {
            background-color: #005fbb;
            color: white;
            font-size: 15px;
            width: 70%;
        }

        .sortBy {
            width: 100%;
            margin-top: 10px;
            margin-bottom: 25px;
            font-size: 25px;
        }

        .dropbtn {
            background-color: #005fbb;
            width: 300px;
            color: white;
            padding: 16px;
            font-size: 35px;
            font-weight: 900;
            border: none;
        }

        .submitbtn {
            background-color: #005fbb;
            color: white;
            font-size: 20px;
            margin-left: 25%;
            width: 50%;
        }

        .continentbtn {
            background-color: #005fbb;
            color: white;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-content a:hover {
                    background-color: #ddd;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #005fbb;
        }


        .option {
            font-size: 25px;
        }

        .horizontal-center{
            margin-left: 5%;
            width: 90%;
        }


    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-default">
            <div class="container">
                <img src="../codeblue.jpg" alt="Code Blue" class="brand-logo" />
                <h1>Code Blue Against C19</h1>
                <div class="dropdown">
                    <button type="button" class="btn btn-primary dropbtn">Resources</button>
                    <div class="dropdown-content">
                        <a href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public">World Health Organization</a>
                        <a href="https://www.cdc.gov/coronavirus/2019-ncov/index.html">Center for Disease Control</a>
                        <a href="https://www.osha.gov/SLTC/covid-19/controlprevention.html">Occupational Safety and Health Administration</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-2">
                <h2>Sort By:</h2>
                <select class="sortBy" id="sortby">
                    <option class="option" value=""></option>
                    <option class="option" value="totalConfirmed">Total Confirmed</option>
                    <option class="option" value="newConfirmed">New Confirmed</option>
                    <option class="option" value="totalDeaths">Total Deaths</option>
                    <option class="option" value="newDeaths">New Deaths</option>
                    <option class="option" value="totalRecovered">Total Recovered</option>
                    <option class="option" value="newRecovered">New Recovered</option>
                </select>
                <div class="btn-group-vertical horizontal-center py-5">
                        <input type="button" class="btn btn-primary continentbtn" value="Europe" onclick="rotateTo(0, -20);" />
                        <input type="button" class="btn btn-primary continentbtn" value="Americas" onclick="rotateTo(90, -20);" />
                        <input type="button" class="btn btn-primary continentbtn" value="Asia" onclick="rotateTo(-90, -20);" />
                        <input type="button" class="btn btn-primary continentbtn" value="Australia" onclick="rotateTo(-130, 40);" />
                    </div>
            </div>
            <div class="col-lg-10">
                <div id="chartdiv" />
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div id="tablediv" />
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/maps.js"></script>
    <script src="https://www.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="../js/v3api.js"></script>
    <!-- This is how you link this file with the js file -->
</body>
</html>