<?php
include("zklib/zklib.php");
include("DAL/Test.php");

$zk = new ZKLib("192.168.1.201", 4370);
$tst = new DAL();
$tstInfo = new DAL_INF();
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
<?php
$attendance = $zk->getAttendance();
sleep(1);
while (list($idx, $attendancedata) = each($attendance)) :
    if ($attendancedata[2] == 14)

        $status = 'Check Out';
    else
        $status = 'Check In';
?>
    <tr>
        <td><?php echo $idx ?></td>
        <td><?php echo $attendancedata[0] ?></td>
        <td><?php echo $attendancedata[1] ?></td>
        <td><?php echo $status ?></td>
        <td><?php echo date("H:i:s", strtotime($attendancedata[3])) ?></td>
        <td><?php echo date("d-m-Y", strtotime($attendancedata[3])) ?></td>
    </tr>
<?php
    $tst->sqlInserto(
        $attendancedata[1],
        $status,
        date("H:i:s", strtotime($attendancedata[3])),
        date("d-m-Y", strtotime($attendancedata[3]))
    );
endwhile
?>