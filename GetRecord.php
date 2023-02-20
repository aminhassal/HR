<?php
include("zklib/zklib.php");
include("DAL/Records.php");

$zk = new ZKLib("192.168.1.201", 4370);
$tst = new Records();
$ret = $zk->connect();
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
        <td><?php echo date("d-m-Y", strtotime($attendancedata[3])) ?></td>
        <td><?php echo date("H:i:s", strtotime($attendancedata[3])) ?></td>
    </tr>
    <script>alert("تمت المزامنة")</script>;
<?php
    $tst->sqlInserto(
        $attendancedata[1],
        $status,
        date("d-m-Y", strtotime($attendancedata[3])),
        date("H:i:s", strtotime($attendancedata[3]))

    );
endwhile
?>
<meta http-equiv="refresh" content="0;URL=lecture.php" />