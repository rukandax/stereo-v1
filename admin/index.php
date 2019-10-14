<?php
session_start();
ob_start();

//Mengatur batas login
$timeout = $_SESSION['timeout'];
if(time()<$timeout){
   $_SESSION['timeout'] = time()+5000;
}else{
   $_SESSION['login'] = 0;
}

//Mengecek status login
if(empty($_SESSION['username']) or empty($_SESSION['password']) or $_SESSION['login']==0){
   header('location: login.php');
}
?>

<html>
<head>
   
<title>E-Assessment Administrator</title>
 
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />

<link rel="stylesheet" type="text/css" href="../assets/bootstrap/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="../assets/dataTables/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
<!-- Ion Icon -->
<link rel="stylesheet" href="../assets/Ionicons/css/ionicons.min.css">
<!-- Gaya Tema -->
<link rel="stylesheet" href="../assets/AdminLTE/AdminLTE.min.css">
	
<script type="text/javascript" src="../assets/jquery/jquery-2.0.2.min.js"></script>

</head>
<body style="background-color: #f9fbfd;">

<nav class="navbar navbar-default navbar-fixed-top" style="background-image: linear-gradient(-90deg, #6A84DA, #4B71E2);"> 
   <div class="container">
      <?php include "menu.php"; ?> 
   </div>
</nav>	

<section> 	
   <div  class="container">
      <div class="row">
         <div class="col-xs-12" id="content"></div>
      </div>
   </div>
</section>
	
<script type="text/javascript" src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../assets/dataTables/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript" src="../js/admin.js"></script>

</body>
</html>