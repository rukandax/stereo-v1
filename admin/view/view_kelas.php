<script type="text/javascript" src="script/script_kelas.js"> </script>

<?php
session_start();
if(empty($_SESSION['username']) or empty($_SESSION['password']) or $_SESSION['leveluser']!="admin"){
   header('location: ../login.php');
}

include "../../library/function_view.php";
include "../../library/function_form.php";

create_title("signal", "Manajemen Divisi");
create_button("success", "plus-sign", "Tambah", "btn-add", "form_add()");
create_button("info", "file", "Export", "Export Ke Excel", "form_export()");

create_table(array("Nama Divisi", "Aksi"));

open_form("modal_kelas", "return save_data()");
   create_textbox("Nama Divisi", "kelas", "text", 4, "", "required");
close_form();
?>
