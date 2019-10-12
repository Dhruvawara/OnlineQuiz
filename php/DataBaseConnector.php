<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        div {
            margin-left: 7%;
            margin-top: 2%;
            width: 86%;
        }
    </style>
</head>
<body>
<div class="uk-overlay uk-overlay-secondary uk-card-secondary uk-position-center">
    <?php
    $db = mysqli_connect("localhost:3306", "root", "", "COMPANY");
    if (mysqli_connect_errno()) {
        printf("Connect failed : %s <br />", mysqli_connect_error());
    }

    $query = "SELECT * FROM EMPLOYEE";
    echo "$query\n";
    $result = mysqli_query($db, $query);

    echo "<p align='center' style='align-content: center'>";
    for ($i = 0; $i < 5000; $i++) {
        echo $i;
    }
    echo "</p>";

    echo "<table align='center'>" . "<tr align='center'>\n";

    $num_rows = mysqli_num_rows($result);


    if ($num_rows > 0) {
        $row = mysqli_fetch_assoc($result);
        $num_fields = mysqli_num_fields($result);

        $keys = array_keys($row);
        for ($i = 0; $i < $num_fields; $i++) {
            echo "<th>" . $keys[$i] . "</th>\n";
        }
        echo "</tr>\n";

        for ($i = 0; $i < $num_rows; $i++) {
            echo "<tr align='center'>";
            $values = array_values($row);
            for ($j = 0; $j < $num_fields; $j++) {
                $value = htmlspecialchars(($values[$j]));
                if ($value == null) {
                    echo "<td>" . "NULL" . "</td>\n";
                } else {
                    echo "<td>" . $value . "</td>\n";
                }

            }
            echo "</tr>\n";
            $row = mysqli_fetch_assoc($result);
        }
    }
    echo "</table>";
    ?>
    <br>
    <h1><?php $num_rows ?>Hello</h1>
</div>
</body>
</html>

