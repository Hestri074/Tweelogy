-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 07:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweelogy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'shipuan', 'shipuan', 'shipuan buyme'),
(2, 'syuhda', 'syuhda', 'Syuhda Fakhrunnisa'),
(3, 'shipuan', 'shipuan', 'Shipuan Kelompok'),
(4, 'budi', 'budi', 'Budi Santoso'),
(5, 'annisa', 'annisa', 'Annisa'),
(6, 'anu', 'anu', 'anu'),
(7, 'dinda', 'dinda', 'Annisa Dinda Septina');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Hobi'),
(2, 'Aksesoris'),
(3, 'Makanan & Minuman'),
(4, 'Pakaian Pria'),
(5, 'Pakaian Wanita'),
(6, 'Perawatan & Kecantikan'),
(7, 'Peralatan Rumah Tangga'),
(18, 'Elektronik');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Cirebon', 25000),
(2, 'Medan', 30000),
(3, 'Yogyakarta', 20000),
(4, 'Bengkulu', 35000),
(5, 'Nusa Tenggara Barat', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'mayla@gmail.com', 'mayla', 'Mayla Ayyuni Sonya', '08234567890', ''),
(2, 'syuhda@gmail.com', 'syuhda', 'Syuhda Fakhrunnisa', '0887654322', ''),
(3, 'sonyasehun@gmail.com', 'sonya', 'Sonya Ainurohmah', '087326356253', ''),
(4, 'indah@gmail.com', 'indah', 'Indah Rahma Ilmiana', '08793275323', ''),
(5, 'dinda@gmail.com', 'dinda', 'Annisa Dinda Septina', '087832635236', ''),
(6, 'maimunah@gmail.com', 'maimunah', 'Maimunah', '089743274827', ''),
(7, 'shipuan@gmail.com', 'shipuan', 'shipuan', '0812345678', 'Online'),
(8, 'budi@gmail.com', 'budi', 'budi', '097637232', 'Jalan Asahan'),
(9, 'andi@gmail.com', 'andi', 'Andi ', '089753221', 'Jalan Asahan'),
(11, 'elsa@gmail.com', 'elsa', 'elsa sofi', '087878564', 'disini');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 3, 'syuhda', 'mandiri', 40000, '2021-12-23', '20211223105901logo.png'),
(2, 2, 'syuhda', 'mandiri', 472000, '2021-12-24', '20211224020002BuyMe with stroke.png'),
(3, 3, 'syuhda', 'mandiri', 1030000, '2021-12-26', '20211226153833sea.jpg'),
(4, 5, 'Andi', 'mandiri', 540000, '2021-12-27', '20211227061455logo.png'),
(5, 6, 'Dinda', 'BRI', 0, '2021-12-30', '20211230103306tas item.png'),
(6, 7, 'Dinda', 'BRI', 30000, '2021-12-30', '20211230103648casinghp (1).png'),
(7, 8, 'Dinda', 'BCA', 55000, '2021-12-30', '20211230110326'),
(8, 9, 'Dinda', 'BCA', 55000, '2021-12-30', '20211230110549'),
(9, 10, '', '', 55000, '2021-12-30', '20211230110831'),
(10, 11, '', '', 0, '2021-12-30', '20211230111434'),
(11, 12, '', '', 0, '2021-12-30', '20211230111823'),
(12, 13, '', '', 144000, '2021-12-30', '20211230112434'),
(13, 14, 'Dinda', 'BCA', 30000, '2021-12-30', '20211230114904kategori.png'),
(14, 16, 'Dinda', 'Mandiri', 0, '2022-03-22', '20220322111730'),
(15, 17, '', '', 0, '2022-03-22', '20220322111958'),
(16, 18, 'Dinda', 'Mandiri', 160000, '2022-03-22', '20220322124339FCicIoYVUAMrP4j.jpg'),
(17, 20, 'Dinda', 'Mandiri', 17000, '2022-03-22', '20220322144006FCicIoYVUAMrP4j.jpg'),
(18, 19, 'Dinda', 'Mandiri', 16000, '2022-03-22', '20220322144110FCicIoYVUAMrP4j.jpg'),
(19, 21, 'Dinda', 'Mandiri', 65000, '2022-04-05', '20220405093509WhatsApp Image 2022-04-05 at 1.43.52 PM.jpeg'),
(20, 1, 'Dinda', 'BCA', 110500, '2022-07-09', '20220709180157pembayaran.jpg'),
(21, 22, 'Dinda', 'BCA', 128000, '2022-07-09', '20220709182127nokia.jpg'),
(22, 23, 'Dinda', 'BCA', 407000, '2022-07-09', '20220709182944pembayaran.jpg'),
(23, 24, 'Dinda', 'BCA', 1311000, '2022-07-09', '20220709184431pembayaran.jpg'),
(24, 25, 'Dinda', 'BCA', 586000, '2022-07-09', '20220709185348pembayaran.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(1, 5, '2022-01-13', 110500, 'aaaa', 'barang dikirim', '1234', 10, 'Kalimantan Utara', 'Tarakan', 'Kota', '77114', 'pos', 'Paket Kilat Khusus', 60500, '8 HARI'),
(2, 5, '2022-01-27', 824000, 'bbbbbb', 'pending', '', 400, 'Jawa Tengah', 'Pekalongan', 'Kota', '51122', 'tiki', 'ONS', 24000, '1'),
(3, 5, '2022-02-02', 1510000, 'aaaaaaaaaaaa', 'pending', '', 300, 'Jawa Tengah', 'Cilacap', 'Kabupaten', '53211', 'tiki', 'REG', 10000, '2'),
(4, 3, '2022-02-05', 1975000, 'xxxxxxxxxxx', 'pending', '', 640, 'DKI Jakarta', 'Jakarta Pusat', 'Kota', '10540', 'tiki', 'REG', 15000, '2'),
(5, 6, '2022-02-14', 756000, 'vvvvvvv', 'pending', '', 340, 'DI Yogyakarta', 'Bantul', 'Kabupaten', '55715', 'jne', 'CTC', 6000, '1-2'),
(6, 5, '2022-02-26', 1716000, 'aaaaaaaaa', 'pending', '', 340, 'Jawa Tengah', 'Kebumen', 'Kabupaten', '54319', 'tiki', 'REG', 16000, '3'),
(7, 5, '2022-03-21', 2260000, 'aaaaaaa', 'pending', '', 450, 'Jawa Tengah', 'Karanganyar', 'Kabupaten', '57718', 'pos', 'Paket Kilat Khusus', 10000, '3 HARI'),
(8, 5, '2022-03-26', 1909000, 'aaaaaaaaa', 'pending', '', 380, 'Jawa Tengah', 'Cilacap', 'Kabupaten', '53211', 'jne', 'OKE', 9000, '4-5'),
(9, 5, '2022-03-31', 786000, 'sjkkjjjw', 'pending', '', 150, 'Jawa Barat', 'Bekasi', 'Kota', '17121', 'tiki', 'ONS', 36000, '1'),
(10, 1, '2022-04-07', 215000, 'oijsdjiksdjksdc', 'pending', '', 200, 'Jawa Barat', 'Bogor', 'Kabupaten', '16911', 'pos', 'Paket Kilat Khusus', 15000, '3 HARI'),
(11, 1, '2022-04-15', 1852000, 'hjasxhjasjah', 'pending', '', 600, 'Kalimantan Barat', 'Landak', 'Kabupaten', '78319', 'tiki', 'ECO', 52000, '5'),
(12, 8, '2022-04-18', 1888000, 'ssssssss', 'pending', '', 270, 'Bali', 'Bangli', 'Kabupaten', '80619', 'tiki', 'ECO', 28000, '4'),
(13, 5, '2022-04-22', 554000, '123445', 'pending', '', 1590, 'Jawa Tengah', 'Brebes', 'Kabupaten', '52212', 'tiki', 'ECO', 24000, '4'),
(14, 5, '2022-05-01', 3056000, 'kndnjkjksdm', 'pending', '', 300, 'Jambi', 'Kerinci', 'Kabupaten', '37167', 'tiki', 'REG', 56000, '3'),
(15, 5, '2022-05-18', 6073000, 'hsjdjsjks', 'pending', '', 600, 'Gorontalo', 'Gorontalo', 'Kota', '96115', 'tiki', 'REG', 73000, '3'),
(16, 5, '2022-06-09', 370000, 'jkjjkxsxs', 'pending', '', 900, 'Gorontalo', 'Gorontalo', 'Kota', '96115', 'jne', 'OKE', 70000, '6-7'),
(17, 5, '2022-06-18', 4008000, 'jkhjajajka', 'pending', '', 400, 'DI Yogyakarta', 'Yogyakarta', 'Kota', '55111', 'tiki', 'ONS', 8000, '1'),
(18, 5, '2022-06-20', 251000, 'hjhjkjkjk', 'pending', '', 600, 'Jambi', 'Sarolangun', 'Kabupaten', '37419', 'jne', 'REG', 51000, '4-5'),
(19, 5, '2022-06-26', 2038000, 'hgjjjbjnb', 'pending', '', 200, 'Kalimantan Barat', 'Pontianak', 'Kabupaten', '78971', 'tiki', 'REG', 38000, '2'),
(20, 5, '2022-07-01', 250000, 'hjhjjkjk', 'pending', '', 600, 'Kalimantan Tengah', 'Kotawaringin Timur', 'Kabupaten', '74364', 'tiki', 'REG', 50000, '3'),
(21, 5, '2022-07-09', 511000, 'Jalan Kaliurang Km 14 ', 'pending', '', 100, 'DI Yogyakarta', 'Sleman', 'Kabupaten', '55513', 'tiki', 'REG', 11000, '2'),
(22, 5, '2022-07-09', 128000, 'kjednjxsjks', 'barang dikirim', '1234', 10, 'Gorontalo', 'Gorontalo', 'Kabupaten', '96218', 'jne', 'OKE', 78000, '7-8'),
(23, 5, '2022-07-09', 407000, 'Jalan Kaliurang', 'sudah kirim pembayaran', '', 80, 'DI Yogyakarta', 'Sleman', 'Kabupaten', '55513', 'tiki', 'ECO', 7000, '4'),
(24, 5, '2022-07-09', 1311000, 'Jalan Kaliurang', 'barang dikirim', '1234', 140, 'DI Yogyakarta', 'Sleman', 'Kabupaten', '55513', 'tiki', 'REG', 11000, '2'),
(25, 5, '2022-07-09', 586000, 'Jalan Kaliurang', 'barang dikirim', '1234', 130, 'DI Yogyakarta', 'Sleman', 'Kabupaten', '55513', 'jne', 'CTC', 6000, '1-2');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 3, 1, 'Tas Rajut', 50000, 10, 10, 50000),
(2, 2, 5, 30, 'Kemeja Pria', 100000, 10, 300, 300000),
(3, 2, 2, 10, 'Songket Lombok', 50000, 10, 100, 500000),
(4, 3, 2, 30, 'Songket Lombok', 50000, 10, 300, 1500000),
(5, 4, 3, 33, 'Tas Rajut', 50000, 10, 330, 1650000),
(6, 4, 1, 31, 'Konektor Masker', 10000, 10, 310, 310000),
(7, 5, 1, 34, 'Konektor Masker', 10000, 10, 340, 340000),
(8, 5, 4, 41, 'Keranjang', 10000, 0, 0, 410000),
(9, 6, 3, 34, 'Tas Rajut', 50000, 10, 340, 1700000),
(10, 7, 2, 45, 'Songket Lombok', 50000, 10, 450, 2250000),
(11, 8, 2, 38, 'Songket Lombok', 50000, 10, 380, 1900000),
(12, 9, 3, 15, 'Tas Rajut', 50000, 10, 150, 750000),
(13, 10, 1, 20, 'Konektor Masker', 10000, 10, 200, 200000),
(14, 11, 1, 30, 'Konektor Masker', 10000, 10, 300, 300000),
(15, 11, 2, 30, 'Songket Lombok', 50000, 10, 300, 1500000),
(16, 12, 4, 51, 'Keranjang', 10000, 0, 0, 510000),
(17, 12, 2, 27, 'Songket Lombok', 50000, 10, 270, 1350000),
(18, 13, 4, 53, 'Keranjang', 10000, 30, 1590, 530000),
(19, 14, 5, 30, 'Kemeja Pria', 100000, 10, 300, 3000000),
(20, 15, 5, 60, 'Kemeja Pria', 100000, 10, 600, 6000000),
(21, 16, 4, 30, 'Keranjang', 10000, 30, 900, 300000),
(22, 17, 5, 40, 'Kemeja Pria', 100000, 10, 400, 4000000),
(23, 18, 4, 20, 'Keranjang', 10000, 30, 600, 200000),
(24, 19, 5, 20, 'Kemeja Pria', 100000, 10, 200, 2000000),
(25, 20, 4, 20, 'Keranjang', 10000, 30, 600, 200000),
(26, 21, 2, 10, 'Songket Lombok', 50000, 10, 100, 500000),
(27, 22, 2, 1, 'Songket Lombok', 50000, 10, 10, 50000),
(28, 23, 3, 8, 'Tas Rajut', 50000, 10, 80, 400000),
(29, 24, 2, 2, 'Songket Lombok', 50000, 10, 20, 100000),
(30, 24, 5, 12, 'Kemeja Pria', 100000, 10, 120, 1200000),
(31, 25, 1, 8, 'Konektor Masker', 10000, 10, 80, 80000),
(32, 25, 5, 5, 'Kemeja Pria', 100000, 10, 50, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `stok_produk`, `gambar_produk`, `deskripsi_produk`) VALUES
(1, 2, 'Konektor Masker', 10000, 10, 22, 'konektor-masker.jpg', ''),
(2, 5, 'Songket Lombok', 50000, 10, 30, 'songket-lombok.jpg', 'songket'),
(3, 2, 'Tas Rajut', 50000, 10, 40, 'tas-rajut.jpg', 'tas'),
(4, 7, 'Keranjang', 10000, 30, 30, 'keranjang2.jpg', 'Keranjang bagus'),
(5, 4, 'Kemeja Pria', 100000, 10, 23, 'kemeja1.jpg', ''),
(19, 18, 'Hp Nokia', 1200000, 1000, 123, 'nokia.jpg', 'Hp Nokia Terbaru');

-- --------------------------------------------------------

--
-- Table structure for table `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(1, 46, 'masker-batik.jpg'),
(2, 47, 'konektor-masker.jpg'),
(3, 48, 'songket-lombok.jpg'),
(4, 49, 'tas-rajut.jpg'),
(5, 50, 'keranjang-makan.jpg'),
(6, 50, ''),
(7, 51, 'bubu-ikan.jpg'),
(8, 52, 'kendi-liat.jpg'),
(9, 53, 'sule-akang-klimis.jpg'),
(10, 48, '20211223123244logo.png'),
(11, 54, 'kripik-tempe.jpeg'),
(12, 54, 'kripik-tempe2.jpg'),
(15, 2, '20211227042234sea.jpg'),
(16, 10, '771-7711932_transparent-background-dress-icon-png-png-download.png'),
(17, 10, 'logo.png'),
(18, 11, '771-7711932_transparent-background-dress-icon-png-png-download.png'),
(20, 11, '20211227060304105283.png'),
(22, 13, 'casinghp (1).png'),
(25, 14, 'nokia.jpg'),
(26, 15, 'nokia.jpg'),
(27, 16, 'nokia.jpg'),
(28, 17, 'nokia.jpg'),
(29, 18, 'nokia.jpg'),
(30, 19, 'nokia.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
