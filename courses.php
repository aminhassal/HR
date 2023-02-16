<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" charset=utf-8>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <title> إضافة فصل   </title>
</head>
<body>
    <div class="container mt-5">
        <?php include('message.php'); ?>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>إضافةفصل
                            <a href="lecture.PHP" class="btn btn-danger float-end">رجوع</a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="code.php" method="POST">
                        <div class="mb-3">
                                <label>إسم الفصل    </label>
                                <input type="text" name="Nameclass" class="form-control">
                            </div>
                                                        
                            <div class="mb-3">
                                <label> إسم المحاضر    </label>
                                <input type="text" name="Namelecture" class="form-control">
                            </div>
<?php 
    include 'config.php';
    $query ="SELECT * FROM `subjects`";
    $result = $con->query($query);
    if($result->num_rows> 0){
      $options= mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
?>
                            <div class="mb-3">
                                <label>إسم المادة    </label>
<select name="SubjectID_PK" >
   <option>إختر المادة</option>
  <?php 
  foreach ($options as $option) {
  ?>
    <option  value='<?php echo $option['SubjectID_PK'] ?>'>
    <?php echo $option['SubjectName']; ?> 
    </option><?php 
    }
   ?>
</select>
                            </div>                       
                            <div class="mb-3">
                                <button type="submit" name="save_class" class="btn btn-primary">إضافة</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>