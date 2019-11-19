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
        <h5 style="margin-top:1%; border: 1px solid red; padding:2.5%;"> RESULT </h5>
    </div>
    <br>
    <br>
    <div class="uk-card uk-card-secondary uk-card-body uk-align-center uk-width-xxlarge uk-margin-remove-bottom uk-margin-remove-top">
        <h4 class="uk-card-title uk-align-left@s uk-align-left@m uk-align-left@l uk-align-left@x1 uk-margin-remove-adjacent uk-padding-remove">
            <?php

            $quizid = $_POST["type"];
            $Temp = $quizid . "001";
            $Answered[0] = $_POST[$Temp];
            $Temp = $quizid . "002";
            $Answered[1] = $_POST[$Temp];
            $Temp = $quizid . "003";
            $Answered[2] = $_POST[$Temp];
            $Temp = $quizid . "004";
            $Answered[3] = $_POST[$Temp];
            $Temp = $quizid . "005";
            $Answered[4] = $_POST[$Temp];
            $Temp = $quizid . "006";
            $Answered[5] = $_POST[$Temp];
            $Temp = $quizid . "007";
            $Answered[6] = $_POST[$Temp];
            $Temp = $quizid . "008";
            $Answered[7] = $_POST[$Temp];
            $Temp = $quizid . "009";
            $Answered[8] = $_POST[$Temp];
            $Temp = $quizid . "010";
            $Answered[9] = $_POST[$Temp];
            $subid = array("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10");
            unset($Temp);

            $ids = array();
            for ($i = 0; $i < 10; $i++) {
                $ids[$i] = $quizid . "0" . $subid[$i];
            }

            $UserName = $_POST["USERNAME"];

            $result = mysqli_query($con, "SELECT * FROM answers where Q_ID LIKE '" . $quizid . "%'");

            $i = 0;
            while ($row = mysqli_fetch_assoc($result)) {
                $AnsTemp[$i] = $row['Q_ANSWER'];
                $i++;
            }
            GLOBAL $AnsTemp;
            $Ans = array_values($AnsTemp);
            ?>
            <table width="100%" style="border-color: #e6f5ff; border-width: thick">
                <tr>
                    <th>QUESTION NUMBER</th>
                    <th>SELECTED ANSWER</th>
                    <th>CORRECT ANSWER</th>
                </tr>
                <?php
                $sum = 0;
                for ($i = 0; $i < sizeof($Answered); $i++) {
                    echo "<tr style='text-align: center'><td>" . ++$i . "</td>";
                    $i--;
                    echo "<td>" . $Answered[$i] . "</td>";
                    echo "<td>" . $Ans[$i] . "</td></tr>";
                    if ($Ans[$i] == $Answered[$i]) {
                        $sum = $sum + 1;
                    }
                }
                ?>
            </table>
            <?php
            echo "<h3 style='float: right'>" . $UserName . "'s TOTAL : " . $sum . " of 10</h3>";


            $usrchk = mysqli_query($con, "select * from users where USERNAME ='$UserName'");

            if (mysqli_num_rows($usrchk) > 0) {
                $row = mysqli_fetch_assoc($usrchk);
                $usrID = $row["USER_ID"];
                $date = date_create();
                $timed = date_timestamp_get($date);
                if (!mysqli_query($con, "insert into answered values('$usrID','$sum','$quizid','$timed')")) {
                    echo mysqli_error($con);
                }
            } else {
                $usrchk = mysqli_query($con, "select * from users");
                $i = 0;
                $usrIDS = array();
                while ($row = mysqli_fetch_assoc($usrchk)) {
                    $usrIDS[$i] = $row['USER_ID'];
                    $i++;
                }

                $usrID = null;

                $usrID = "QUIZ" . rand(100, 999);
                for ($j = 0; $i < sizeof($usrIDS); $j++) {
                    if (strcmp($usrID, $usrIDS[$j]) != 0) {
                        break;
                    } elseif ($i == (sizeof($usrIDS) - 1)) {
                        $usrID = "QUIZ" . rand(100, 999);
                    }
                }

                mysqli_query($con, "insert into users values('$usrID','$UserName','$UserName')");

                $usrchk = mysqli_query($con, "select * from users where USERNAME ='$UserName'");
                $row = mysqli_fetch_assoc($usrchk);
                $usrID = $row["USER_ID"];
                $date = date_create();
                $timed = date_timestamp_get($date);
                if (!mysqli_query($con, "insert into answered values('$usrID','$sum','$quizid','$timed')")) {
                    echo mysqli_error($con);
                }

            }

            ?>
        </h4>
    </div>
</body>
</html>