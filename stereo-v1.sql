-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2019 at 02:47 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stereo-v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int(5) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'Commercial Lending Division (CMLD)');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE IF NOT EXISTS `kelas_ujian` (
  `id_ujian` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_ujian`, `id_kelas`, `aktif`) VALUES
(1, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(255) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` varchar(255) NOT NULL,
  `jml_benar` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nilai`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nis`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `jml_benar`, `nilai`) VALUES
(1, '123456', 1, '1,3,7,6,4,5,2,8', '1,3,2,3,4,1,2,4', '59:33', 8, '100'),
(2, '234567', 1, '8,4,7,1,2,3,5,6', '4,4,2,1,4,2,4,1', '59:17', 4, '50');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`nis`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `password`, `id_kelas`, `status`) VALUES
('123456', 'Reynanda Raihan', '7dcba52d58b83cdf6146f67c7b199083', 1, 'off'),
('234567', 'Dinara Ramadhani', '34fc6ae770cde1775969ad4136b91f7a', 1, 'login'),
('11111', 'user01', '18cb20abdab7b3ce73036ad0f44a7d85', 1, 'off'),
('22222', 'user02', '182acaa46619f5c80bc9d89642fed0d6', 1, 'off'),
('33333', 'user03', '8b31be16080e77771bfb26bc808d6e2f', 1, 'off'),
('44444', 'user04', 'd97397b39da40ee1417fc1d14d954e29', 1, 'off'),
('55555', 'user05', 'ae821a7fd5f873bf0292341f85938637', 1, 'off'),
('66666', 'user06', '129938a83a235dd18a2eed360c30c111', 1, 'off'),
('77777', 'user07', '8fbe727007e90abacb606d07b824a41c', 1, 'off'),
('88888', 'user08', '221ab48c875accc41f436a0ca0e4de83', 1, 'off'),
('99999', 'user09', '9b7decd2a85c27912b6f3b3f7e9d758e', 1, 'off');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE IF NOT EXISTS `soal` (
  `id_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian` int(11) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `kunci` int(11) NOT NULL,
  `soal_type` int(11) NOT NULL,
  PRIMARY KEY (`id_soal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `kunci`, `soal_type`) VALUES
(9, 1, '<p>Manakah pernyataan di bawah ini yang tidak termasuk karakteristik kredit consumer ?</p>', '<p>Diberikan kepada perorangan dan pemberian kreditnya dapat dilakukan secara massal</p>', '<p>Target market kredit consumer merupakan <em>leader</em> di industri dengan <em>performance</em> yang kuat</p>', '<p>Dibuat dalam bentuk kredit program yang disesuaikan dengan target market yang akan dituju</p>', '<p>Proses kredit yang ter-standarisasi secara end to end</p>', 2, 1),
(12, 1, '<p>Fungsi, tugas dan tanggung jawab Credit Risk Management Unit - Retail Risk Unit adalah, kecuali ?</p>', '<p>Mengelola risiko kredit termasuk melakukan <em>risk assessment</em>, dan menetapkan mitigasi risiko dalam penyusunan ketentuan produk kredit, termasuk kredit program &amp; kredit turunannya</p>', '<p>Mereview kecukupan Cadangan Kerugian Penurunan Nilai (CKPN) kredit yang dilakukan oleh Business Unit telah sesuai ketentuan yang berlaku</p>', '<p>Mengelola debitur berkolektibilitas 1 dan 2A</p>', '<p>Melakukan pengelolaan dan upaya penyelesaian kewajiban debitur atas kredit-kredit yang telah dihapus buku</p>', 3, 2),
(16, 1, '<p>Secara umum produk inti kredit consumer dibedakan menjadi ?</p>', '<p>Kredit Berbasis Agunan</p>', '<p>Kredit Tanpa Agunan</p>', '<p>a dan b benar</p>', '<p>a dan b salah</p>', 3, 3),
(15, 1, '<p>Berikut ini yang merupakan unit kerja terkait kredit segmen consumer adalah ?</p>', '<p>Legal Unit</p>', '<p>Compliance Unit</p>', '<p>Central Operations Unit</p>', '<p>Benar semua</p>', 4, 3),
(19, 1, '<p>Manakah di bawah ini yang merupakan definisi dari Afinity ?</p>', '<p>Kerjasama dengan suatu badan usaha tertentu dimana kartu yang diterbitkan ditujukan kepada konsumen/pelanggan dari badan usaha tersebut</p>', '<p>Kerjasama dengan suatu komunitas atau perkumpulan masyarakat tertentu, dimana kartu yang akan diterbitkan ditujukan kepada anggota dari komunitas/perkumpulan tersebut</p>', '<p>Kerjasama dengan suatu komunitas atau perkumpulan masyarakat tertentu, dimana kartu yang akan diterbitkan ditujukan kepada pengurus dari komunitas/perkumpulan tersebut</p>', '<p>Kerjasama antara Bank dengan perusahaan dalam rangka menyalurkan kredit consumer kapada pegawai perusahaan</p>', 2, 4),
(18, 1, '<p>Kredit yang diberikan kepada perorangan untuk membiayai pembelian kavling siap bangun, merupakan definisi ?</p>', '<p>Kredit Pemilikan Rumah</p>', '<p>Kredit Pemilikan Tanah</p>', '<p>Kredit Refinancing</p>', '<p>Salah semua</p>', 2, 4),
(10, 1, '<p>Aktivitas berikut ini yang merupakan bagian dari siklus aktivitas pengelolaan kredit consumer adalah ?</p>', '<p>Penagihan / Collection</p>', '<p>Pengelolaan dan Monitoring Kredit</p>', '<p>a dan b benar</p>', '<p>a dan b salah</p>', 3, 1),
(11, 1, '<p>Debitur yang dikelola oleh Business Unit Consumer Loans dan Consumer Cards adalah debitur dengan ?</p>', '<p>Kolektibilitas 1</p>', '<p>Kolektibilitas DPD 30+ (2B,2C)</p>', '<p>a dan b benar</p>', '<p>a dan b salah</p>', 1, 1),
(13, 1, '<p>Berikut ini yang bukan merupakan unit pengelola kredit segmen consumer adalah ?</p>', '<p>Consumer Cards Unit</p>', '<p>Consumer Loans Unit</p>', '<p>Credit Operations Unit</p>', '<p>Retail Risk Unit</p>', 3, 2),
(14, 1, '<p>Berikut ini merupakan fungsi, tugas dan tanggung jawab unit kerja Consumer Loans, kecuali ?</p>', '<p>Menetapkan <em>target market</em> dan mencari <em>targeted customer</em> yang layak/<em>feasible</em> untuk dibiayai serta memasarkan produk-produk perkreditan termasuk melakukan <em>cross selling</em></p>', '<p>Memperoleh kelengkapan data/dokumen dan melakukan verifikasi dan validasi data/dokumen tersebut</p>', '<p>Mengusulkan perubahan scoring bersama Unit Pembina Sistem Credit Risk Tools &amp; Portfolio kepada Direktur Risk Management dan Direktur/EVP Coordinator Consumer Finance</p>', '<p>Melakukan pemutusan kredit sebagai pemegang kewenangan memutus kredit atau sebagai anggota Komite Kredit sesuai limit kewenangannya</p>', 3, 2),
(17, 1, '<p>Kredit yang diberikan kepada perorangan dengan cara mengagunkan rumah tinggal/ rumah susun / apartement / rumah kantor / rumah toko / kendaraan atas nama yang bersangkutan atau suami/isteri yang bersangkutan, merupakan definisi dari ?</p>', '<p>Kredit Pemilikan Rumah</p>', '<p>Kredit Pemilikan Tanah</p>', '<p>Kredit Refinancing</p>', '<p>Kredit Bebas Agunan</p>', 3, 3),
(20, 1, '<p>Manakah pola kerjasama di bawah ini yang bukan merupakan pola kerjasama Consumer Loans / Credit Card ?</p>', '<p>Afinity</p>', '<p>Mitrakarya</p>', '<p>Sindikasi</p>', '<p>Sekuritisasi Aset</p>', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `soal_type`
--

CREATE TABLE IF NOT EXISTS `soal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `threshold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `soal_type`
--

INSERT INTO `soal_type` (`id`, `name`, `threshold`) VALUES
(1, 'General', NULL),
(2, 'Product Knowledge', NULL),
(3, 'Credit Process & Analyst', NULL),
(4, 'Internal Policy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE IF NOT EXISTS `ujian` (
  `id_ujian` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(11) NOT NULL,
  `jml_soal` int(11) NOT NULL,
  PRIMARY KEY (`id_ujian`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`) VALUES
(1, 'Assesment CMLD - 29 Aug 2019', '2019-09-01', 60, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` text NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', '524238e47f920ead930b892fbabfa8f0', 'admin'),
(2, 'Rukanda Faridsi', 'rukanda', 'ef88886f6700675eaa11a16174cc00eb', 'operator');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
