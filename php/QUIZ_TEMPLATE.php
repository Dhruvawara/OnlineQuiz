<?php

if ($con = mysqli_connect('localhost:3306', 'root', '')) {
    if (!mysqli_select_db($con, 'dbms')) {
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
} else {
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

<div class="uk-section uk-background-secondary uk-light">
    <div class="uk-container uk-container-expand uk-text-center " style=" padding: 0%; border: red;">
        <br>
        <h3 style="margin-top:-4%"> All the best for the Quiz </h3>
        <h5 style="margin-top:1%; border: 1px solid red; padding:2.5%;"> There will be 10 questions, Each question
            carries 1 marks. The answers given by the user will evaluated to 10 marks </h5>
    </div>
    <br>
    <div class="uk-container uk-container-expand" style="background-color: rgb(62, 65, 68)">
        <form action="check.php" method="post">
            <?php
            $i = "A001";
                $sql1 = "SELECT * FROM QUESTIONS WHERE Q_ID = $i ";
                $result1 = mysqli_query($con, $sql1);
                $rows1 = mysqli_fetch_array($result1);
                    ?>
                    <br>
                    <div class="uk-card uk-card-secondary uk-card-body uk-align-center uk-width-xxlarge uk-margin-remove-bottom uk-margin-remove-top">
                        <h3 class="uk-card-title uk-align-left@s uk-align-left@m uk-align-left@l uk-align-left@x1 uk-margin-remove-adjacent uk-padding-remove" id="question">
                            <?php echo $i . " : " . $rows1['QUESTION']; ?></h3>
                        <br><br>
                    </div>
            <input type="SUBMIT" class="uk-button uk-button-primary uk-button-large uk-align-center">
        </form>
    </div>
</div>

</body>
</html>