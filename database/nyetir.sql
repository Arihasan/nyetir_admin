-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 02:17 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nyetir`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
`idadmin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `username` char(30) NOT NULL,
  `sandi` char(100) NOT NULL,
  `stts_admin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`idadmin`, `nama_admin`, `username`, `sandi`, `stts_admin`) VALUES
(1, 'Alfiras', 'alfiras', '25d55ad283aa400af464c76d713c07ad', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_mobil`
--

CREATE TABLE IF NOT EXISTS `t_jenis_mobil` (
`id_jenis` int(11) NOT NULL,
  `jns_mobil` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_mobil`
--

INSERT INTO `t_jenis_mobil` (`id_jenis`, `jns_mobil`) VALUES
(1, 'Manual'),
(2, 'Matic');

-- --------------------------------------------------------

--
-- Table structure for table `t_metode`
--

CREATE TABLE IF NOT EXISTS `t_metode` (
`id_metode` int(11) NOT NULL,
  `nm_metode` varchar(60) NOT NULL,
  `kode` varchar(60) NOT NULL,
  `jns_metode` int(11) NOT NULL DEFAULT '0',
  `ket` text NOT NULL,
  `stts_metode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_metode`
--

INSERT INTO `t_metode` (`id_metode`, `nm_metode`, `kode`, `jns_metode`, `ket`, `stts_metode`) VALUES
(5, 'OVO', '123 123 123 123', 1, '<p>Diskon 99%</p>', 0),
(6, 'BCA', '1234556', 0, '', 0),
(7, 'DANA', '67578678687', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_paket`
--

CREATE TABLE IF NOT EXISTS `t_paket` (
`id_paket` int(11) NOT NULL,
  `nm_paket` varchar(60) NOT NULL,
  `hrg_paket` int(11) NOT NULL,
  `dtl_paket` text NOT NULL,
  `stts_paket` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_paket`
--

INSERT INTO `t_paket` (`id_paket`, `nm_paket`, `hrg_paket`, `dtl_paket`, `stts_paket`) VALUES
(5, 'Paket 1', 250000, '<span xss="removed">4x Pertemuan </span>(Durasi 45 Menit) ', 0),
(6, 'Paket 2', 370000, '&nbsp;6x Pertemuan (Durasi 45 Menit)', 0),
(7, 'Paket 3', 500000, '<p><span xss="removed">8x Pertemuan </span>(Durasi 45 Menit)<br></p>', 0),
(8, 'Paket 4', 625000, '<span xss="removed"> 10x Pertemuan </span>(Durasi 45 Menit)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pendaftaran`
--

CREATE TABLE IF NOT EXISTS `t_pendaftaran` (
  `id_daftar` char(20) NOT NULL,
  `id_peserta` char(20) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_metode` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `sc_sim` text,
  `sc_ktp` text,
  `sc_bukti` text,
  `tgl_daftar` date NOT NULL,
  `tgl_jemput` date NOT NULL,
  `penjemputan` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `stts_daftar` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pendaftaran`
--

INSERT INTO `t_pendaftaran` (`id_daftar`, `id_peserta`, `id_paket`, `id_metode`, `id_jenis`, `sc_sim`, `sc_ktp`, `sc_bukti`, `tgl_daftar`, `tgl_jemput`, `penjemputan`, `idadmin`, `stts_daftar`, `created_at`, `updated_at`) VALUES
('T070520200002', 'P060520200002', 5, 7, 2, '4e0105e852b6767f7bcd627092c13700.jpg', '77d8f8d9fb99eb79a46f38602006fa03.jpg', 'e29c2414dd62c7b4803643888103d187.jpg', '2020-05-07', '2020-05-14', 5, 1, 2, '2020-05-07 07:55:19', '2020-05-07 11:28:05'),
('T070520200003', 'P060520200002', 6, 5, 2, 'b2b744e5c8bcd6bc70cc163a6bc20051.jpg', '94cc996f6e4bfb2bde3062eac5550475.png', 'd9ed0d25673db5d4fdf8f283e6fce6af.png', '2020-05-07', '2020-05-08', 0, 1, 3, '2020-05-07 08:34:18', '2020-05-07 11:13:55'),
('T070520200004', 'P070520200004', 5, 5, 1, '2fe92bd8553424c33ce484aced48f443.jpg', 'f76a318e91e936606c386ae372434417.png', '9ed455ee68a434525903756df6cd1db4.jpg', '2020-05-07', '2020-05-08', 5, 1, 3, '2020-05-07 09:09:53', '2020-05-07 11:43:06'),
('T240420200001', 'P240420200001', 5, 5, 1, 'f992a6aa7f3caf3d06e651b9590b1aa8.jpg', '5fccec655d9faa87ddf8299136f1977e.jpg', '6ab077275b376bfc3038a2a4cd522ec8.jpg', '2020-04-24', '2020-04-25', 5, 1, 3, '2020-04-24 06:15:28', '2020-04-24 06:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `t_penjemputan`
--

CREATE TABLE IF NOT EXISTS `t_penjemputan` (
`id_jemput` int(11) NOT NULL,
  `penjemputan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_penjemputan`
--

INSERT INTO `t_penjemputan` (`id_jemput`, `penjemputan`) VALUES
(5, '<p>Rumah gua</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_peserta`
--

CREATE TABLE IF NOT EXISTS `t_peserta` (
  `id_peserta` char(20) NOT NULL,
  `nik` char(16) NOT NULL,
  `nm_lgkp` varchar(60) NOT NULL,
  `no_hp` char(20) NOT NULL,
  `email` char(60) NOT NULL,
  `alamat` text NOT NULL,
  `sandi` text NOT NULL,
  `stts_peserta` int(11) NOT NULL DEFAULT '0',
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_peserta`
--

INSERT INTO `t_peserta` (`id_peserta`, `nik`, `nm_lgkp`, `no_hp`, `email`, `alamat`, `sandi`, `stts_peserta`, `tgl_daftar`) VALUES
('P060520200002', '111', 'Ari Hasan', '089646827817', 'ari_hasan76@yahoo.com', 'jl. parung kecamatan bogor', '81dc9bdb52d04dc20036dbd8313ed055', 0, '2020-05-06'),
('P070520200002', '13242424244', 'Jessy Malanie', '0898098097', 'rjessymalanie@gmail.com', 'tggdtfghgfhgfhgfhg', '81dc9bdb52d04dc20036dbd8313ed055', 0, '2020-05-07'),
('P070520200003', '1342134354365467', 'guaganteng', '089517647750', 'arihasan76@yahoo.com', 'parung', '25f9e794323b453885f5181f1b624d0b', 0, '2020-05-07'),
('P070520200004', '3535353454353543', 'rere', '0987654321', 'ari_hasan@yahoo.con', 'parung', '81dc9bdb52d04dc20036dbd8313ed055', 0, '2020-05-07'),
('P240420200001', '3174012811980001', 'Bagus alfiras', '081293739848', 'alfibagus130@gmail.com', 'Bumi', '66319925579acaf2fa423cd22a3dcc08', 0, '2020-04-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
 ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `t_jenis_mobil`
--
ALTER TABLE `t_jenis_mobil`
 ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `t_metode`
--
ALTER TABLE `t_metode`
 ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `t_paket`
--
ALTER TABLE `t_paket`
 ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `t_pendaftaran`
--
ALTER TABLE `t_pendaftaran`
 ADD PRIMARY KEY (`id_daftar`), ADD KEY `id_peserta` (`id_peserta`), ADD KEY `id_paket` (`id_paket`), ADD KEY `idadmin` (`idadmin`), ADD KEY `id_metode` (`id_metode`), ADD KEY `id_jenis` (`id_jenis`);

--
-- Indexes for table `t_penjemputan`
--
ALTER TABLE `t_penjemputan`
 ADD PRIMARY KEY (`id_jemput`);

--
-- Indexes for table `t_peserta`
--
ALTER TABLE `t_peserta`
 ADD PRIMARY KEY (`id_peserta`), ADD UNIQUE KEY `nik` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_jenis_mobil`
--
ALTER TABLE `t_jenis_mobil`
MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_metode`
--
ALTER TABLE `t_metode`
MODIFY `id_metode` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `t_paket`
--
ALTER TABLE `t_paket`
MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `t_penjemputan`
--
ALTER TABLE `t_penjemputan`
MODIFY `id_jemput` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_pendaftaran`
--
ALTER TABLE `t_pendaftaran`
ADD CONSTRAINT `t_pendaftaran_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `t_paket` (`id_paket`) ON UPDATE CASCADE,
ADD CONSTRAINT `t_pendaftaran_ibfk_2` FOREIGN KEY (`id_peserta`) REFERENCES `t_peserta` (`id_peserta`) ON UPDATE CASCADE,
ADD CONSTRAINT `t_pendaftaran_ibfk_3` FOREIGN KEY (`idadmin`) REFERENCES `t_admin` (`idadmin`) ON UPDATE CASCADE,
ADD CONSTRAINT `t_pendaftaran_ibfk_4` FOREIGN KEY (`id_metode`) REFERENCES `t_metode` (`id_metode`) ON UPDATE CASCADE,
ADD CONSTRAINT `t_pendaftaran_ibfk_5` FOREIGN KEY (`id_jenis`) REFERENCES `t_jenis_mobil` (`id_jenis`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
