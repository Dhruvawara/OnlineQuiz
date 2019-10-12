<!DOCTYPE html>
<HTML>
<HEAD>
    <title>QUIZ</title>
    <style>
        div{
            max-width:max-content;
            margin: 7%;
            border: 3px solid #73AD21;
        }
    </style>

</HEAD>
<body>
    <div style="text-align: center;">
        <?php
        function t(){
        echo "<p align='center' style='align-content: center'>";
            for ($i = 0; $i < 5000; $i++) {
            echo $i." ";
            }
            echo "</p>".time();
        }
        t();
        $con = mysqli_connect("localhost:3306","root","","quiz") or die("Died");
        $s = mysqli_query($con, "")

        ?>

  </div>
</body>
</HTML>