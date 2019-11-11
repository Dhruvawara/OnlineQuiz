<?php

if($con = mysqli_connect('localhost:3306','root',''))
{
    if(!mysqli_select_db($con,'dbms'))
    {
        ?>

        <div uk-alert>
            <a class="uk-alert-close" uk-close></a>
            <h3>Notice:</h3>
            <p>Connection to the Database is not established Database not found <b>:(</b></p>
        </div>

        <script>
            window.stop();
        </script>

        <?php
    }
}
else
{
    ?>
    <div uk-alert>
        <a class="uk-alert-close" uk-close></a>
        <h3>Notice</h3>
        <p>There maybe a problem in your connection to Database Server!!!</p>
    </div>
    <script>
        window.stop();
    </script>
    <?php
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Online Quiz</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/uikit/css/uikit.min.css"/>
    <script src="../js/uikit/uikit.min.js"></script>
    <script src="../js/uikit/uikit-icons.min.js"></script>
    <style>
        .insideup a {
            padding: 30px 10px 30px 10px;
            margin-left: 50%;
        }

        .insideup p {
            margin-left: 50.4%;
            margin-top: -1.5%;
        }

    </style>
</head>
<body bgcolor="#808080">
<nav class="uk-navbar-container uk-dark uk-background-secondary uk-position-top uk-text-center uk-margin uk-navbar">
    <div class="uk-navbar-left">
        <a class="uk-navbar-item uk-logo" href="../HTMl/StartingPage.html">
            <img src="../img/logo.png" width="50" height="40">
        </a>
        <ul class="uk-navbar-nav">
            <li>
                <a href="#">
                    <span class="uk-icon uk-margin-small-right" uk-icon="icon: receiver"></span>
                    Support
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="uk-icon uk-margin-small-right" uk-icon="icon: user"></span>
                    About Us
                </a>
            </li>
        </ul>

    </div>
</nav>



</body>
</html>