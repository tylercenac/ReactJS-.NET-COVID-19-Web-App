// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4maps.MapChart);

// Set map definition
chart.geodata = am4geodata_worldLow;


// Set projection
chart.projection = new am4maps.projections.Orthographic();
chart.panBehavior = "rotateLongLat";
chart.deltaLatitude = -20;
chart.padding(20, 20, 20, 20);


// Create map polygon series
var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

// Make map load polygon (like country names) data from GeoJSON
polygonSeries.useGeodata = true;

// Configure series
var polygonTemplate = polygonSeries.mapPolygons.template;
polygonTemplate.tooltipText = "{name}";
polygonTemplate.fill = am4core.color("#005fbb");
polygonTemplate.stroke = am4core.color("#005fbb");
polygonTemplate.strokeWidth = 0.5;

polygonTemplate.propertyFields.fill = "fill";

var graticuleSeries = chart.series.push(new am4maps.GraticuleSeries());
graticuleSeries.mapLines.template.line.stroke = am4core.color("#ffffff");
graticuleSeries.mapLines.template.line.strokeOpacity = 0.08;
graticuleSeries.fitExtent = false;

// Water
chart.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color("lightblue");
chart.backgroundSeries.mapPolygons.template.polygon.fillOpacity = 1;

// Create hover state and set alternative fill color
var hs = polygonTemplate.states.create("hover");
hs.properties.fill = chart.colors.getIndex(0).brighten(-0.5);

// Rotation function
var animation;
function rotateTo(long, lat) {
    if (animation) {
        animation.stop();
    }
    animation = chart.animate([{
        property: "deltaLongitude",
        to: long
    }, {
        property: "deltaLatitude",
        to: lat
    }], 2000);

}

let colorSet = new am4core.ColorSet();

document.getElementById("sortby").onchange = function () {

    fetch("https://localhost:44361/api/v2/c19api")
        .then(response => response.json())
        .then(res => {

            const MAX = 185;

            let colors = [];

            let tableData = "<table class='table'>";
            tableData += "<thead>";
            tableData += "<tr>";
            tableData += "<th width='5%'>Rank</th>";
            tableData += "<th width='10%'>Color</th>";
            tableData += "<th width='50%'>Country</th>";
            tableData += "<th>Cases</th>";
            tableData += "</tr>";
            tableData += "</thead>";

            switch (document.getElementById("sortby").value) {

                case "totalConfirmed":
                    res.countries.sort((a, b) => parseFloat(b.totalConfirmed) - parseFloat(a.totalConfirmed));
                    break;
                case "newConfirmed":
                    res.countries.sort((a, b) => parseFloat(b.newConfirmed) - parseFloat(a.newConfirmed));
                    break;
                case "totalDeaths":
                    res.countries.sort((a, b) => parseFloat(b.totalDeaths) - parseFloat(a.totalDeaths));
                    break;
                case "newDeaths":
                    res.countries.sort((a, b) => parseFloat(b.newDeaths) - parseFloat(a.newDeaths));
                    break;
                case "totalRecovered":
                    res.countries.sort((a, b) => parseFloat(b.totalRecovered) - parseFloat(a.totalRecovered));
                    break;
                case "newRecovered":
                    res.countries.sort((a, b) => parseFloat(b.newRecovered) - parseFloat(a.newRecovered));
                    break;
                default:
                    res.countries.sort((a, b) => parseFloat(b.newConfirmed) - parseFloat(a.newConfirmed));
                    break;
            }

            res.countries.forEach(function (item, index) {

                if (index >= MAX)
                    return;

                let color = "darkred";
                if (index < 5)
                    color = "darkred";
                if (index >= 5 && index < 20)
                    color = "#ff1f00";
                if (index >= 20 && index < 50)
                    color = "#ff8500";
                if (index >= 50 && index < 80)
                    color = "#ffd100";
                if (index >= 80 && index < 110)
                    color = "#f8ff00";
                if (index >= 110 && index < 140)
                    color = "#19ff00";
                if (index >= 140)
                    color = "green";
                
                let colorData = {
                    id: item.countryCode,
                    name: item.countryName,
                    value: 100,
                    fill: am4core.color(color)
                }

                tableData += "<tbody>";
                tableData += "<tr>";
                tableData += "<td>" + (index + 1) + "</td>";

                switch (color) {
                    case "darkred":
                        tableData += "<td>Dark Red</td>";
                        break;
                    case "#ff1f00":
                        tableData += "<td>Red</td>";
                        break;
                    case "#ff8500":
                        tableData += "<td>Orange</td>";
                        break;
                    case "#ffd100":
                        tableData += "<td>Yellow-Orange</td>";
                        break;
                    case "#f8ff00":
                        tableData += "<td>Yellow</td>";
                        break;
                    case "#19ff00":
                        tableData += "<td>Light Green</td>";
                        break;
                    case "green":
                        tableData += "<td>Green</td>";
                        break;
                    default:
                        break;
                }
                
                tableData += "<td>" + item.countryName + "</td>";
                switch (document.getElementById("sortby").value) {

                    case "totalConfirmed":
                        tableData += "<td>" + item.totalConfirmed + "</td>";
                        break;
                    case "newConfirmed":
                        tableData += "<td>" + item.newConfirmed + "</td>";
                        break;
                    case "totalDeaths":
                        tableData += "<td>" + item.totalDeaths + "</td>";
                        break;
                    case "newDeaths":
                        tableData += "<td>" + item.newDeaths + "</td>";
                        break;
                    case "totalRecovered":
                        tableData += "<td>" + item.totalRecovered + "</td>";
                        break;
                    case "newRecovered":
                        tableData += "<td>" + item.newRecovered + "</td>";
                        break;
                    default:
                        tableData += "<td>" + item.totalConfirmed + "</td>";
                        break;
                }

                tableData += "<tr>";
                tableData += "</tbody>";

                colors.push(colorData);
            });

            tableData += "</table>";

            document.getElementById("tablediv").innerHTML = tableData;
            polygonSeries.data = colors;
        })
        .catch(function (error) {
            console.log("error", error);
        });

}
