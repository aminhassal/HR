<?php
 class Users {
    public $ID;
    public $uid;
    public $Name;
    public $Role;
    public $Password;
public function sqlInsertoinfo($uid,$ID,$Name,$Password){
    require("config.php");
    $insertquery =
     "INSERT IGNORE INTO`infostd`
        (`Uid`,
         `STD_id`,
         `Name`,
         `Password`)
     VALUES
      ($uid,$ID,'$Name','$Password');";
    $insertresult = mysqli_query($con, $insertquery) or die(mysqli_error($con));
    return $insertresult;
    }
 }
 
//  class SetUsers {
//   public $ID;
//   public $uid;
//   public $Name;
//   public $Role;
//   public $Password;
// public function SendToDevice($ID, $uid, $Name, $Password, $Role){
//   require("config.php");

//   $zk->setUser($ID, $uid, $Name, $Password,$Role);

// }
// }
?>