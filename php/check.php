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

    </style>
</head>
<body>

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
            if (isset($_POST[$Temp])) {
                $Answered[0] = $_POST[$Temp];
            } else {
                $Answered[0] = "O";
            }
            $Temp = $quizid . "002";
            if (isset($_POST[$Temp])) {
                $Answered[1] = $_POST[$Temp];
            } else {
                $Answered[1] = "O";
            }
            $Temp = $quizid . "003";
            if (isset($_POST[$Temp])) {
                $Answered[2] = $_POST[$Temp];
            } else {
                $Answered[2] = "O";
            }
            $Temp = $quizid . "004";
            if (isset($_POST[$Temp])) {
                $Answered[3] = $_POST[$Temp];
            } else {
                $Answered[3] = "O";
            }
            $Temp = $quizid . "005";
            if (isset($_POST[$Temp])) {
                $Answered[4] = $_POST[$Temp];
            } else {
                $Answered[4] = "O";
            }
            $Temp = $quizid . "006";
            if (isset($_POST[$Temp])) {
                $Answered[5] = $_POST[$Temp];
            } else {
                $Answered[5] = "O";
            }
            $Temp = $quizid . "007";
            if (isset($_POST[$Temp])) {
                $Answered[6] = $_POST[$Temp];
            } else {
                $Answered[6] = "O";
            }
            $Temp = $quizid . "008";
            if (isset($_POST[$Temp])) {
                $Answered[7] = $_POST[$Temp];
            } else {
                $Answered[7] = "O";
            }
            $Temp = $quizid . "009";
            if (isset($_POST[$Temp])) {
                $Answered[8] = $_POST[$Temp];
            } else {
                $Answered[8] = "O";
            }
            $Temp = $quizid . "010";
            if (isset($_POST[$Temp])) {
                $Answered[9] = $_POST[$Temp];
            } else {
                $Answered[9] = "O";
            }

            $subid = array("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10");
            unset($Temp);

            $ids = array();
            for ($i = 0; $i < 10; $i++) {
                $ids[$i] = $quizid . "0" . $subid[$i];
            }
            $usrID = $_POST["user_id"];
            $con1 = mysqli_connect('localhost:3306', 'root', '', 'dbms') or die(mysqli_error(con1));
            $xyz = mysqli_query($con1, "select EMAIL FROM users where USER_ID LIKE'" . $usrID . "'") or die(mysqli_error($con1));
            $abc = mysqli_fetch_assoc($xyz);
            $UserName = $abc["EMAIL"];

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


            $usrchk = mysqli_query($con, "select * from users where EMAIL ='$UserName'");
            $qid = mysqli_query($con, "SELECT * FROM QUESTIONS where Q_ID like '$quizid%'");
            $question_id = array();
            $qwe = 0;
            while ($row = mysqli_fetch_assoc($qid)) {
                $question_id[$qwe] = $row['Q_ID'];
                $qwe++;
            }
            if (mysqli_num_rows($usrchk) > 0) {
                $row = mysqli_fetch_assoc($usrchk);
                $date = date_create();
                $timed = date_timestamp_get($date);
                echo "<h3 style='float: right'>" . $row['USERNAME'] . "'s TOTAL : " . $sum . " of 10</h3>";
                for ($z = 0; $z < 10; $z++) {
                    if (!mysqli_query($con, "insert into answered_pre_question values('$usrID','$quizid','$question_id[$z]','$timed','$Answered[$z]','sure')")) {
                        echo mysqli_error($con);
                    }
                }

                if (!mysqli_query($con, "insert into answered values('$usrID','$sum','$quizid','$timed',null)")) {
                    echo mysqli_error($con);
                }
            } else {
                echo "<h3 style='float: right'>Unknown's TOTAL : " . $sum . " of 10</h3>";
                echo "<script> alert('Not Logged IN your result isn\'t saved') </script>";
            }
            mysqli_close($con);
            ?>
        </h4>
    </div>
</body>
</html>