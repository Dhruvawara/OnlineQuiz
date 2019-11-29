<?php
    $date = date_create();
    $timed = date_timestamp_get($date);
    echo date('Y-m-d H:i:s',$timed)."\t".date('Y-m-d H:i:s',($timed+120));
