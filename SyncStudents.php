<?php
include("zklib/zklib.php");
include("DAL/Students.php");

$zk = new ZKLib("192.168.1.201", 4370);
// $tst = new Records();
$tstInfo = new Users();
$ret = $zk->connect();

try {
    $user = $zk->getUser();
    sleep(1);
    while (list($uid, $userdata) = each($user)) :
        if ($userdata[2] == LEVEL_ADMIN)
            $role = 'ADMIN';
        elseif ($userdata[2] == LEVEL_USER)
            $role = 'USER';
        else
            $role = 'Unknown';
?>
<?php
        $tstInfo->sqlInsertoinfo($uid, $userdata[0], $userdata[1], $userdata[3]);
    endwhile;
} catch (Exception $e) {
    header("HTTP/1.0 404 Not Found");
    header('HTTP', true, 500); // 500 internal server error                
}
?>
<meta http-equiv="refresh" content="0;URL=register.php" />