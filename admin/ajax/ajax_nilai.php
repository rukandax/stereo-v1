<?php
error_reporting(0);
session_start();
include "../../library/config.php";

if($_GET['action'] == "table_data"){
   $query = mysqli_query($mysqli, "SELECT * FROM siswa WHERE id_kelas='$_GET[kelas]'");
   $data = array();
   $no = 1;
   while($r = mysqli_fetch_array($query)){
      $n = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM nilai WHERE nis='$r[nis]' AND id_ujian='$_GET[ujian]'"));
		
      $row = array();
      $row[] = $no;
      $row[] = $r['nis'];
      $row[] = $r['nama'];

      $jbenar = '<table>';
      foreach(json_decode($n['jml_benar'], true) as $jkey => $jvalue) {
         $type = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM soal_type WHERE id = '$jkey'"));
         $jbenar .= '<tr><td style="padding: 5px;">' . $type['name'] . ' (' . $jvalue .')</td></tr>';
      }
      $jbenar .= '</table>';

      $nilai = '<table>';
      $status = '<table>';
      foreach(json_decode($n['nilai'], true) as $nkey => $nvalue) {
         $type = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM soal_type WHERE id = '$nkey'"));
         $nilai .= '<tr><td style="padding: 5px;">' . $type['name'] . ' (' . $nvalue .')</td></tr>';
         $status .= '<tr><td style="padding: 5px;">' . $type['name'] . ' - ' . (($nvalue >= $type['threshold']) ? '<span class="label label-success">Lulus</span>' : '<span class="label label-danger">Gagal</span>') .'</td></tr>';
      }
      $nilai .= '</table>';
      $status .= '</table>';

      $row[] = $jbenar;		
      $row[] = $nilai;
      $row[] = $status;
      $data[] = $row;
   }
   $output = array("data" => $data);
   echo json_encode($output);
}
?>
