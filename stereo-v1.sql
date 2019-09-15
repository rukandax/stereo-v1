-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15 Sep 2019 pada 12.14
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

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
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(5) NOT NULL,
  `kelas` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'Commercial Lending Division (CMLD)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_ujian` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_ujian`, `id_kelas`, `aktif`) VALUES
(1, 1, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nis` varchar(255) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` varchar(255) NOT NULL,
  `jml_benar` text,
  `nilai` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `password`, `id_kelas`, `status`) VALUES
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
-- Struktur dari tabel `soal`
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
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `kunci`, `soal_type`) VALUES
(1, 1, '<p>Variabel Analisa Kualitatif dalam pemberian kredit terdiri dari faktor internal dan eksternal. Faktor internal yang harus dianalisis meliputi aspek-spek sebagai berikut:</p>', '<p>Manajemen, Teknis Produksi, Pemasaran, Keuangan, Persaingan Industri dan Agunan</p>', '<p>Manajemen, Teknis Produksi, Pemasaran, Keuangan dan Siklus atau Konjungtur Ekonomi</p>', '<p>Manajemen, Teknis Produksi, Pemasaran, Keuangan, Amdal dan Fluktuasi Kurs</p>', '<p>Manajemen, Teknis Produksi, Pemasaran, Keuangan, Amdal, Agunan dan makro ekonomi</p>', 1, 2),
(2, 1, '<p>Semakin tinggi posisi <em>leverage</em> perusahaan menujukkan bahwa :</p>', '<p>Pendanaan perusahaan semakin tergantung kepada external financing (hutang kepada pihak ketiga)</p>', '<p>Pendanaan perusahaan tidak tergantung kepada external financing (hutang kepada pihak ketiga)</p>', '<p>Posisi networth perusahaan yang lebih besar apabila dibandingkan dengan total external financing (hutang kepada pihak ketiga)</p>', '<p>Perolehan laba perusahaan yang semakin tinggi</p>', 1, 2),
(3, 1, '<p>Likuiditas perusahaan dapat dilihat pada laporan arus kas (cash flow statement), pada bagian :</p>', '<p>Operating Cash Flow</p>', '<p>Investing Cash Flow</p>', '<p>Financial Cash Flow</p>', '<p>Surplus Cash Flow</p>', 1, 2),
(4, 1, '<p>Selain mencerminkan likuiditas perusahaan yang cukup baik, Net Working Capital positif dapat memberi petunjuk bagi Bank yang akan membiayai Kredit Modal Kerja (KMK), bahwa perusahaan tersebut memiliki :</p>', '<p>Solvabilitas yang baik</p>', '<p>Profitabilitas yang baik</p>', '<p>Ketersediaan self financing atas pembiayaan KMK<em><br /></em></p>', '<p>Current Ratio yang kurang baik</p>', 3, 3),
(5, 1, '<p>Selain mencerminkan likuiditas perusahaan yang cukup baik, Net Working Capital positif dapat memberi petunjuk bagi Bank yang akan membiayai Kredit Modal Kerja (KMK), bahwa perusahaan tersebut memiliki :</p>', '<p>Solvabilitas yang baik</p>', '<p>Profitabilitas yang baik</p>', '<p>Ketersediaan self financing atas pembiayaan KMK<em><br /></em></p>', '<p>Current Ratio yang kurang baik</p>', 1, 3),
(6, 1, '<p>Tindakan pemantauan secara dini terhadap kredit dengan kolektibilitas 1 maupun 2, dengan tujuan untuk dapat segera &nbsp;dilakukan &nbsp;tindakan &nbsp;preventif &nbsp;untuk &nbsp;mencegah terjadinya <em>down grade</em> kolektibilitas, disebut :</p>', '<p>Annual Review</p>', '<p>On the spot</p>', '<p><em>Early</em> <em>Recognition</em> <em>Watch</em> <em>Lis</em><em>t</em></p>', '<p>Review account watch list</p>', 3, 3),
(7, 1, '<p>Monitoring atas kredit investasi harus dilakukan Bank secara ketat, khususnya untuk memastikan asumsi yang telah diyakini pada analisis kelayakan proyek. Apabila realisasi pelaksanaan pembangunan proyek mundur dari rencana, hal-hal yang harus menjadi perhatian utama adalah :</p>', '<p>Munculnya risiko penyelesaian proyek <em>(Contrsuction risk).<br /></em></p>', '<p>Bank harus melakukan perubahan Syarat dan Ketentuan Kredit sesuai dengan kondisi terkini.</p>', '<p>Bank perlu melakukan restrukturisasi kredit</p>', '<p>Bank akan menghentikan pencairan kredit</p>', 2, 4),
(8, 1, '<p><em>Periodical Review</em> merupakan sarana yang baik untuk melakukan <em>loan monitoring</em>, karena :</p>', '<p>Perkembangan bisnis debitur harus dimonitor secara ketat.</p>', '<p>Merupakan langkah awal untuk melakukan restrukturisasi kredit.</p>', '<p>Dapat memantau perkembangan dan kondisi debitur secara periodik, sehingga dapat diantisipasi perubahan yang berpengaruh terhadap pemenuhan kewajiban kredit.</p>', '<p>Memberi keyakinan pada Bank usaha debitur berjalan sesuai dengan rencana.</p>', 3, 4),
(9, 1, '<p>Manakah dari pernyataan dibawah ini, yang paling benar untuk menjelaskan <em>Debt Service Coverage Ratio (DSCR)</em> :</p>', '<p>DSCR pasti akan lebih besar dari 1x, apabila EBITDA positif.</p>', '<p>Apabila DSC &gt; 1x, debitur mampu memenuhi seluruh kewajiban kredit, baik angsuran pokok maupun bunga kredit.</p>', '<p>Apabila DSCR &lt; 1x, maka perusahaan pasti sedang mengalami kerugian <em>(operating icome negatif)</em></p>', '<p>Apabila <em>Free Cash Flow</em> positif, maka DCSR pasti akan lebih besar dari 1x.</p>', 2, 4),
(10, 1, '<p>Kemampuan perusahaan/ debitur dalam memenuhi kewajiban pokok dan bunga kredit dapat dilihat dari :</p>', '<p>Current Ratio</p>', '<p>Efficiency Ratio</p>', '<p>Debt Service Coverage Ratio</p>', '<p>Time Interest Earned/ Interest Coverage Ratio</p>', 3, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal_type`
--

CREATE TABLE `soal_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `threshold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soal_type`
--

INSERT INTO `soal_type` (`id`, `name`, `threshold`) VALUES
(2, 'Product Knowledge', 70),
(3, 'Credit Process & Analyst', 70),
(4, 'Policy & Regulation', 70);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(11) NOT NULL,
  `jml_soal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`) VALUES
(1, 'Assesment CMLD - 29 Aug 2019', '2019-09-14', 30, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', '524238e47f920ead930b892fbabfa8f0', 'admin'),
(2, 'Rukanda Faridsi', 'rukanda', 'ef88886f6700675eaa11a16174cc00eb', 'operator'),
(4, 'Ardy Winata', 'ardy', '1d6938247df828016cda2465c1c9de17', 'operator');

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
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
