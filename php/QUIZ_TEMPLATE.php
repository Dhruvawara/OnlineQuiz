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
<html>
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

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

    </style>
</head>
<body>
<nav class="uk-navbar-container uk-dark uk-background-secondary uk-position-top uk-text-center uk-margin uk-navbar">
    <div class="uk-navbar-center">
        <a class="uk-navbar-item uk-logo" href="../HTML/StartingPage.html">
            <h3 class="uk-text-muted">Online<br>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Quiz</h3>
        </a>
    </div>

</nav>

<div class="uk-section uk-background-secondary uk-light">
    <div class="uk-container uk-container-expand uk-text-center " style=" padding: 0; border: red;">
        <br>
        <h3 style="margin-top:-4%"> All the best for the Quiz </h3>
        <h5 style="margin-top:1%; border: 1px solid red; padding:2.5%;"> There will be 10 questions, Each question
            carries 1 marks. The answers given by the user will evaluated to 10 marks </h5>
    </div>
    <br>
    <div class="uk-container uk-container-expand" style="background-color: rgb(62, 65, 68)">
        <form action="check.php" method="post">
            <?php

            $result = mysqli_query($con, "call quiz_types();");
            $idquizs = array();
            $i = 0;
            while ($row = mysqli_fetch_assoc($result)) {
                $idquizs[$i] = $row['idQUIZ'];
                $i++;
            }

            $quizi = array_rand($idquizs, 1);
            $quizid = trim((string)$idquizs[$quizi]);

            $con = mysqli_connect('localhost:3306', 'root', '','dbms');
            $result = mysqli_query($con, "SELECT * FROM QUESTIONS where Q_ID like '$quizid%'") or die("ZZZZ");
            ?>
            <br>
            <div class="uk-card uk-card-secondary uk-card-body uk-align-center uk-width-xxlarge uk-margin-remove-bottom uk-margin-remove-top">
                <h4 class="uk-card-title uk-align-left@s uk-align-left@m uk-align-left@l uk-align-left@x1 uk-margin-remove-adjacent uk-padding-remove">

                    <?php
                    $i = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo substr($row['Q_ID'], -2) . ". " . $row['QUESTION'];
                        echo "<fieldset name='" . substr($row['Q_ID'], -4) . "'>";
                        echo "<input type=\"radio\" value=\"A\"  name='" . substr($row['Q_ID'], -4) . "' >" . $row['optionA'];
                        echo "<br><input type=\"radio\" value=\"B\" name='" . substr($row['Q_ID'], -4) . "'>" . $row['optionB'];
                        echo "<br><input type=\"radio\" value=\"C\" name='" . substr($row['Q_ID'], -4) . "'>" . $row['optionC'] . "</fieldset><br><br>";
                        $i++;
                    }
                    ?>
                </h4>
                <br><br>

                <br><br>
                <?php
                $user_id= $_POST['user_id'];
                echo " <input value=\"$quizid\" id=\"type\" type=\"hidden\" name='type'>";
                echo " <input value=\"$user_id\" id=\"user_id\" type=\"hidden\" name='user_id'>";
                mysqli_close($con);
                ?>





            </div>

            <input type="SUBMIT" class="uk-button uk-button-primary uk-button-large uk-align-center" value="SUBMIT">
        </form>
    </div>
</div>

</body>
</html>