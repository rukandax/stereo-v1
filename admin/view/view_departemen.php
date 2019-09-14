<script type="text/javascript" src="script/script_departemen.js"> </script>

<?php
session_start();
if(empty($_SESSION['username']) or empty($_SESSION['password']) or $_SESSION['leveluser']!="admin"){
   header('location: ../login.php');
}

include "../../library/function_view.php";
include "../../library/function_form.php";

create_title("th", "Departemen");
create_button("success", "plus-sign", "Tambah", "btn-add", "form_add()");

create_table(array("Nama Departemen", "Aksi"));

open_form("modal_departemen", "return save_data()");
   create_textbox("Nama Departemen", "nama_departemen", "text", 4, "", "required");
close_form();
?>
