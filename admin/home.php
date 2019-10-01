<?php
session_start();
require_once "../library/config.php";
if(empty($_SESSION['username']) or empty ($_SESSION['password'])){
   header('location: login.php');
}
?>

<div class="jumbotron">
   <div class="container text-center">
      <h2>Selamat Datang <b> <?= $_SESSION['namalengkap']; ?> </b>!</h2>
      <p>Silahkan gunakan menu diatas untuk mengelola Online Test</p>
   </div>
</div>

<section class="content">

      <div class="row">

        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
            
            <?php
            $sqlCommandPeserta = "SELECT COUNT(*) FROM siswa"; 
            $query = mysqli_query($mysqli, $sqlCommandPeserta) or die (mysqli_error()); 
            $row = mysqli_fetch_row($query);
            echo "<h3>". $row[0] ."</h3>";
            echo "<p>Data Peserta</p>";
            mysqli_free_result($query); 
            ?>

            </div>
            <div class="icon">
              <i class="ion ion-person"></i>
            </div>
            <a href="#" class="small-box-footer">Lihat data <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3>2</h3>
              <p>Data Departemen</p>
            </div>
            <div class="icon">
              <i class="ion ion-clipboard"></i>
            </div>
            <a href="#" class="small-box-footer">Lihat data <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              
            <?php
            $sqlCommandDivisi = "SELECT COUNT(*) FROM kelas"; 
            $query = mysqli_query($mysqli, $sqlCommandDivisi) or die (mysqli_error()); 
            $row = mysqli_fetch_row($query);
            echo "<h3>". $row[0] ."</h3>";
            echo "<p>Data Divisi</p>";
            mysqli_free_result($query); 
            ?>

            </div>
            <div class="icon">
              <i class="ion ion-android-contacts"></i>
            </div>
            <a href="#" class="small-box-footer">Lihat data <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-red">
            <div class="inner">
              
            <?php
            $sqlCommandSoal = "SELECT COUNT(*) FROM soal"; 
            $query = mysqli_query($mysqli, $sqlCommandSoal) or die (mysqli_error()); 
            $row = mysqli_fetch_row($query);
            echo "<h3>". $row[0] ."</h3>";
            echo "<p>Bank Soal</p>";
            mysqli_free_result($query); 
            ?>

            </div>
            <div class="icon">
              <i class="ion ion-compose"></i>
            </div>
            <a href="#" class="small-box-footer">Lihat data <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>

      </div>
    </section>