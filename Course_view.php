<?php
session_start();
require 'config.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title>محاضرات</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
</head>
<div class="container mt-4">
    <?php include('message.php'); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>بيانات طالب</h4>
                </div>
                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>إسم</th>
                                <th>نوع السجل</th>
                                <th> وقت الحضور </th>
                                <th>حالة الحضور</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (isset($_GET['CourseiID'])) {
                                $CourseID = mysqli_real_escape_string($con, $_GET['CourseiID']);
                                $query = "SELECT * FROM `attendence` WHERE CourseiID = $CourseID";
                                $query_run = mysqli_query($con, $query);

                                if (mysqli_num_rows($query_run) > 0) {
                                    foreach ($query_run as $student) {
                            ?>
                                        <tr>
                                            <td><?= $student['Name']; ?></td>
                                            <td><?= $student['RecordStatus']; ?></td>
                                            <td><?= $student['RecordTime']; ?></td>
                                            <td <?php if (true) : ?> style="background-color:#0f0;" <?php endif; ?>>
                                                <?php echo "حضور"; ?>
                                            </td>
                                        </tr>
                            <?php
                                    }
                                } else {
                                    echo "<h5> No Record Found </h5>";
                                }
                            }
                            ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/custom.js"></script>
</body>