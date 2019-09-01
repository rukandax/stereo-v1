-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2019 at 02:06 PM
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
(1, 1, 'Y');

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
  `jml_benar` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
('234567', 'Dinara Ramadhani', '34fc6ae770cde1775969ad4136b91f7a', 1, 'login');

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
  `kunci` int(11) NOT NULL,
  `soal_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `kunci`, `soal_type`) VALUES
(1, 1, '<p>Ini soal pertama General</p>', '<p>Pilihan pertama yang benar</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat</p>', 1, 1),
(2, 1, '<p>Ini soal kedua General</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua yang benar</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat</p>', 2, 1),
(3, 1, '<p>Ini soal pertama Product Knowledge</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga yang benar</p>', '<p>Pilihan keempat</p>', 3, 2),
(4, 1, '<p>Ini soal kedua Product Knowledge</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat yang benar</p>', 4, 2),
(5, 1, '<p>Ini contoh soal pertama Credit Process &amp; Analyst</p>', '<p>Pilihan pertama yang benar</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat</p>', 1, 3),
(6, 1, '<p>Ini contoh soal kedua Credit Process &amp; Analyst</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga yang benar</p>', '<p>Pilihan keempat</p>', 3, 3),
(7, 1, '<p>Ini contoh soal Internal Policy</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua yang benar</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat</p>', 2, 4),
(8, 1, '<p>Ini contoh soal kedua Internal Policy</p>', '<p>Pilihan pertama</p>', '<p>Pilihan kedua</p>', '<p>Pilihan ketiga</p>', '<p>Pilihan keempat yang benar</p>', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `soal_type`
--

CREATE TABLE `soal_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `threshold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`) VALUES
(1, 'Assesment CMLD - 29 Aug 2019', '2019-09-01', 60, 8);

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
-- Indexes for table `soal_type`
--
ALTER TABLE `soal_type`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `soal_type`
--
ALTER TABLE `soal_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
