<?php
 class Records {
    public $StudentUID;
    public $RecordStatus;
    public $RecordDate;
    public $RecordTime;
public function sqlInserto($uid, $RecordStatus, $RecordDate,$RecordTime){
    require("config.php");
    $DeleteOld = "DELETE FROM `records`;";
    $Deletetresult = mysqli_query($con, $DeleteOld);
    $insertquery ="INSERT INTO`records`
     (`StudentUID`,
       `RecordStatus`,
        `RecordDate`,
         `RecordTime`)
     VALUES
      ($uid,'$RecordStatus','$RecordDate','$RecordTime');";
    $insertresult = mysqli_query($con, $insertquery) or die(mysqli_error($con));
    return $insertresult;
    }
 }
?>