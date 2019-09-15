<?php
session_start();
include "../../library/config.php";
include "../../library/function_view.php";

if($_GET['action'] == "table_data"){
   $query = mysqli_query($mysqli, "SELECT * FROM departemen ORDER BY id_departemen DESC");
   $data = array();
      $no = 1;
      while($r = mysqli_fetch_array($query)){
         $row = array();
         $row[] = $no;
         $row[] = $r['nama_departemen'];
         $row[] = create_action($r['id_departemen']);
         $data[] = $row;
         $no++;
      }
	
   $output = array("data" => $data);
   echo json_encode($output);
}

elseif($_GET['action'] == "form_data"){
   $query = mysqli_query($mysqli, "SELECT * FROM departemen WHERE id_departemen='$_GET[id]'");
   $data = mysqli_fetch_array($query);	
   echo json_encode($data);
}

elseif($_GET['action'] == "insert"){
   $password = md5($_POST['password']);
   
   mysqli_query($mysqli, "INSERT INTO departemen SET nama_departemen = '$_POST[nama_departemen]' ");	
}

elseif($_GET['action'] == "update"){
   $password = md5($_POST['password']);
   mysqli_query($mysqli, "UPDATE departemen SET nama_departemen= '$_POST[nama_departemen]' WHERE id_departemen='$_POST[id]'");
}

elseif($_GET['action'] == "delete"){
   mysqli_query($mysqli, "DELETE FROM departemen WHERE id_departemen='$_GET[id]'");	
}
?>
