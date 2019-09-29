<?php
session_start();
include "library/config.php";

if(empty($_SESSION['username']) or empty($_SESSION['password']) ){
   header('location: login.php');
}

$kelas = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM kelas WHERE id_kelas='$_SESSION[kelas]'"));
$ujian = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM ujian WHERE id_ujian='$_GET[ujian]'"));
?>

<h3 class="page-header"><i class="glyphicon glyphicon-user"></i> Data Peserta dan Ujian</h3>
<div class="row">
   <div class="col-xs-4">NIP</div>
   <div class="col-xs-8">: <b><?= $_SESSION['nis']; ?> </b> </div>
</div><br/>
<div class="row">
   <div class="col-xs-4">Nama Lengkap</div>
   <div class="col-xs-8">: <b><?= $_SESSION['namalengkap']; ?> </b></div>
</div><br/>
<div class="row">
   <div class="col-xs-4">Divisi</div>
   <div class="col-xs-8">: <b><?= $kelas['kelas']; ?></b></div>
</div><br/>
<div class="row">
   <div class="col-xs-4">Assessment</div>
   <div class="col-xs-8">: <b><?= $ujian['judul']; ?></b></div>
</div><br/>
<div class="row">
   <div class="col-xs-4">Jml. Soal</div>
   <div class="col-xs-8">: <b><?= $ujian['jml_soal']; ?></b></div>
</div><br/>
<div class="row">
   <div class="col-xs-4">Waktu Mengerjakan</div>
   <div class="col-xs-8">: <b><?= $ujian['waktu']; ?> menit</b></div>
</div><br/>

<div class="row">
   <div class="col-xs-12">

<?php	
//Jika nilai sudah ada tampilkan tombol Sudah Mengerjakan, jika belum ada tampilkan tombol Masuk Ujian
$qnilai = mysqli_query($mysqli, "SELECT * FROM nilai WHERE id_ujian='$_GET[ujian]' AND nis='$_SESSION[nis]'");
$tnilai = mysqli_num_rows($qnilai);
$rnilai = mysqli_fetch_array($qnilai);

if($tnilai>0 and $rnilai['nilai'] != "")  echo '<a class="btn btn-success disabled"> Sudah mengerjakan </a>';
else echo '<a class="btn btn-primary" onclick="show_petunjuk('.$_GET['ujian'].')">
<i class="glyphicon glyphicon-log-in"></i> Masuk Ujian</a>';
?>
	
   </div>
</div><br/>
