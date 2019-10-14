<script type="text/javascript" src="../assets/tinymce/tinymce.min.js"> </script>

<script type="text/javascript" src="script/script_soal.js"> </script>

<?php
session_start();
if(empty($_SESSION['username']) or empty($_SESSION['password']) or ($_SESSION['leveluser']!="operator" and $_SESSION['leveluser']!="admin")){
   header('location: ../login.php');
}

//Memanggil library yang diperlukan
include "../../library/config.php";
include "../../library/function_view.php";
include "../../library/function_date.php";
include "../../library/function_form.php";

//Membuat judul, tombol Tambah dan tombol Import
create_title("list", "Manajemen Soal");
create_button("success", "plus-sign", "Tambah", "btn-add", "form_add()");
create_button("primary", "import", "Import", "btn-import", "form_import()");
create_button("info", "file", "Export", "Export Ke Excel", "form_export()");

//Menampilkan detail ujian
$ru = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM ujian WHERE id_ujian='$_GET[ujian]'"));
$ts = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM soal_type WHERE id='$_GET[type]'"));
echo '<hr/><div class="alert alert-info"><table width="100% no-ajax">
   <tr>
      <td>Judul Ujian</td><td>:<b> '.$ru['judul'].'</b></td>
      <td>Materi</td><td>:<b> ' . $ts['name'] . '</b></td>
   </tr>
</table>
<input type="hidden" id="id_ujian" value="'.$_GET['ujian'].'">
<input type="hidden" id="id_type" value="'.$_GET['type'].'">
</div>';

//Membuat header dan footer soal
create_table(array("Soal", "Aksi"));

//Membuat form tambah dan edit soal
open_form("modal_soal", "return save_data()");
   create_textarea("Soal", "soal", "richtext");
   create_textarea("Pilihan 1", "pil_1", "richtextsimple");
   create_textarea("Pilihan 2", "pil_2", "richtextsimple");
   create_textarea("Pilihan 3", "pil_3", "richtextsimple");
   create_textarea("Pilihan 4", "pil_4", "richtextsimple");
	
   $list = array();
   for($i=1; $i<=4; $i++){
      $list[] = array($i, $i);
   }
   create_combobox("Kunci Jawaban", "kunci", $list, 4, "", "required");
close_form();

//Membuat form import soal
open_form("modal_import", "return import_data()");
   create_textbox("Pilih File .xls", "file", "file", 6, "", "required");
close_form("import", "Import");
?>