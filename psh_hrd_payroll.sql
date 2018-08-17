-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 17. Agustus 2018 jam 18:47
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `psh_hrd_payroll`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_data_transaction`
--

CREATE TABLE IF NOT EXISTS `log_data_transaction` (
  `id_log_master` int(11) NOT NULL AUTO_INCREMENT,
  `primary_id` int(11) NOT NULL,
  `nama_table` varchar(100) NOT NULL,
  `action` enum('CREATE','UPDATE','DELETE') NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_log_master`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_bank`
--

CREATE TABLE IF NOT EXISTS `mst_bank` (
  `id_bank` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(100) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_bank`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `mst_bank`
--

INSERT INTO `mst_bank` (`id_bank`, `nama_bank`, `aktif`) VALUES
(1, 'CIMB NIAGA', 'YA'),
(2, 'BCA', 'YA'),
(3, 'Mandiri', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_config_jamsostek`
--

CREATE TABLE IF NOT EXISTS `mst_config_jamsostek` (
  `id_config_jamsostek` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('TUNJANGAN','POTONGAN') NOT NULL,
  `jumlah` float NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_config_jamsostek`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `mst_config_jamsostek`
--

INSERT INTO `mst_config_jamsostek` (`id_config_jamsostek`, `jenis`, `jumlah`, `aktif`) VALUES
(1, 'TUNJANGAN', 4.89, 'YA'),
(2, 'POTONGAN', 2, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_config_meal`
--

CREATE TABLE IF NOT EXISTS `mst_config_meal` (
  `id_config_meal` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah` int(11) NOT NULL,
  `jumlah_hari` tinyint(2) NOT NULL DEFAULT '26',
  PRIMARY KEY (`id_config_meal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `mst_config_meal`
--

INSERT INTO `mst_config_meal` (`id_config_meal`, `jumlah`, `jumlah_hari`) VALUES
(1, 11000, 26);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_departemen`
--

CREATE TABLE IF NOT EXISTS `mst_departemen` (
  `id_departemen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_departemen` varchar(100) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_departemen`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `mst_departemen`
--

INSERT INTO `mst_departemen` (`id_departemen`, `nama_departemen`, `aktif`) VALUES
(1, 'Food And Beverage', 'YA'),
(2, 'Front Office', 'YA'),
(3, 'Accounting', 'YA'),
(4, 'HRD', 'YA'),
(5, 'UMUM', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_jabatan`
--

CREATE TABLE IF NOT EXISTS `mst_jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(100) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `mst_jabatan`
--

INSERT INTO `mst_jabatan` (`id_jabatan`, `nama_jabatan`, `id_departemen`, `aktif`) VALUES
(1, 'Admin', 4, 'YA'),
(2, 'Supervisor', 4, 'YA'),
(3, 'ADMIN', 5, 'YA'),
(4, 'manager', 5, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_kabupaten_kota`
--

CREATE TABLE IF NOT EXISTS `mst_kabupaten_kota` (
  `id_kabupaten_kota` int(11) unsigned NOT NULL,
  `nama_kabupaten_kota` varchar(50) DEFAULT NULL,
  `status_daerah` set('Kabupaten','Kota') DEFAULT 'Kabupaten',
  `id_propinsi` int(11) DEFAULT NULL,
  `aktif` enum('YA','TIDAK') DEFAULT 'YA',
  PRIMARY KEY (`id_kabupaten_kota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `mst_kabupaten_kota`
--

INSERT INTO `mst_kabupaten_kota` (`id_kabupaten_kota`, `nama_kabupaten_kota`, `status_daerah`, `id_propinsi`, `aktif`) VALUES
(1, 'Kab. Aceh Barat', 'Kabupaten', 1, 'YA'),
(2, 'Kota Banda Aceh', 'Kota', 1, 'YA'),
(3, 'Kab. Aceh Barat Daya', 'Kabupaten', 1, 'YA'),
(4, 'Kota Subulussalam', 'Kota', 1, 'YA'),
(5, 'Kab. Aceh Besar', 'Kabupaten', 1, 'YA'),
(6, 'Kota Langsa', 'Kota', 1, 'YA'),
(7, 'Kab. Aceh Jaya', 'Kabupaten', 1, 'YA'),
(8, 'Kota Lhokseumawe', 'Kota', 1, 'YA'),
(9, 'Kab. Aceh Selatan', 'Kabupaten', 1, 'YA'),
(10, 'Kota Sabang', 'Kota', 1, 'YA'),
(11, 'Kab. Aceh Singkil', 'Kabupaten', 1, 'YA'),
(12, 'Kab. Aceh Tamiang', 'Kabupaten', 1, 'YA'),
(13, 'Kab. Aceh Tengah', 'Kabupaten', 1, 'YA'),
(14, 'Kab. Aceh Tenggara', 'Kabupaten', 1, 'YA'),
(15, 'Kab. Aceh Timur', 'Kabupaten', 1, 'YA'),
(16, 'Kab. Aceh Utara', 'Kabupaten', 1, 'YA'),
(17, 'Kab. Bener Meriah', 'Kabupaten', 1, 'YA'),
(18, 'Kab. Bireun', 'Kabupaten', 1, 'YA'),
(19, 'Kab. Gayo Lues', 'Kabupaten', 1, 'YA'),
(20, 'Kab. Nagan Raya', 'Kabupaten', 1, 'YA'),
(21, 'Kab. Pidie', 'Kabupaten', 1, 'YA'),
(22, 'Kab. Pidie Jaya', 'Kabupaten', 1, 'YA'),
(23, 'Kab. Simeulue', 'Kabupaten', 1, 'YA'),
(24, 'Kab. Asahan', 'Kabupaten', 2, 'YA'),
(25, 'Kota Medan', 'Kota', 2, 'YA'),
(26, 'Kab. Batubara', 'Kabupaten', 2, 'YA'),
(27, 'Kota Binjai', 'Kota', 2, 'YA'),
(28, 'Kab. Dairi', 'Kabupaten', 2, 'YA'),
(29, 'Kota Padang Sidempuan', 'Kota', 2, 'YA'),
(30, 'Kab. Deliserdang', 'Kabupaten', 2, 'YA'),
(31, 'Kota Pematang Siantar', 'Kota', 2, 'YA'),
(32, 'Kab. Humbang Hasundutan', 'Kabupaten', 2, 'YA'),
(33, 'Kota Sibolga', 'Kota', 2, 'YA'),
(34, 'Kab. Karo', 'Kabupaten', 2, 'YA'),
(35, 'Kota Tanjung Balai', 'Kota', 2, 'YA'),
(36, 'Kab. Labuhanbatu', 'Kabupaten', 2, 'YA'),
(37, 'Kota Tebing Tinggi', 'Kota', 2, 'YA'),
(38, 'Kab. Langkat', 'Kabupaten', 2, 'YA'),
(39, 'Kab. Mandailing Natal', 'Kabupaten', 2, 'YA'),
(40, 'Kab. Nias', 'Kabupaten', 2, 'YA'),
(41, 'Kab. Nias Selatan', 'Kabupaten', 2, 'YA'),
(42, 'Kab. Pakpak Bharat', 'Kabupaten', 2, 'YA'),
(43, 'Kab. Samosir', 'Kabupaten', 2, 'YA'),
(44, 'Kab. Serdang Bedagai', 'Kabupaten', 2, 'YA'),
(45, 'Kab. Simalungun', 'Kabupaten', 2, 'YA'),
(46, 'Kab. Tapanuli Selatan', 'Kabupaten', 2, 'YA'),
(47, 'Kab. Tapanuli Tengah', 'Kabupaten', 2, 'YA'),
(48, 'Kab. Tapanuli Utara', 'Kabupaten', 2, 'YA'),
(49, 'Kab. Toba Samosir', 'Kabupaten', 2, 'YA'),
(50, 'Kab. Padang Lawas Utara', 'Kabupaten', 2, 'YA'),
(51, 'Kab. Padang Lawas', 'Kabupaten', 2, 'YA'),
(52, 'Kab. Labuhanbatu Utara', 'Kabupaten', 2, 'YA'),
(53, 'Kab. Labuhanbatu Selatan', 'Kabupaten', 2, 'YA'),
(54, 'Kab. Nias Barat*', 'Kabupaten', 2, 'YA'),
(55, 'Kab. Nias Utara*', 'Kabupaten', 2, 'YA'),
(56, 'Kab. Gunung Sitoli*', 'Kabupaten', 2, 'YA'),
(57, 'Kab. Agam', 'Kabupaten', 3, 'YA'),
(58, 'Kota Padang', 'Kota', 3, 'YA'),
(59, 'Kab. Dharmasraya', 'Kabupaten', 3, 'YA'),
(60, 'Kota Bukit Tinggi', 'Kota', 3, 'YA'),
(61, 'Kab. Limapuluhkota', 'Kabupaten', 3, 'YA'),
(62, 'Kota Pandang Panjang', 'Kota', 3, 'YA'),
(63, 'Kab. Kep. Mentawai', 'Kabupaten', 3, 'YA'),
(64, 'Kota Pariaman', 'Kota', 3, 'YA'),
(65, 'Kab. Padang Pariaman', 'Kabupaten', 3, 'YA'),
(66, 'Kota Payakumbuh', 'Kota', 3, 'YA'),
(67, 'Kab. Pasaman', 'Kabupaten', 3, 'YA'),
(68, 'Kota Sawahlunto', 'Kota', 3, 'YA'),
(69, 'Kab. Pasaman Barat', 'Kabupaten', 3, 'YA'),
(70, 'Kota Solok', 'Kota', 3, 'YA'),
(71, 'Kab. Pesisir Selatan', 'Kabupaten', 3, 'YA'),
(72, 'Kab. Sawahlunto Sijunjung', 'Kabupaten', 3, 'YA'),
(73, 'Kab. Solok', 'Kabupaten', 3, 'YA'),
(74, 'Kab. Solok Selatan', 'Kabupaten', 3, 'YA'),
(75, 'Kab. Tanah Datar', 'Kabupaten', 3, 'YA'),
(76, 'Kab. Bengkalis', 'Kabupaten', 4, 'YA'),
(77, 'Kota Pekanbaru', 'Kota', 4, 'YA'),
(78, 'Kab. Indragiri Hilir', 'Kabupaten', 4, 'YA'),
(79, 'Kota Dumai', 'Kota', 4, 'YA'),
(80, 'Kab. Indragiri Hulu', 'Kabupaten', 4, 'YA'),
(81, 'Kab. Kampar', 'Kabupaten', 4, 'YA'),
(82, 'Kab. Kuantan Singingi', 'Kabupaten', 4, 'YA'),
(83, 'Kab. Pelalawan', 'Kabupaten', 4, 'YA'),
(84, 'Kab. Rokan Hulu', 'Kabupaten', 4, 'YA'),
(85, 'Kab. Rokan Hilir', 'Kabupaten', 4, 'YA'),
(86, 'Kab. Siak', 'Kabupaten', 4, 'YA'),
(87, 'Kab. Kep. Meranti*', 'Kabupaten', 4, 'YA'),
(88, 'Kab. Batanghari', 'Kabupaten', 5, 'YA'),
(89, 'Kota Jambi', 'Kota', 5, 'YA'),
(90, 'Kab. Bungo', 'Kabupaten', 5, 'YA'),
(91, 'Kota Sungai Penuh', 'Kota', 5, 'YA'),
(92, 'Kab. Kerinci', 'Kabupaten', 5, 'YA'),
(93, 'Kab. Merangin', 'Kabupaten', 5, 'YA'),
(94, 'Kab. Muaro Jambi', 'Kabupaten', 5, 'YA'),
(95, 'Kab. Sarolangun', 'Kabupaten', 5, 'YA'),
(96, 'Kab. Tanjung Jabung Barat', 'Kabupaten', 5, 'YA'),
(97, 'Kab. Tanjung Jabung Timur', 'Kabupaten', 5, 'YA'),
(98, 'Kab. Tebo', 'Kabupaten', 5, 'YA'),
(99, 'Kab. Banyuasin', 'Kabupaten', 6, 'YA'),
(100, 'Kota Palembang', 'Kota', 6, 'YA'),
(101, 'Kab. Lahat', 'Kabupaten', 6, 'YA'),
(102, 'Kota Lubuk Linggau', 'Kota', 6, 'YA'),
(103, 'Kab. Empat Lawang', 'Kabupaten', 6, 'YA'),
(104, 'Kota Pagar Alam', 'Kota', 6, 'YA'),
(105, 'Kab. Muara Enim', 'Kabupaten', 6, 'YA'),
(106, 'Kota Prabumulih', 'Kota', 6, 'YA'),
(107, 'Kab. Musi Banyuasin', 'Kabupaten', 6, 'YA'),
(108, 'Kab. Musi Rawas', 'Kabupaten', 6, 'YA'),
(109, 'Kab. Ogan Ilir', 'Kabupaten', 6, 'YA'),
(110, 'Kab. OKI', 'Kabupaten', 6, 'YA'),
(111, 'Kab. OKU', 'Kabupaten', 6, 'YA'),
(112, 'Kab. OKU Selatan', 'Kabupaten', 6, 'YA'),
(113, 'Kab. OKU Timur', 'Kabupaten', 6, 'YA'),
(114, 'Kab. Bengkulu Selatan', 'Kabupaten', 7, 'YA'),
(115, 'Kota Bengkulu', 'Kota', 7, 'YA'),
(116, 'Kab. Bengkulu Utara', 'Kabupaten', 7, 'YA'),
(117, 'Kab. Kaur', 'Kabupaten', 7, 'YA'),
(118, 'Kab. Kepahiang', 'Kabupaten', 7, 'YA'),
(119, 'Kab. Lebong', 'Kabupaten', 7, 'YA'),
(120, 'Kab. Muko-Muko', 'Kabupaten', 7, 'YA'),
(121, 'Kab. Rejang Lebong', 'Kabupaten', 7, 'YA'),
(122, 'Kab. Seluma', 'Kabupaten', 7, 'YA'),
(123, 'Kab. Bengkulu Tengah', 'Kabupaten', 7, 'YA'),
(124, 'Kab. Lampung Barat', 'Kabupaten', 8, 'YA'),
(125, 'Kota Bandarlampung', 'Kota', 8, 'YA'),
(126, 'Kab. Lampung Selatan', 'Kabupaten', 8, 'YA'),
(127, 'Kota Metro', 'Kota', 8, 'YA'),
(128, 'Kab. Lampung Tengah', 'Kabupaten', 8, 'YA'),
(129, 'Kab. Lampung Timur', 'Kabupaten', 8, 'YA'),
(130, 'Kab. Lampung Utara', 'Kabupaten', 8, 'YA'),
(131, 'Kab. Tanggamus', 'Kabupaten', 8, 'YA'),
(132, 'Kab. Tulang Bawang', 'Kabupaten', 8, 'YA'),
(133, 'Kab. Way Kanan', 'Kabupaten', 8, 'YA'),
(134, 'Kab. Pesawaran', 'Kabupaten', 8, 'YA'),
(135, 'Kab. Pringsewu', 'Kabupaten', 8, 'YA'),
(136, 'Kab. Mesuji', 'Kabupaten', 8, 'YA'),
(137, 'Kab. Tulang Bawang Barat', 'Kabupaten', 8, 'YA'),
(138, 'Kab. Bangka', 'Kabupaten', 9, 'YA'),
(139, 'Kota Pangkalpinang', 'Kota', 9, 'YA'),
(140, 'Kab. Bangka Barat', 'Kabupaten', 9, 'YA'),
(141, 'Kab. Bangka Selatan', 'Kabupaten', 9, 'YA'),
(142, 'Kab. Bangka Tengah', 'Kabupaten', 9, 'YA'),
(143, 'Kab. Belitung', 'Kabupaten', 9, 'YA'),
(144, 'Kab. Belitung Timur', 'Kabupaten', 9, 'YA'),
(145, 'Kab. Karimun', 'Kabupaten', 10, 'YA'),
(146, 'Kota Tanjungpinang', 'Kota', 10, 'YA'),
(147, 'Kab. Bintan (Kep. Riau)', 'Kabupaten', 10, 'YA'),
(148, 'Kota Batam', 'Kota', 10, 'YA'),
(149, 'Kab. Lingga', 'Kabupaten', 10, 'YA'),
(150, 'Kab. Natuna', 'Kabupaten', 10, 'YA'),
(151, 'Kab. Kep. Anambas', 'Kabupaten', 10, 'YA'),
(152, 'Kab. Kepulauan Seribu', 'Kabupaten', 11, 'YA'),
(153, 'Jakarta Barat', 'Kota', 11, 'YA'),
(154, 'Jakarta Pusat', 'Kota', 11, 'YA'),
(155, 'Jakarta Selatan', 'Kota', 11, 'YA'),
(156, 'Jakarta Timur', 'Kota', 11, 'YA'),
(157, 'Jakarta Utara', 'Kota', 11, 'YA'),
(158, 'Kab. Bandung', 'Kabupaten', 12, 'YA'),
(159, 'Kota Bandung', 'Kota', 12, 'YA'),
(160, 'Kab. Bandung Barat', 'Kabupaten', 12, 'YA'),
(161, 'Kota Banjar', 'Kota', 12, 'YA'),
(162, 'Kab. Bekasi', 'Kabupaten', 12, 'YA'),
(163, 'Kota Bekasi', 'Kota', 12, 'YA'),
(164, 'Kab. Bogor', 'Kabupaten', 12, 'YA'),
(165, 'Kota Bogor', 'Kota', 12, 'YA'),
(166, 'Kab. Ciamis', 'Kabupaten', 12, 'YA'),
(167, 'Kota Cimahi', 'Kota', 12, 'YA'),
(168, 'Kab. Cianjur', 'Kabupaten', 12, 'YA'),
(169, 'Kota Cirebon', 'Kota', 12, 'YA'),
(170, 'Kab. Cirebon', 'Kabupaten', 12, 'YA'),
(171, 'Kota Depok', 'Kota', 12, 'YA'),
(172, 'Kab. Garut', 'Kabupaten', 12, 'YA'),
(173, 'Kota Sukabumi', 'Kota', 12, 'YA'),
(174, 'Kab. Indramayu', 'Kabupaten', 12, 'YA'),
(175, 'Kota Tasikmalaya', 'Kota', 12, 'YA'),
(176, 'Kab. Karawang', 'Kabupaten', 12, 'YA'),
(177, 'Kab. Kuningan', 'Kabupaten', 12, 'YA'),
(178, 'Kab. Majalengka', 'Kabupaten', 12, 'YA'),
(179, 'Kab. Purwakarta', 'Kabupaten', 12, 'YA'),
(180, 'Kab. Subang', 'Kabupaten', 12, 'YA'),
(181, 'Kab. Sukabumi', 'Kabupaten', 12, 'YA'),
(182, 'Kab. Sumedang', 'Kabupaten', 12, 'YA'),
(183, 'Kab. Tasikmalaya', 'Kabupaten', 12, 'YA'),
(184, 'Kab. Banjarnegara', 'Kabupaten', 13, 'YA'),
(185, 'Kota Semarang', 'Kota', 13, 'YA'),
(186, 'Kab. Banyumas', 'Kabupaten', 13, 'YA'),
(187, 'Kota Magelang', 'Kota', 13, 'YA'),
(188, 'Kab. Batang', 'Kabupaten', 13, 'YA'),
(189, 'Kota Pekalongan', 'Kota', 13, 'YA'),
(190, 'Kab. Blora', 'Kabupaten', 13, 'YA'),
(191, 'Kota Salatiga', 'Kota', 13, 'YA'),
(192, 'Kab. Boyolali', 'Kabupaten', 13, 'YA'),
(193, 'Kota Surakarta', 'Kota', 13, 'YA'),
(194, 'Kab. Brebes', 'Kabupaten', 13, 'YA'),
(195, 'Kota Tegal', 'Kota', 13, 'YA'),
(196, 'Kab. Cilacap', 'Kabupaten', 13, 'YA'),
(197, 'Kab. Demak', 'Kabupaten', 13, 'YA'),
(198, 'Kab. Grobogan', 'Kabupaten', 13, 'YA'),
(199, 'Kab. Jepara', 'Kabupaten', 13, 'YA'),
(200, 'Kab. Karanganyar', 'Kabupaten', 13, 'YA'),
(201, 'Kab. Kebumen', 'Kabupaten', 13, 'YA'),
(202, 'Kab. Kendal', 'Kabupaten', 13, 'YA'),
(203, 'Kab. Klaten', 'Kabupaten', 13, 'YA'),
(204, 'Kab. Kudus', 'Kabupaten', 13, 'YA'),
(205, 'Kab. Magelang', 'Kabupaten', 13, 'YA'),
(206, 'Kab. Pati', 'Kabupaten', 13, 'YA'),
(207, 'Kab. Pekalongan', 'Kabupaten', 13, 'YA'),
(208, 'Kab. Pemalang', 'Kabupaten', 13, 'YA'),
(209, 'Kab. Purbalingga', 'Kabupaten', 13, 'YA'),
(210, 'Kab. Purworejo', 'Kabupaten', 13, 'YA'),
(211, 'Kab. Rembang', 'Kabupaten', 13, 'YA'),
(212, 'Kab. Semarang', 'Kabupaten', 13, 'YA'),
(213, 'Kab. Sragen', 'Kabupaten', 13, 'YA'),
(214, 'Kab. Sukoharjo', 'Kabupaten', 13, 'YA'),
(215, 'Kab. Tegal', 'Kabupaten', 13, 'YA'),
(216, 'Kab. Temanggung', 'Kabupaten', 13, 'YA'),
(217, 'Kab. Wonogiri', 'Kabupaten', 13, 'YA'),
(218, 'Kab. Wonosobo', 'Kabupaten', 13, 'YA'),
(219, 'Kab. Lebak', 'Kabupaten', 14, 'YA'),
(220, 'Kota Tanggerang', 'Kota', 14, 'YA'),
(221, 'Kab. Pandeglang', 'Kabupaten', 14, 'YA'),
(222, 'Kota Cilegon', 'Kota', 14, 'YA'),
(223, 'Kab. Serang', 'Kabupaten', 14, 'YA'),
(224, 'Kota Serang', 'Kota', 14, 'YA'),
(225, 'Kab. Tangerang', 'Kabupaten', 14, 'YA'),
(226, 'Kota Tanggerang Sltn', 'Kota', 14, 'YA'),
(227, 'Kab. Bangkalan', 'Kabupaten', 15, 'YA'),
(228, 'Kota Surabaya', 'Kota', 15, 'YA'),
(229, 'Kab. Banyuwangi', 'Kabupaten', 15, 'YA'),
(230, 'Kota Batu', 'Kota', 15, 'YA'),
(231, 'Kab. Blitar', 'Kabupaten', 15, 'YA'),
(232, 'Kota Blitar', 'Kota', 15, 'YA'),
(233, 'Kab. Bojonegoro', 'Kabupaten', 15, 'YA'),
(234, 'Kota Kediri', 'Kota', 15, 'YA'),
(235, 'Kab. Bondowoso', 'Kabupaten', 15, 'YA'),
(236, 'Kota Madiun', 'Kota', 15, 'YA'),
(237, 'Kab. Gresik', 'Kabupaten', 15, 'YA'),
(238, 'Kota Malang', 'Kota', 15, 'YA'),
(239, 'Kab. Jember', 'Kabupaten', 15, 'YA'),
(240, 'Kota Mojokerto', 'Kota', 15, 'YA'),
(241, 'Kab. Jombang', 'Kabupaten', 15, 'YA'),
(242, 'Kota Pasuruan', 'Kota', 15, 'YA'),
(243, 'Kab. Kediri', 'Kabupaten', 15, 'YA'),
(244, 'Kota Probolinggo', 'Kota', 15, 'YA'),
(245, 'Kab. Lamongan', 'Kabupaten', 15, 'YA'),
(246, 'Kab. Lumajang', 'Kabupaten', 15, 'YA'),
(247, 'Kab. Madiun', 'Kabupaten', 15, 'YA'),
(248, 'Kab. Magetan', 'Kabupaten', 15, 'YA'),
(249, 'Kab. Malang', 'Kabupaten', 15, 'YA'),
(250, 'Kab. Mojokerto', 'Kabupaten', 15, 'YA'),
(251, 'Kab. Nganjuk', 'Kabupaten', 15, 'YA'),
(252, 'Kab. Ngawi', 'Kabupaten', 15, 'YA'),
(253, 'Kab. Pacitan', 'Kabupaten', 15, 'YA'),
(254, 'Kab. Pamekasan', 'Kabupaten', 15, 'YA'),
(255, 'Kab. Pasuruan', 'Kabupaten', 15, 'YA'),
(256, 'Kab. Ponorogo', 'Kabupaten', 15, 'YA'),
(257, 'Kab. Probolinggo', 'Kabupaten', 15, 'YA'),
(258, 'Kab. Sampang', 'Kabupaten', 15, 'YA'),
(259, 'Kab. Sidoarjo', 'Kabupaten', 15, 'YA'),
(260, 'Kab. Situbondo', 'Kabupaten', 15, 'YA'),
(261, 'Kab. Sumenep', 'Kabupaten', 15, 'YA'),
(262, 'Kab. Trenggalek', 'Kabupaten', 15, 'YA'),
(263, 'Kab. Tulungagung', 'Kabupaten', 15, 'YA'),
(264, 'Kab. Tuban', 'Kabupaten', 15, 'YA'),
(265, 'Kab. Bantul', 'Kabupaten', 16, 'YA'),
(266, 'Kota Yogyakarta', 'Kota', 16, 'YA'),
(267, 'Kab. Gunung Kidul', 'Kabupaten', 16, 'YA'),
(268, 'Kab. Kulon Progo', 'Kabupaten', 16, 'YA'),
(269, 'Kab. Sleman', 'Kabupaten', 16, 'YA'),
(270, 'Kab. Badung', 'Kabupaten', 17, 'YA'),
(271, 'Kota Denpasar', 'Kota', 17, 'YA'),
(272, 'Kab. Bangli', 'Kabupaten', 17, 'YA'),
(273, 'Kab. Buleleng', 'Kabupaten', 17, 'YA'),
(274, 'Kab. Gianyar', 'Kabupaten', 17, 'YA'),
(275, 'Kab. Jembrana', 'Kabupaten', 17, 'YA'),
(276, 'Kab. Karang Asem', 'Kabupaten', 17, 'YA'),
(277, 'Kab. Klungkung', 'Kabupaten', 17, 'YA'),
(278, 'Kab. Tabanan', 'Kabupaten', 17, 'YA'),
(279, 'Kab. Bima', 'Kabupaten', 18, 'YA'),
(280, 'Kota Mataram', 'Kota', 18, 'YA'),
(281, 'Kab. Dompu', 'Kabupaten', 18, 'YA'),
(282, 'Kota Bima', 'Kota', 18, 'YA'),
(283, 'Kab. Lombok Barat', 'Kabupaten', 18, 'YA'),
(284, 'Kab. Lombok Tengah', 'Kabupaten', 18, 'YA'),
(285, 'Kab. Lombok Timur', 'Kabupaten', 18, 'YA'),
(286, 'Kab. Sumbawa', 'Kabupaten', 18, 'YA'),
(287, 'Kab. Sumbawa Barat', 'Kabupaten', 18, 'YA'),
(288, 'Kab. Lombok Utara', 'Kabupaten', 18, 'YA'),
(289, 'Kab. Alor', 'Kabupaten', 19, 'YA'),
(290, 'Kota Kupang', 'Kota', 19, 'YA'),
(291, 'Kab. Belu', 'Kabupaten', 19, 'YA'),
(292, 'Kab. Ende', 'Kabupaten', 19, 'YA'),
(293, 'Kab. Flores Timur', 'Kabupaten', 19, 'YA'),
(294, 'Kab. Kupang', 'Kabupaten', 19, 'YA'),
(295, 'Kab. Lembata', 'Kabupaten', 19, 'YA'),
(296, 'Kab. Manggarai', 'Kabupaten', 19, 'YA'),
(297, 'Kab. Manggarai Barat', 'Kabupaten', 19, 'YA'),
(298, 'Kab. Ngada', 'Kabupaten', 19, 'YA'),
(299, 'Kab. Nagekeo', 'Kabupaten', 19, 'YA'),
(300, 'Kab. Rote Ndao', 'Kabupaten', 19, 'YA'),
(301, 'Kab. Sikka', 'Kabupaten', 19, 'YA'),
(302, 'Kab. Sumba Barat', 'Kabupaten', 19, 'YA'),
(303, 'Kab. Sumba Barat Daya', 'Kabupaten', 19, 'YA'),
(304, 'Kab. Sumba Tengah', 'Kabupaten', 19, 'YA'),
(305, 'Kab. Manggarai Timur', 'Kabupaten', 19, 'YA'),
(306, 'Kab. Sumba Timur', 'Kabupaten', 19, 'YA'),
(307, 'Kab. Timor Tengah Selatan', 'Kabupaten', 19, 'YA'),
(308, 'Kab. Timor Tengah Utara', 'Kabupaten', 19, 'YA'),
(309, 'Kab. Sabu Raijua*', 'Kabupaten', 19, 'YA'),
(310, 'Kab. Bengkayang', 'Kabupaten', 20, 'YA'),
(311, 'Kota Pontianak', 'Kota', 20, 'YA'),
(312, 'Kab. Kapuas Hulu', 'Kabupaten', 20, 'YA'),
(313, 'Kota Singkawang', 'Kota', 20, 'YA'),
(314, 'Kab. Ketapang', 'Kabupaten', 20, 'YA'),
(315, 'Kab. Kayong Utara', 'Kabupaten', 20, 'YA'),
(316, 'Kab. Kubu Raya', 'Kabupaten', 20, 'YA'),
(317, 'Kab. Landak', 'Kabupaten', 20, 'YA'),
(318, 'Kab. Melawi', 'Kabupaten', 20, 'YA'),
(319, 'Kab. Pontianak', 'Kabupaten', 20, 'YA'),
(320, 'Kab. Sambas', 'Kabupaten', 20, 'YA'),
(321, 'Kab. Sanggau', 'Kabupaten', 20, 'YA'),
(322, 'Kab. Sintang', 'Kabupaten', 20, 'YA'),
(323, 'Kab. Sekadau', 'Kabupaten', 20, 'YA'),
(324, 'Kab. Barito Selatan', 'Kabupaten', 21, 'YA'),
(325, 'Kota Palangkaraya', 'Kota', 21, 'YA'),
(326, 'Kab. Barito Timur', 'Kabupaten', 21, 'YA'),
(327, 'Kab. Barito Utara', 'Kabupaten', 21, 'YA'),
(328, 'Kab. Gunung Mas', 'Kabupaten', 21, 'YA'),
(329, 'Kab. Kapuas', 'Kabupaten', 21, 'YA'),
(330, 'Kab. Katingan', 'Kabupaten', 21, 'YA'),
(331, 'Kab. Kotawaringin Barat', 'Kabupaten', 21, 'YA'),
(332, 'Kab. Kotawaringin Timur', 'Kabupaten', 21, 'YA'),
(333, 'Kab. Lamandau', 'Kabupaten', 21, 'YA'),
(334, 'Kab. Murung Raya', 'Kabupaten', 21, 'YA'),
(335, 'Kab. Pulang Pisau', 'Kabupaten', 21, 'YA'),
(336, 'Kab. Seruyan', 'Kabupaten', 21, 'YA'),
(337, 'Kab. Sukamara', 'Kabupaten', 21, 'YA'),
(338, 'Kab. Balangan', 'Kabupaten', 22, 'YA'),
(339, 'Kota Banjarmasin', 'Kota', 22, 'YA'),
(340, 'Kab. Banjar', 'Kabupaten', 22, 'YA'),
(341, 'Kota Banjar Baru', 'Kota', 22, 'YA'),
(342, 'Kab. Barito Kuala', 'Kabupaten', 22, 'YA'),
(343, 'Kab. Hulu Sungai Selatan', 'Kabupaten', 22, 'YA'),
(344, 'Kab. Hulu Sungai Tengah', 'Kabupaten', 22, 'YA'),
(345, 'Kab. Hulu Sungai Utara', 'Kabupaten', 22, 'YA'),
(346, 'Kab. Kotabaru', 'Kabupaten', 22, 'YA'),
(347, 'Kab. Tabalong', 'Kabupaten', 22, 'YA'),
(348, 'Kab. Tanah Bumbu', 'Kabupaten', 22, 'YA'),
(349, 'Kab. Tanah Laut', 'Kabupaten', 22, 'YA'),
(350, 'Kab. Tapin', 'Kabupaten', 22, 'YA'),
(351, 'Kab. Berau', 'Kabupaten', 23, 'YA'),
(352, 'Kota Samarinda', 'Kota', 23, 'YA'),
(353, 'Kab. Bulungan', 'Kabupaten', 23, 'YA'),
(354, 'Kota Balikpapan', 'Kota', 23, 'YA'),
(355, 'Kab. Tanah Tidung', 'Kabupaten', 23, 'YA'),
(356, 'Kota Bontang', 'Kota', 23, 'YA'),
(357, 'Kab. Kutai Barat', 'Kabupaten', 23, 'YA'),
(358, 'Kota Tarakan', 'Kota', 23, 'YA'),
(359, 'Kab. Kutai Kertanegara', 'Kabupaten', 23, 'YA'),
(360, 'Kab. Kutai Timur', 'Kabupaten', 23, 'YA'),
(361, 'Kab. Malinau', 'Kabupaten', 23, 'YA'),
(362, 'Kab. Nunukan', 'Kabupaten', 23, 'YA'),
(363, 'Kab. Penajam Paser Utara', 'Kabupaten', 23, 'YA'),
(364, 'Kab. Pasir', 'Kabupaten', 23, 'YA'),
(365, 'Kab. Bolaangmongondow', 'Kabupaten', 24, 'YA'),
(366, 'Kota Manado', 'Kota', 24, 'YA'),
(367, 'Kab. Bolaangmongondow Utara', 'Kabupaten', 24, 'YA'),
(368, 'Kota Kotamobagu', 'Kota', 24, 'YA'),
(369, 'Kab. Minahasa', 'Kabupaten', 24, 'YA'),
(370, 'Kota Bitung', 'Kota', 24, 'YA'),
(371, 'Kab. Mitra', 'Kabupaten', 24, 'YA'),
(372, 'Kota Tomohon', 'Kota', 24, 'YA'),
(373, 'Kab. Minahasa Selatan', 'Kabupaten', 24, 'YA'),
(374, 'Kab. Minahasa Utara', 'Kabupaten', 24, 'YA'),
(375, 'Kab. Sangihe Talaud', 'Kabupaten', 24, 'YA'),
(376, 'Kab. Kep. Talaud', 'Kabupaten', 24, 'YA'),
(377, 'Kab. Kep. Sitaro', 'Kabupaten', 24, 'YA'),
(378, 'Kab. Bolaangmongondow Timur', 'Kabupaten', 24, 'YA'),
(379, 'Kab. Bolaangmongondow Selatan', 'Kabupaten', 24, 'YA'),
(380, 'Kab. Banggai', 'Kabupaten', 25, 'YA'),
(381, 'Kota Palu', 'Kota', 25, 'YA'),
(382, 'Kab. Banggai Kepulauan', 'Kabupaten', 25, 'YA'),
(383, 'Kab. Buol', 'Kabupaten', 25, 'YA'),
(384, 'Kab. Donggala', 'Kabupaten', 25, 'YA'),
(385, 'Kab. Morowali', 'Kabupaten', 25, 'YA'),
(386, 'Kab. Parigi Mountong', 'Kabupaten', 25, 'YA'),
(387, 'Kab. Poso', 'Kabupaten', 25, 'YA'),
(388, 'Kab. Tojo Una-Una', 'Kabupaten', 25, 'YA'),
(389, 'Kab. Toli-Toli', 'Kabupaten', 25, 'YA'),
(390, 'Kab. Sigi', 'Kabupaten', 25, 'YA'),
(391, 'Kab. Selayar', 'Kabupaten', 26, 'YA'),
(392, 'Kota Makasar', 'Kota', 26, 'YA'),
(393, 'Kab. Bantaeng', 'Kabupaten', 26, 'YA'),
(394, 'Kota Pare-Pare', 'Kota', 26, 'YA'),
(395, 'Kab. Barru', 'Kabupaten', 26, 'YA'),
(396, 'Kota Palopo', 'Kota', 26, 'YA'),
(397, 'Kab. Bone', 'Kabupaten', 26, 'YA'),
(398, 'Kab. Bulukumba', 'Kabupaten', 26, 'YA'),
(399, 'Kab. Enrekang', 'Kabupaten', 26, 'YA'),
(400, 'Kab. Gowa', 'Kabupaten', 26, 'YA'),
(401, 'Kab. Jeneponto', 'Kabupaten', 26, 'YA'),
(402, 'Kab. Luwu', 'Kabupaten', 26, 'YA'),
(403, 'Kab. Luwu Timur', 'Kabupaten', 26, 'YA'),
(404, 'Kab. Luwu Utara', 'Kabupaten', 26, 'YA'),
(405, 'Kab. Maros', 'Kabupaten', 26, 'YA'),
(406, 'Kab. Pangkep', 'Kabupaten', 26, 'YA'),
(407, 'Kab. Pinrang', 'Kabupaten', 26, 'YA'),
(408, 'Kab. Sidenreng Rappang', 'Kabupaten', 26, 'YA'),
(409, 'Kab. Sinjai', 'Kabupaten', 26, 'YA'),
(410, 'Kab. Soppeng', 'Kabupaten', 26, 'YA'),
(411, 'Kab. Takalar', 'Kabupaten', 26, 'YA'),
(412, 'Kab. Tanatoraja', 'Kabupaten', 26, 'YA'),
(413, 'Kab. Wajo', 'Kabupaten', 26, 'YA'),
(414, 'Kab. Toraja Utara', 'Kabupaten', 26, 'YA'),
(415, 'Kab. Bombana', 'Kabupaten', 27, 'YA'),
(416, 'Kota Kendari', 'Kota', 27, 'YA'),
(417, 'Kab. Buton', 'Kabupaten', 27, 'YA'),
(418, 'Kota Bau-Bau', 'Kota', 27, 'YA'),
(419, 'Kab. Kendari (Kab. Konawe)', 'Kabupaten', 27, 'YA'),
(420, 'Kab. Kolaka', 'Kabupaten', 27, 'YA'),
(421, 'Kab. Kolaka Utara', 'Kabupaten', 27, 'YA'),
(422, 'Kab. Konawe Selatan', 'Kabupaten', 27, 'YA'),
(423, 'Kab. Muna', 'Kabupaten', 27, 'YA'),
(424, 'Kab. Wakatobi', 'Kabupaten', 27, 'YA'),
(425, 'Kab. Konawe Utara', 'Kabupaten', 27, 'YA'),
(426, 'Kab. Buton Utara', 'Kabupaten', 27, 'YA'),
(427, 'Kab. Boalemo', 'Kabupaten', 28, 'YA'),
(428, 'Kota Gorontalo', 'Kota', 28, 'YA'),
(429, 'Kab. Bone Bolango', 'Kabupaten', 28, 'YA'),
(430, 'Kab. Gorontalo', 'Kabupaten', 28, 'YA'),
(431, 'Kab. Gorontalo Utara', 'Kabupaten', 28, 'YA'),
(432, 'Kab. Pohuwato', 'Kabupaten', 28, 'YA'),
(433, 'Kab. Mamaju', 'Kabupaten', 29, 'YA'),
(434, 'Kab. Majene', 'Kabupaten', 29, 'YA'),
(435, 'Kab. Mamuju Utara', 'Kabupaten', 29, 'YA'),
(436, 'Kab. Mamasa', 'Kabupaten', 29, 'YA'),
(437, 'Kab. Polewali Mamasa', 'Kabupaten', 29, 'YA'),
(438, 'Kab. Buru', 'Kabupaten', 30, 'YA'),
(439, 'Kota Ambon', 'Kota', 30, 'YA'),
(440, 'Kab. Kep. Aru', 'Kabupaten', 30, 'YA'),
(441, 'Kota Tual', 'Kota', 30, 'YA'),
(442, 'Kab. Seram Bagian Barat', 'Kabupaten', 30, 'YA'),
(443, 'Kab. Seram Bagian Timur', 'Kabupaten', 30, 'YA'),
(444, 'Kab. Maluku Tengah', 'Kabupaten', 30, 'YA'),
(445, 'Kab. Maluku Tenggara', 'Kabupaten', 30, 'YA'),
(446, 'Kab. Maluku Tenggara Barat', 'Kabupaten', 30, 'YA'),
(447, 'Kab. Maluku Barat Daya', 'Kabupaten', 30, 'YA'),
(448, 'Kab. Buru Selatan', 'Kabupaten', 30, 'YA'),
(449, 'Kab. Halmahera Barat', 'Kabupaten', 31, 'YA'),
(450, 'Kota Ternate', 'Kota', 31, 'YA'),
(451, 'Kab. Halmahera Selatan', 'Kabupaten', 31, 'YA'),
(452, 'Kota Tidore Kepulauan', 'Kota', 31, 'YA'),
(453, 'Kab. Halmahera  Tengah', 'Kabupaten', 31, 'YA'),
(454, 'Kab. Halmahera Timur', 'Kabupaten', 31, 'YA'),
(455, 'Kab. Halmahera Utara', 'Kabupaten', 31, 'YA'),
(456, 'Kab. Kep. Sula', 'Kabupaten', 31, 'YA'),
(457, 'Kab. Morotai', 'Kabupaten', 31, 'YA'),
(458, 'Kab. Asmat', 'Kabupaten', 32, 'YA'),
(459, 'Kota Jayapura', 'Kota', 32, 'YA'),
(460, 'Kab. Biak Numfor', 'Kabupaten', 32, 'YA'),
(461, 'Kab. Boven Digoel', 'Kabupaten', 32, 'YA'),
(462, 'Kab. Jayapura', 'Kabupaten', 32, 'YA'),
(463, 'Kab. Jayawijaya', 'Kabupaten', 32, 'YA'),
(464, 'Kab. Keerom', 'Kabupaten', 32, 'YA'),
(465, 'Kab. Mappi', 'Kabupaten', 32, 'YA'),
(466, 'Kab. Merauke', 'Kabupaten', 32, 'YA'),
(467, 'Kab. Mimika', 'Kabupaten', 32, 'YA'),
(468, 'Kab. Paniai', 'Kabupaten', 32, 'YA'),
(469, 'Kab. Pegunungan Bintang', 'Kabupaten', 32, 'YA'),
(470, 'Kab. Puncak Jaya', 'Kabupaten', 32, 'YA'),
(471, 'Kab. Sarmi', 'Kabupaten', 32, 'YA'),
(472, 'Kab. Memberamo Raya', 'Kabupaten', 32, 'YA'),
(473, 'Kab. Supiori', 'Kabupaten', 32, 'YA'),
(474, 'Kab. Tolikara', 'Kabupaten', 32, 'YA'),
(475, 'Kab. Yahukimo', 'Kabupaten', 32, 'YA'),
(476, 'Kab. Yapen Waropen', 'Kabupaten', 32, 'YA'),
(477, 'Kab. Waropen', 'Kabupaten', 32, 'YA'),
(478, 'Kab. Nabire', 'Kabupaten', 32, 'YA'),
(479, 'Kab. Memberano Tengah', 'Kabupaten', 32, 'YA'),
(480, 'Kab. Yalimo', 'Kabupaten', 32, 'YA'),
(481, 'Kab. Lanny Jaya', 'Kabupaten', 32, 'YA'),
(482, 'Kab. Nduga', 'Kabupaten', 32, 'YA'),
(483, 'Kab. Puncak', 'Kabupaten', 32, 'YA'),
(484, 'Kab. Dogiyai', 'Kabupaten', 32, 'YA'),
(485, 'Kab. Deiyai*', 'Kabupaten', 32, 'YA'),
(486, 'Kab. Intan Jaya*', 'Kabupaten', 32, 'YA'),
(487, 'Kab. Fak-Fak', 'Kabupaten', 33, 'YA'),
(488, 'Kota Sorong', 'Kota', 33, 'YA'),
(489, 'Kab. Kaimana', 'Kabupaten', 33, 'YA'),
(490, 'Kab. Kep. Raja Ampat', 'Kabupaten', 33, 'YA'),
(491, 'Kab. Manokwari', 'Kabupaten', 33, 'YA'),
(492, 'Kab. Sorong Selatan', 'Kabupaten', 33, 'YA'),
(493, 'Kab. Teluk Bintuni', 'Kabupaten', 33, 'YA'),
(494, 'Kab. Sorong', 'Kabupaten', 33, 'YA'),
(495, 'Kab. Teluk Wondama', 'Kabupaten', 33, 'YA'),
(496, 'Kab. Tambrauw*', 'Kabupaten', 33, 'YA'),
(497, 'Kab. Maibrat*', 'Kabupaten', 33, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_karyawan`
--

CREATE TABLE IF NOT EXISTS `mst_karyawan` (
  `id_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) NOT NULL,
  `nama_karyawan` varchar(200) NOT NULL,
  `id_propinsi_lahir` int(11) NOT NULL,
  `id_kota_lahir` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('PRIA','WANITA') NOT NULL,
  `golongan_darah` enum('A','B','AB','O') NOT NULL,
  `agama` enum('ISLAM','KATOLIK','PROTESTAN','HINDU','BUDHA') NOT NULL,
  `alamat` text NOT NULL,
  `status` enum('MENIKAH','BELUM MENIKAH') NOT NULL,
  `nama_pasangan` varchar(100) NOT NULL,
  `telepon_pasangan` char(20) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `telepon_emergency` varchar(100) NOT NULL,
  `bahasa_asing` set('INGGRIS','MANDARIN','PERANCIS','JERMAN','ARAB','JEPANG') NOT NULL,
  `pendidikan_terakhir` enum('SD','SMP','SMA','D1','D2','D3','S1','S2','S3') NOT NULL,
  `pengalaman_berorganisasi` text NOT NULL,
  `nomor_telepon` char(20) NOT NULL,
  `hp` char(20) NOT NULL,
  `id_propinsi` int(11) NOT NULL,
  `id_kabupaten_kota` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_level_karyawan` int(11) NOT NULL,
  `id_tipe_karyawan` int(11) NOT NULL,
  `hobi` text NOT NULL,
  `nomor_rekening` varchar(50) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `cabang_bank` text NOT NULL,
  `tanggal_join` date NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_karyawan`),
  KEY `fk_id_bank` (`id_bank`),
  KEY `fk_tipe_karyawan` (`id_tipe_karyawan`),
  KEY `fk_id_departement` (`id_departemen`),
  KEY `fk_id_propinsi` (`id_propinsi`),
  KEY `fk_id_kab_prop` (`id_kabupaten_kota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `mst_karyawan`
--

INSERT INTO `mst_karyawan` (`id_karyawan`, `nik`, `nama_karyawan`, `id_propinsi_lahir`, `id_kota_lahir`, `tanggal_lahir`, `jenis_kelamin`, `golongan_darah`, `agama`, `alamat`, `status`, `nama_pasangan`, `telepon_pasangan`, `nama_ayah`, `nama_ibu`, `telepon_emergency`, `bahasa_asing`, `pendidikan_terakhir`, `pengalaman_berorganisasi`, `nomor_telepon`, `hp`, `id_propinsi`, `id_kabupaten_kota`, `id_departemen`, `id_jabatan`, `id_level_karyawan`, `id_tipe_karyawan`, `hobi`, `nomor_rekening`, `gaji_pokok`, `id_bank`, `cabang_bank`, `tanggal_join`, `aktif`) VALUES
(1, '12938123-001-990', 'Hardiman P-men', 0, 0, '1988-06-18', 'PRIA', 'A', 'ISLAM', 'JL Raya BABAKAN ', 'MENIKAH', '', '', '', '', '', '', 'SD', '', '', '', 12, 165, 5, 0, 0, 1, '', '982392302991292', 7000000, 1, '', '2010-06-18', 'YA'),
(2, 'UCRIT -001', 'UCRIT ', 12, 162, '1987-06-21', 'PRIA', 'A', 'ISLAM', 'jalan a', 'BELUM MENIKAH', '', '', 'sss', 'ss', '025190928', 'INGGRIS,MANDARIN', 'D1', 'a', 'a', '', 14, 0, 1, 0, 0, 3, 'aaa', 'aaa', 0, 1, '', '2014-06-21', 'YA'),
(3, 'USRO-001', 'USRO SUROSO', 5, 93, '1986-06-21', 'PRIA', 'A', 'ISLAM', 'asasd', 'MENIKAH', 'asd', 'asd', 'xczcxzxc', 'zxczxcz', '123123123', 'MANDARIN,PERANCIS', 'S1', '', '123123213', '4525325235', 15, 0, 5, 0, 0, 4, 'afsaf', 'safsafsaf', 0, 3, '', '2013-06-19', 'YA'),
(9, '130904-nami', 'Nandra Maulana Irawan', 12, 165, '1987-11-04', 'PRIA', 'A', 'ISLAM', 'Perum Griya Wanakarya Permai Blok G no 4-5', 'MENIKAH', 'Yusi Indriani', 'Yusi Indriani', 'Subagio', 'Dwi Hardini Lestari', '02518330177', 'INGGRIS,MANDARIN,PERANCIS,JERMAN,ARAB,JEPANG', 'D3', 'SENAT & BEM POLITEKNIK KENT BOGOR', '02518330177', '081314029904', 12, 0, 5, 4, 1, 1, 'Music And Code', '6340217118', 8000000, 2, 'KCP Raden Shaleh jakarta Pusat', '2014-07-12', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_karyawan_anak`
--

CREATE TABLE IF NOT EXISTS `mst_karyawan_anak` (
  `id_karyawan_anak` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `nama_anak` varchar(200) NOT NULL,
  `umur` tinyint(2) DEFAULT NULL,
  `pendidikan` enum('SD','SMP','SMA','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_karyawan_anak`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data untuk tabel `mst_karyawan_anak`
--

INSERT INTO `mst_karyawan_anak` (`id_karyawan_anak`, `id_karyawan`, `nama_anak`, `umur`, `pendidikan`, `aktif`) VALUES
(1, 7, 'Muhammad Tsabit Mikail Ramadhan', NULL, 'SD', 'YA'),
(2, 7, 'Muhammad Alfatih', NULL, 'SD', 'YA'),
(3, 7, 'Fatimah Al zahra', NULL, 'SD', 'YA'),
(4, 8, 'Muhammad Tsabit Mikail Ramadhan', NULL, 'SD', 'YA'),
(5, 8, 'sadasd', NULL, 'SD', 'YA'),
(6, 8, 'asdasd', NULL, 'SD', 'YA'),
(13, 2, 'Bu Bariah', 7, 'SD', 'YA'),
(14, 2, 'Ogah', 3, 'SD', 'YA'),
(25, 9, 'Siti Fatimah', 0, 'SMP', 'YA'),
(26, 9, 'Muhammad Tsabit Mikail', 1, 'SD', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_karyawan_pendidikan`
--

CREATE TABLE IF NOT EXISTS `mst_karyawan_pendidikan` (
  `id_karyawan_pendidikan` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `nama_instansi_pendidikan` varchar(200) NOT NULL,
  `tingkat` enum('SD','SMP','SMA','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  `tahun` int(11) NOT NULL,
  `jenis` enum('FORMAL','INFORMAL') NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_karyawan_pendidikan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data untuk tabel `mst_karyawan_pendidikan`
--

INSERT INTO `mst_karyawan_pendidikan` (`id_karyawan_pendidikan`, `id_karyawan`, `nama_instansi_pendidikan`, `tingkat`, `tahun`, `jenis`, `aktif`) VALUES
(1, 7, 'Pabrik gas 4 Bogor', 'SD', 1998, 'FORMAL', 'YA'),
(2, 8, 'Pabrik gas 4 Bogor', 'SD', 1998, 'FORMAL', 'YA'),
(3, 8, 'adasdasd', 'SMP', 1999, 'FORMAL', 'YA'),
(4, 8, 'sadasdasd', 'SMA', 2000, 'FORMAL', 'YA'),
(17, 2, 'SD PENGADILAN', 'SD', 1998, 'FORMAL', 'YA'),
(18, 2, 'SMP NEGERI 5', 'SMP', 2000, 'FORMAL', 'YA'),
(19, 2, 'SMA 5 Bogor', 'SMA', 2013, 'FORMAL', 'YA'),
(40, 9, 'Pabrik gas 4 Bogor', 'SD', 1994, 'FORMAL', 'YA'),
(41, 9, 'SMP Negeri 12 Bogor', 'SMP', 2000, 'FORMAL', 'YA'),
(42, 9, 'Politeknik KENT Bogor', 'D3', 2005, 'FORMAL', 'YA'),
(43, 9, 'SMA Negeri 2 Bogor', 'SMA', 2002, 'FORMAL', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_karyawan_working_experience`
--

CREATE TABLE IF NOT EXISTS `mst_karyawan_working_experience` (
  `id_working_experience` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `nama_perusahaan` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `mulai_kerja` date NOT NULL,
  `akhir_kerja` date NOT NULL,
  `reason_to_leave` text NOT NULL,
  `position` varchar(200) NOT NULL,
  PRIMARY KEY (`id_working_experience`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data untuk tabel `mst_karyawan_working_experience`
--

INSERT INTO `mst_karyawan_working_experience` (`id_working_experience`, `id_karyawan`, `nama_perusahaan`, `alamat`, `contact_number`, `mulai_kerja`, `akhir_kerja`, `reason_to_leave`, `position`) VALUES
(3, 2, 'PT ABC', 'JL RAYA BOGOR KM 40', '021990999', '2012-07-12', '2014-07-03', 'Habis Kontrak', 'Production'),
(4, 2, 'PT DEF', 'JL. KARADENAN BOGOR', '092193123', '2014-02-12', '2013-07-22', 'Habis Kontrak 2', 'Production'),
(15, 9, 'AES', 'askldaslkdj', 'akldjfsakljd', '2014-07-10', '2014-07-10', 'akldjfsakljd', 'asdaksdj'),
(16, 9, 'hjdhakjhdads', 'ajdlksajf', 'jhfjkasdfjashf', '2014-07-11', '2014-07-11', 'jhfjkasdfjashf', 'jakjsfksj');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_komponen_gaji`
--

CREATE TABLE IF NOT EXISTS `mst_komponen_gaji` (
  `id_komponen_gaji` int(11) NOT NULL AUTO_INCREMENT,
  `nama_komponen_gaji` varchar(100) NOT NULL,
  `jenis` enum('TUNJANGAN','POTONGAN','GAJI POKOK') NOT NULL,
  `pokok` enum('YA','TIDAK') NOT NULL DEFAULT 'TIDAK' COMMENT 'pokok=tidak dditampilkan di form',
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_komponen_gaji`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `mst_komponen_gaji`
--

INSERT INTO `mst_komponen_gaji` (`id_komponen_gaji`, `nama_komponen_gaji`, `jenis`, `pokok`, `aktif`) VALUES
(1, 'jamsostek', 'TUNJANGAN', 'YA', 'YA'),
(2, 'pinjaman', 'POTONGAN', 'TIDAK', 'YA'),
(3, 'PPH 21', 'TUNJANGAN', 'TIDAK', 'YA'),
(4, 'gaji pokok', 'GAJI POKOK', 'YA', 'YA'),
(5, 'service', 'TUNJANGAN', 'YA', 'YA'),
(6, 'potongan koperasi', 'POTONGAN', 'TIDAK', 'YA'),
(7, 'lembur', 'TUNJANGAN', 'YA', 'YA'),
(8, 'jamsostek', 'POTONGAN', 'YA', 'YA'),
(9, 'Komunikasi', 'TUNJANGAN', 'TIDAK', 'YA'),
(10, 'transport', 'TUNJANGAN', 'TIDAK', 'YA'),
(11, 'Uang makan', 'TUNJANGAN', 'YA', 'YA'),
(12, 'Uang Makan', 'POTONGAN', 'YA', 'YA'),
(13, 'PPH 21', 'POTONGAN', 'TIDAK', 'YA'),
(14, 'Housing', 'TUNJANGAN', 'TIDAK', 'YA'),
(15, 'Medical', 'TUNJANGAN', 'TIDAK', 'YA'),
(16, 'Renumeration (DW and Casual)', 'TUNJANGAN', 'TIDAK', 'YA'),
(17, 'Medical', 'POTONGAN', 'TIDAK', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_level_karyawan`
--

CREATE TABLE IF NOT EXISTS `mst_level_karyawan` (
  `id_level_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level_karyawan` varchar(100) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_level_karyawan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `mst_level_karyawan`
--

INSERT INTO `mst_level_karyawan` (`id_level_karyawan`, `nama_level_karyawan`, `aktif`) VALUES
(1, 'level 1', 'YA'),
(2, 'level 2', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_menu`
--

CREATE TABLE IF NOT EXISTS `mst_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data untuk tabel `mst_menu`
--

INSERT INTO `mst_menu` (`id_menu`, `nama_menu`, `link`, `parent`, `aktif`) VALUES
(1, 'Master', '', 0, 'YA'),
(2, 'Karyawan', 'master/karyawan', 1, 'YA'),
(3, 'Bank', 'master/bank', 1, 'YA'),
(4, 'departement', 'master/departemen', 1, 'YA'),
(5, 'tipe karyawan', 'master/tipe_karyawan', 1, 'YA'),
(6, 'User', 'master/user', 1, 'YA'),
(7, 'Jenis Potongan / Tunjangan', 'master/komponen_gaji', 1, 'YA'),
(8, 'Proses Penggajian', 'payroll/proses_payroll/', 13, 'YA'),
(9, 'Lembur dan Hari Kerja', '', 8, 'TIDAK'),
(10, 'Tunjangan', '', 8, 'TIDAK'),
(11, 'Potongan', '', 8, 'TIDAK'),
(12, 'Penghitungan Gaji', '', 8, 'TIDAK'),
(13, 'Payroll', '', 0, 'YA'),
(14, 'Salary ', 'payroll/salary/list_salary', 13, 'YA'),
(15, 'Laporan Rekapitulasi', '', 0, 'YA'),
(16, 'Berdasarkan Departemen', 'laporan/rekapitulasi', 15, 'YA'),
(17, 'Persentase Jamsostek', 'master/persentase_jamsostek', 1, 'YA'),
(18, 'Jabatan', 'master/jabatan', 1, 'YA'),
(19, 'Level Karyawan', 'master/level_karyawan', 1, 'YA'),
(20, 'Konfigurasi Uang makan', 'master/meal_config', 1, 'YA'),
(21, 'Berdasarkan Status Karyawan', 'laporan/rekapitulasi', 15, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_otoritas`
--

CREATE TABLE IF NOT EXISTS `mst_otoritas` (
  `id_otoritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_otoritas` varchar(100) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_otoritas`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `mst_otoritas`
--

INSERT INTO `mst_otoritas` (`id_otoritas`, `nama_otoritas`, `aktif`) VALUES
(1, 'root', 'YA'),
(2, 'admin', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_propinsi`
--

CREATE TABLE IF NOT EXISTS `mst_propinsi` (
  `id_propinsi` int(10) unsigned NOT NULL,
  `nama_propinsi` varchar(50) DEFAULT NULL,
  `aktif` set('YA','TIDAK') DEFAULT 'YA',
  PRIMARY KEY (`id_propinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `mst_propinsi`
--

INSERT INTO `mst_propinsi` (`id_propinsi`, `nama_propinsi`, `aktif`) VALUES
(1, 'Nanggroe Aceh Darussalam', 'YA'),
(2, 'Sumatera Utara', 'YA'),
(3, 'Sumatera Barat', 'YA'),
(4, 'Riau', 'YA'),
(5, 'Jambi', 'YA'),
(6, 'Sumatera Selatan', 'YA'),
(7, 'Bengkulu', 'YA'),
(8, 'Lampung', 'YA'),
(9, 'Kep. Bangka Belitung', 'YA'),
(10, 'Kep. Riau', 'YA'),
(11, 'DKI Jakarta', 'YA'),
(12, 'Jawa Barat', 'YA'),
(13, 'Jawa Tengah', 'YA'),
(14, 'Banten', 'YA'),
(15, 'Jawa Timur', 'YA'),
(16, 'Yogyakarta', 'YA'),
(17, 'Bali', 'YA'),
(18, 'Nusa Tenggara Barat', 'YA'),
(19, 'Nusa Tenggara Timur', 'YA'),
(20, 'Kalimantan Barat', 'YA'),
(21, 'Kalimantan Tengah', 'YA'),
(22, 'Kalimantan Selatan', 'YA'),
(23, 'Kalimantan Timur', 'YA'),
(24, 'Sulawesi Utara', 'YA'),
(25, 'Sulawesi Tengah', 'YA'),
(26, 'Sulawesi Selatan', 'YA'),
(27, 'Sulawesi Tenggara', 'YA'),
(28, 'Gorontalo', 'YA'),
(29, 'Sulawesi Barat', 'YA'),
(30, 'Maluku', 'YA'),
(31, 'Malulu Utara', 'YA'),
(32, 'Papua', 'YA'),
(33, 'Papua Barat', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_rate_dw`
--

CREATE TABLE IF NOT EXISTS `mst_rate_dw` (
  `id_rate` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah` int(11) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_rate`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `mst_rate_dw`
--

INSERT INTO `mst_rate_dw` (`id_rate`, `jumlah`, `aktif`) VALUES
(1, 78000, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_tipe_karyawan`
--

CREATE TABLE IF NOT EXISTS `mst_tipe_karyawan` (
  `id_tipe_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tipe_karyawan` varchar(200) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_tipe_karyawan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `mst_tipe_karyawan`
--

INSERT INTO `mst_tipe_karyawan` (`id_tipe_karyawan`, `nama_tipe_karyawan`, `aktif`) VALUES
(1, 'Tetap', 'YA'),
(2, 'Kontrak', 'YA'),
(3, 'Daily Worker', 'YA'),
(4, 'Casual', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_user`
--

CREATE TABLE IF NOT EXISTS `mst_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `id_otoritas` int(11) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `status_login` tinyint(1) NOT NULL DEFAULT '0',
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_user`),
  KEY `id_otoritas` (`id_otoritas`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `mst_user`
--

INSERT INTO `mst_user` (`id_user`, `username`, `password`, `id_otoritas`, `nama_lengkap`, `status_login`, `aktif`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 1, 'Nandra Maulana Irawan', 0, 'YA'),
(2, 'nandra', '1ee85f6c60017a7f0646ba8dc5824de6', 2, 'nandra maulana irawan', 0, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_absensi_karyawan`
--

CREATE TABLE IF NOT EXISTS `trs_absensi_karyawan` (
  `id_absensi_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_hari_masuk` tinyint(4) NOT NULL,
  `jumlah_lembur` int(11) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL DEFAULT 'YA',
  PRIMARY KEY (`id_absensi_karyawan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `trs_absensi_karyawan`
--

INSERT INTO `trs_absensi_karyawan` (`id_absensi_karyawan`, `id_karyawan`, `bulan`, `tahun`, `jumlah_hari_masuk`, `jumlah_lembur`, `aktif`) VALUES
(1, 2, 8, 2014, 10, 10, 'YA'),
(2, 3, 8, 2014, 10, 10, 'YA'),
(3, 2, 8, 2018, 22, 20, 'YA'),
(4, 3, 8, 2018, 20, 30, 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_cuti`
--

CREATE TABLE IF NOT EXISTS `trs_cuti` (
  `id_cuti` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `tanggal_create` date NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_cuti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_cuti_detail`
--

CREATE TABLE IF NOT EXISTS `trs_cuti_detail` (
  `id_cuti_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuti` int(11) NOT NULL,
  `tanggal_cuti` date NOT NULL,
  PRIMARY KEY (`id_cuti_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_menu_otoritas`
--

CREATE TABLE IF NOT EXISTS `trs_menu_otoritas` (
  `id_menu_otoritas` int(11) NOT NULL AUTO_INCREMENT,
  `id_otoritas` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id_menu_otoritas`),
  KEY `id_otoritas` (`id_otoritas`,`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data untuk tabel `trs_menu_otoritas`
--

INSERT INTO `trs_menu_otoritas` (`id_menu_otoritas`, `id_otoritas`, `id_menu`, `parent`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 1),
(3, 1, 4, 1),
(4, 1, 5, 1),
(5, 1, 6, 1),
(6, 1, 7, 1),
(11, 1, 8, 13),
(12, 1, 14, 13),
(13, 1, 16, 15),
(14, 1, 17, 1),
(15, 1, 18, 1),
(16, 1, 19, 1),
(17, 1, 20, 1),
(18, 1, 21, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_payroll`
--

CREATE TABLE IF NOT EXISTS `trs_payroll` (
  `id_payroll` int(11) NOT NULL AUTO_INCREMENT,
  `bulan` tinyint(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggal_create` date NOT NULL,
  `user_create` int(11) NOT NULL,
  `jenis_pengiriman` enum('CASH','TRANSFER') NOT NULL DEFAULT 'TRANSFER',
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_payroll`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data untuk tabel `trs_payroll`
--

INSERT INTO `trs_payroll` (`id_payroll`, `bulan`, `tahun`, `id_karyawan`, `tanggal_create`, `user_create`, `jenis_pengiriman`, `aktif`) VALUES
(1, 8, 2014, 2, '2014-08-03', 1, 'TRANSFER', 'YA'),
(2, 8, 2014, 3, '2014-08-03', 1, 'TRANSFER', 'YA'),
(3, 8, 2014, 1, '2014-08-03', 1, 'TRANSFER', 'YA'),
(4, 8, 2014, 9, '2014-08-03', 1, 'TRANSFER', 'YA'),
(5, 8, 2018, 2, '2018-08-17', 1, 'TRANSFER', 'YA'),
(6, 8, 2018, 3, '2018-08-17', 1, 'TRANSFER', 'YA'),
(7, 8, 2018, 1, '2018-08-17', 1, 'TRANSFER', 'YA'),
(8, 8, 2018, 9, '2018-08-17', 1, 'TRANSFER', 'YA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trs_payroll_detail`
--

CREATE TABLE IF NOT EXISTS `trs_payroll_detail` (
  `id_payroll_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_payroll` int(11) NOT NULL,
  `id_komponen_gaji` int(11) NOT NULL,
  `jenis` enum('TUNJANGAN','POTONGAN') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `aktif` enum('YA','TIDAK') NOT NULL,
  PRIMARY KEY (`id_payroll_detail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data untuk tabel `trs_payroll_detail`
--

INSERT INTO `trs_payroll_detail` (`id_payroll_detail`, `id_payroll`, `id_komponen_gaji`, `jenis`, `jumlah`, `aktif`) VALUES
(1, 1, 4, 'TUNJANGAN', 780000, 'YA'),
(2, 1, 7, 'TUNJANGAN', 780000, 'YA'),
(3, 2, 4, 'TUNJANGAN', 780000, 'YA'),
(4, 2, 7, 'TUNJANGAN', 780000, 'YA'),
(5, 3, 4, 'TUNJANGAN', 7000000, 'YA'),
(6, 3, 5, 'TUNJANGAN', 3000000, 'YA'),
(7, 3, 11, 'TUNJANGAN', 286000, 'YA'),
(8, 3, 12, 'POTONGAN', 286000, 'YA'),
(9, 3, 1, 'TUNJANGAN', 342300, 'YA'),
(10, 3, 8, 'POTONGAN', 140000, 'YA'),
(11, 4, 4, 'TUNJANGAN', 8000000, 'YA'),
(12, 4, 5, 'TUNJANGAN', 3000000, 'YA'),
(13, 4, 11, 'TUNJANGAN', 286000, 'YA'),
(14, 4, 12, 'POTONGAN', 286000, 'YA'),
(15, 4, 1, 'TUNJANGAN', 391200, 'YA'),
(16, 4, 8, 'POTONGAN', 160000, 'YA'),
(17, 4, 15, 'TUNJANGAN', 300000, 'YA'),
(18, 4, 9, 'TUNJANGAN', 100000, 'YA'),
(19, 3, 9, 'TUNJANGAN', 100000, 'YA'),
(20, 3, 15, 'TUNJANGAN', 200000, 'YA'),
(21, 4, 2, 'POTONGAN', 500000, 'YA'),
(22, 4, 6, 'POTONGAN', 10000, 'YA'),
(23, 3, 2, 'POTONGAN', 300000, 'YA'),
(24, 3, 6, 'POTONGAN', 30000, 'YA'),
(25, 5, 4, 'TUNJANGAN', 1716000, 'YA'),
(26, 5, 7, 'TUNJANGAN', 1560000, 'YA'),
(27, 6, 4, 'TUNJANGAN', 1560000, 'YA'),
(28, 6, 7, 'TUNJANGAN', 2340000, 'YA'),
(29, 7, 4, 'TUNJANGAN', 7000000, 'YA'),
(30, 7, 5, 'TUNJANGAN', 800000, 'YA'),
(31, 7, 11, 'TUNJANGAN', 286000, 'YA'),
(32, 7, 12, 'POTONGAN', 286000, 'YA'),
(33, 7, 1, 'TUNJANGAN', 342300, 'YA'),
(34, 7, 8, 'POTONGAN', 140000, 'YA'),
(35, 8, 4, 'TUNJANGAN', 8000000, 'YA'),
(36, 8, 5, 'TUNJANGAN', 800000, 'YA'),
(37, 8, 11, 'TUNJANGAN', 286000, 'YA'),
(38, 8, 12, 'POTONGAN', 286000, 'YA'),
(39, 8, 1, 'TUNJANGAN', 391200, 'YA'),
(40, 8, 8, 'POTONGAN', 160000, 'YA'),
(41, 5, 9, 'TUNJANGAN', 90000, 'YA'),
(42, 5, 17, 'POTONGAN', 50000, 'YA');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mst_karyawan`
--
ALTER TABLE `mst_karyawan`
  ADD CONSTRAINT `mst_karyawan_ibfk_1` FOREIGN KEY (`id_bank`) REFERENCES `mst_bank` (`id_bank`),
  ADD CONSTRAINT `mst_karyawan_ibfk_2` FOREIGN KEY (`id_tipe_karyawan`) REFERENCES `mst_tipe_karyawan` (`id_tipe_karyawan`),
  ADD CONSTRAINT `mst_karyawan_ibfk_3` FOREIGN KEY (`id_departemen`) REFERENCES `mst_departemen` (`id_departemen`);

--
-- Ketidakleluasaan untuk tabel `mst_user`
--
ALTER TABLE `mst_user`
  ADD CONSTRAINT `mst_user_ibfk_1` FOREIGN KEY (`id_otoritas`) REFERENCES `mst_otoritas` (`id_otoritas`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
