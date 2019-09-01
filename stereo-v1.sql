-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2019 at 10:25 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.21-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stereo-v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(5) NOT NULL,
  `kelas` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'Commercial Lending Division (CMLD)');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_ujian` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_ujian`, `id_kelas`, `aktif`) VALUES
(1, 1, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nis` varchar(255) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` varchar(255) NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `nilai` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nis`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `jml_benar`, `nilai`) VALUES
(1, '1415100898', 86, '55,59,52,65,67,64,70,68,51,62,61,57,53,63,56,58,54,69,60,66', '3,2,4,4,3,3,5,4,1,1,3,5,3,0,0,3,0,0,0,2', '00:02', 3, '15'),
(2, '1415100896', 86, '52,57,62,59,60,66,70,53,68,64,61,65,55,54,69,56,58,67,51,63', '2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,2,1', '119:30', 1, '5'),
(3, '1415100897', 86, '68,66,64,51,61,58,57,60,62,65,55,59,54,52,70,67,53,56,63,69', '2,1,2,0,0,2,4,3,5,0,2,4,5,5,0,2,2,3,0,4', '119:10', 2, '10'),
(4, '1516101253', 86, '66,57,60,70,52,53,55,69,56,64,61,51,59,62,58,63,65,67,54,68', '2,1,5,2,3,4,1,3,4,4,3,2,5,2,5,3,4,4,3,2', '116:53', 8, '40'),
(5, '1415100903', 86, '54,51,59,61,58,57,69,67,60,66,55,68,56,53,52,65,62,64,63,70', '5,2,3,2,5,1,3,1,5,2,1,1,4,4,3,4,0,0,0,0', '113:43', 0, ''),
(6, '1415100900', 86, '67,52,66,59,65,63,53,51,70,54,64,62,69,60,55,58,56,57,61,68', '1,3,4,2,4,4,4,2,5,1,5,4,4,2,3,5,4,1,5,1', '114:56', 11, '55'),
(7, '1415100899', 86, '67,54,66,69,60,64,51,62,56,52,59,58,53,61,65,68,57,55,63,70', '1,2,2,3,5,2,2,1,4,2,2,5,4,1,4,1,1,3,3,2', '114:34', 14, '70'),
(8, '1415100901', 86, '63,70,66,62,52,57,69,59,55,54,61,53,58,67,65,64,51,68,56,60', '5,2,2,1,3,1,3,5,1,2,3,4,5,4,4,2,2,2,2,3', '115:45', 7, '35'),
(9, '2345678', 88, '73,71,72', '4,2,5', '117:58', 1, '33.33'),
(10, '1234123', 88, '72,73,71', '1,4,0', '00:09', 0, '0'),
(11, '1516101255', 88, '71,73,72', '1,5,0', '00:52', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `password`, `id_kelas`, `status`) VALUES
('123456', 'Reynanda Raihan', '7dcba52d58b83cdf6146f67c7b199083', 1, 'off'),
('234567', 'Dinara Ramadhani', '34fc6ae770cde1775969ad4136b91f7a', 1, 'off');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `kunci` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `kunci`) VALUES
(1, 1, '<p>Manakah pernyataan di bawah ini yang tidak termasuk karakteristik kredit consumer ?</p>', '<p>Diberikan kepada perorangan dan pemberian kreditnya dapat dilakukan secara massal</p>', '<p>Target market kredit consumer merupakan leader di industri dengan performance yang kuat</p>', '<p>Dibuat dalam bentuk kredit program yang disesuaikan dengan target market yang akan dituju</p>', '<p>Proses kredit yang ter-standarisasi secara end to end</p>', 2),
(2, 1, '<p>Aktivitas berikut ini yang merupakan bagian dari siklus aktivitas pengelolaan kredit consumer adalah</p>', '<p>Penagihan / Collection</p>', '<p>Pengelolaan dan Monitoring Kredit</p>', '<p>a dan b benar</p>', '<p>a dan b salah</p>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(11) NOT NULL,
  `jml_soal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `nama_mapel`, `tanggal`, `waktu`, `jml_soal`) VALUES
(1, 'Assesment CMLD - 29 Aug 2019', 'General', '2019-08-29', 60, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', '524238e47f920ead930b892fbabfa8f0', 'admin'),
(2, 'Rukanda Faridsi', 'rukanda', 'ef88886f6700675eaa11a16174cc00eb', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
