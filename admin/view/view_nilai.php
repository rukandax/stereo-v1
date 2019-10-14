<script type="text/javascript" src="script/script_nilai.js"> </script>

<?php
session_start();
if(empty($_SESSION['username']) or empty($_SESSION['password']) or ($_SESSION['leveluser']!="operator" and $_SESSION['leveluser']!="admin")){
   header('location: ../login.php');
}

include "../../library/function_view.php";
include "../../library/function_form.php";

create_title("check", "Hasil Ujian");
create_button("primary", "export", "Publikasi Nilai", "btn-add", "");
create_button("info", "file", "Export", "Export Ke Excel", "form_export()");

echo '<input type="hidden" id="id_ujian" value="'.$_GET['ujian'].'">
<input type="hidden" id="id_kelas" value="'.$_GET['kelas'].'">';
	  
create_table(array("NIP", "Nama Peserta", "Jml. Benar", "Nilai", "Status"));
?>
