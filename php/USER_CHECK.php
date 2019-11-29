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
<?php
    $toGo = $_POST["type"];
    $toGo = trim($toGo);
    if (strcmp($toGo,"SIGNUP")){
            $email=strtolower($_POST['email']);
            $username=$_POST["username"];
            $dob=date('Y-m-d', strtotime($_POST['date']));
            $pass=$_POST["password"];
            $usrchk = mysqli_query($con, "select * from users") or die(mysqli_error($con));
            $i = 0;
            $usrIDS = array();
            $emails=array();
            while ($row = mysqli_fetch_assoc($usrchk)) {
                $usrIDS[$i] = $row['USER_ID'];
                $emails[$i]=$row['EMAIL'];
                $i++;
            }

            for($i=0;$i<sizeof($emails);$i++){
                if (strcmp($emails[$i],$email) == 0){
                    echo "<script> alert('Email already used enter new email go back') </script><br><br><br><br>
                            <a href='../HTML/SIGNUP.html' >Go Back</a>";
                  //  header('Location: ' . $_SERVER['HTTP_REFERER']);
                    die();
                }
            }

            $usrID = "QUIZ" . rand(100, 999);
            for ($j = 0; $i < sizeof($usrIDS); $j++) {
                if (strcmp($usrID, $usrIDS[$j]) != 0) {
                    break;
                } elseif ($i == (sizeof($usrIDS) - 1)) {
                    $usrID = "QUIZ" . rand(100, 999);
                }
            }
            mysqli_query($con, "insert into users values('$usrID','$email','$username','$pass','$dob')");
        echo "<script> alert('successful!!!') </script>";
        sleep(1);
        header("Location: http://localhost/OnlineQuiz/HTML/SIGNUP.html");
        die();
    }
    else{
        echo "<script> alert('XD') </script>";
    }
    mysqli_close($con);
?>


</body>
</html>