<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Ibm.Br.Cic.Internship.Covid.Fe.Index" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Code Blue - cic2020interns_wk4</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet" />
    <link rel="shortcut icon" type="image/jpg" href="/codeblue.jpg" />
    <link rel="stylesheet" href="css/main.css" />

</head>
<body>
    <header>
        <nav class="navbar navbar-default">
            <div class="container">
                <img src="codeblue.jpg" alt="Code Blue" class="brand-logo" />
                <h1>Code Blue Against C19</h1>
            </div>
        </nav>
    </header>
    <section class="row filler">
        <div class="container">
            <div class="col-md-12 p-2 banner">
                <h2>Code Blue Against C19 is a group of cross-dev tech enthusiasts that builds full stack e2e solutions to address the most demanding requests of those affected by COVID-19.</h2>
            </div>
            <div class="col-md-12 p-3">
                <div class="row py-3">
                    <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='https://localhost:44371/statistics/apify.aspx'">API v1</button>
                    <div class="ml-2 mt-2"> - This API uses data from www.Apify.com</div>
                </div>
                <div class="row py-3">
                    <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='https://localhost:44371/statistics/covid19api.aspx'">API v2</button>
                    <div class="ml-2 mt-2"> - This API uses data from www.Covid19Api.com</div>
                </div>
                <div class="row py-3">
                    <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='https://localhost:44371/statistics/v3api.aspx'">API v3</button>
                    <div class="ml-2 mt-2"> - This API uses data from www.Covid19Api.com</div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>

