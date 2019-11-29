<?php

if ($con = mysqli_connect('localhost:3306', 'root', '')) {
    if (!mysqli_select_db($con, 'dbms')) {
        ?>

        <div uk-alert>
            <a class="uk-alert-close" uk-close></a>
            <h3>Notice:</h3>
            <p>Connection to the Database is not established Database not found <b>:(</b></p>
        </div>


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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="//fonts.googleapis.com/css?family=Questrial" rel="stylesheet">
    <meta charset="utf-8">
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
        <a class="uk-navbar-item uk-logo" href="../HTML/LOGIN.html">
            <h3 class="uk-text-muted">Online<br>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Quiz</h3>
        </a>
    </div>
</nav>


<?php
$dob = date('Y-m-d', strtotime($_POST['date']));
$email = strtolower($_POST['email']);
$password = $_POST['password'];
$usernames = array();
$passwords = array();
$passchk = mysqli_query($con, "call getvaldetails()") or die(mysqli_error($con));

$i = 0;
while ($row = mysqli_fetch_assoc($passchk)) {
    $usernames[$i] = trim($row['EMAIL']);
    $passwords[$i] = trim($row['PASSWORD']);
    $i++;
}
$user_id = "";
for ($i = 0; $i < sizeof($usernames); $i++) {
    if (strcmp($usernames[$i], $email) == 0) {
        $con1 = mysqli_connect('localhost:3306', 'root', '', 'dbms');
        $getID = mysqli_query($con1, "select user_id from users where EMAIL = '$usernames[$i]'") or die(mysqli_error($con1));
        $row = mysqli_fetch_assoc($getID);
        $user_id = $row['user_id'];
        echo "<hr>";
        break;
    } elseif ($i == (sizeof($usernames) - 1)) {
        echo "<script> alert('Email wrong enter again go back') </script><br><br><br><br>
                            <a href='../HTML/registration.html' >Go Back</a>";
        die();
    }
}

for ($i = 0; $i < sizeof($passwords); $i++) {
    if (strcmp($passwords[$i], $password) == 0) {
        break;
    } elseif ($i == (sizeof($passwords) - 1)) {
        echo "<script> alert('Email or Password wrong enter again go back') </script><br><br><br><br>
                            <a href='../HTML/registration.html' >Go Back</a>";
        die();
    }
}

date_default_timezone_set('Asia/Calcutta');
$date = date_create();
$timed = date_timestamp_get($date);
$con2 = mysqli_connect('localhost:3306', 'root', '', 'dbms');
$gettime = mysqli_query($con2, "select * from time_given where USER_ID = '" . $user_id . "'") or die(mysqli_error($con2));
$row = mysqli_fetch_assoc($gettime);
$z = (int)$row['time_given'];
echo ($timed . $z);
if ($z<$timed  ) {
    header("Location: http://localhost/OnlineQuiz/HTML/LOGIN.html");
} else {
    ?>
    <form action="QUIZ_TEMPLATE.php" class="uk-form-width-large" method="post">
    <input type="hidden" value="<?php echo $user_id; ?>" name="user_id"/>
    <button type="submit" class="uk-button-large uk-position-center"
            style="color: black;border-radius: 15px;background-color: #0f6ecd;width: 150px">
        GO IN
    </button>
    </form><?php
}
mysqli_close($con);
mysqli_close($con1);
mysqli_close($con2);
?>


</body>
</html>