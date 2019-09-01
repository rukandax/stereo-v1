<?php
// Membuat variabel, ubah sesuai dengan nama host dan database pada hosting 
$host	= "localhost";
$user	= "rukanda";
$pass	= "";
$db	= "stereo-v1";

//Menggunakan objek mysqli untuk membuat koneksi dan menyimpanya dalam variabel $mysqli	
$mysqli = new mysqli($host, $user, $pass, $db);

//Membuat variabel yang menyimpan url website dan folder website
$folder_website = "/stereo-v1";
$url_website = "http://localhost" . $folder_website;

//Menentukan timezone 
date_default_timezone_set('Asia/Jakarta'); 
?>
