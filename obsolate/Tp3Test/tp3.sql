-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Bulan Mei 2023 pada 06.11
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `IdBarang` int(11) NOT NULL,
  `NamaBarang` varchar(50) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `IdPengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`IdBarang`, `NamaBarang`, `Keterangan`, `satuan`, `IdPengguna`) VALUES
(1, 'Lemari 1234', 'Lemari 2 tingkat', 'pcs', 1),
(2, 'Lemari Baju', 'Lemari Baju \r\nGantung', 'Buah', 1),
(3, 'Meja Kaki 1', 'Meja Kaki 1', 'Buah', 1),
(4, 'Pakaian T-Shirt', 'Baju santai', 'Potong', 1),
(5, 'Meja Kaki 4', 'Meja Kaki 4', 'Buah', 1),
(6, 'lemari sepatu', 'lemari sepatu 3 tingkat', 'pcs', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hakakses`
--

CREATE TABLE `hakakses` (
  `IdAkses` int(11) NOT NULL,
  `NamaAkses` varchar(30) NOT NULL,
  `Keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hakakses`
--

INSERT INTO `hakakses` (`IdAkses`, `NamaAkses`, `Keterangan`) VALUES
(1, 'Create', 'Membuat file'),
(2, 'Read', 'Membaca file'),
(3, 'Update', 'Memperbaharui file'),
(4, 'Delete', 'Menghapus file');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `IdPelanggan` int(11) NOT NULL,
  `JenisPelanggan` varchar(30) NOT NULL,
  `TotalSpend` int(11) DEFAULT NULL,
  `TanggalBergabung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`IdPelanggan`, `JenisPelanggan`, `TotalSpend`, `TanggalBergabung`) VALUES
(1, 'Eksternal', 230000, '2023-01-03'),
(2, 'Internal', 1000000, '2023-02-22'),
(3, 'Eksternal', 168000, '2023-02-22'),
(4, 'Internal', 7400000, '2023-05-15'),
(5, 'Eksternal', 980000, '2023-01-17'),
(6, 'Internal', 86000, '2023-05-15'),
(7, 'Eksternal', 78900, '2023-02-22'),
(8, 'Eksternal', 80000, '2023-05-15'),
(9, 'Antara (Perantara)', 320000, '2023-02-22'),
(10, 'Internal', 230000, '2023-02-22'),
(11, 'Antara (Perantara)', 78900, '2023-01-03'),
(12, 'Internal', 168000, '2023-01-03'),
(13, 'Eksternal', 1000000, '2023-01-03'),
(14, 'Antara (Perantara)', 50900, '2023-01-03'),
(15, 'Antara (Perantara)', 168000, '2023-01-17'),
(16, 'Internal', 80000, '2023-01-03'),
(17, 'Internal', 168000, '2023-01-17'),
(18, 'Internal', 78900, '2023-01-03'),
(19, 'Internal', 80000, '2023-01-03'),
(20, 'Internal', 50900, '2023-01-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `IdPembelian` int(11) NOT NULL,
  `JumlahPembelian` int(11) NOT NULL,
  `HargaBeli` int(11) NOT NULL,
  `IdBarang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`IdPembelian`, `JumlahPembelian`, `HargaBeli`, `IdBarang`) VALUES
(1, 2, 200000, 1),
(2, 1, 300000, 3),
(3, 5, 123000, 4),
(4, 4, 240000, 1),
(5, 1, 500000, 5),
(6, 2, 200000, 2),
(7, 10, 90000, 4),
(8, 2, 110000, 4),
(9, 1, 230000, 1),
(10, 1, 250000, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `IdPengguna` int(11) NOT NULL,
  `NamaPengguna` varchar(50) NOT NULL,
  `PASSWORD` char(128) NOT NULL,
  `NamaDepan` varchar(25) NOT NULL,
  `NamaBelakang` varchar(25) DEFAULT NULL,
  `NoHp` varchar(12) NOT NULL,
  `alamat` text NOT NULL,
  `IdAkses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`IdPengguna`, `NamaPengguna`, `PASSWORD`, `NamaDepan`, `NamaBelakang`, `NoHp`, `alamat`, `IdAkses`) VALUES
(1, 'fachry_53', 'test', 'Fachry Azri', 'Arrasyid', '081298863013', 'Jalan Kenangan', 1),
(2, 'adam51', 'test1', 'Adam', 'Nurjanah', '081298873232', 'Jalan-jalan', 2),
(3, 'nani51', 'test2', 'Nani', 'Nurjanah', '081298873232', 'Jalan-jalan', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `IdPenjualan` int(11) NOT NULL,
  `JumlahPenjualan` int(11) NOT NULL,
  `HargaJual` int(11) NOT NULL,
  `IdBarang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`IdPenjualan`, `JumlahPenjualan`, `HargaJual`, `IdBarang`) VALUES
(1, 2, 220000, 1),
(2, 1, 400000, 3),
(3, 2, 130000, 4),
(4, 4, 300000, 1),
(5, 1, 600000, 5),
(6, 2, 210000, 2),
(7, 7, 100000, 4),
(8, 3, 110000, 4),
(9, 2, 240000, 1),
(10, 1, 250000, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `IdSupplier` int(11) NOT NULL,
  `NamaSupplier` varchar(150) NOT NULL,
  `Alamat` text NOT NULL,
  `Kontak` varchar(50) NOT NULL,
  `ChannelPayment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`IdSupplier`, `NamaSupplier`, `Alamat`, `Kontak`, `ChannelPayment`) VALUES
(1, 'PT. Universal Jaya Perkasa', 'Komplek Green Lake City Rukan Sentra Niaga Blok B No 9', '082330602071', 'Transfer Bank'),
(2, 'PT. Foxa Asa Energi', '\r\nAlamat\r\npermata regency D/37', '083871576645', 'Paypal'),
(3, 'CV. Dua Putra Petir', 'Bukit Palma Blok C5 No.33', '089630309951', 'Paypal'),
(4, 'PT Karya Baru Indonesia', 'Jl. Pisangan Lama Selatan', '083871576645', 'Transfer Bank'),
(5, 'PT. Tritan Utama', 'Jl. Diklat Pemda Tangerang', '089630309951', 'Paypal'),
(6, 'Mitra Usaha Mandiri Tangerang', 'Jalur Sutera Tmur. Kav 3A No.15', '083871576645', 'Paypal'),
(7, 'DISTRIBUTOR KOMPRESOR AC', 'Jln Hayam Wuruk 127 Gedung LTC Lantai 2', '089630309951', 'Transfer Bank'),
(8, 'Esprobags', 'Permata Regency Cluster Lazuli E2/10', '083871576645', 'E-Wallet'),
(9, 'Sintech', 'Jl. Raya Domas Utara No. 498', '089630309951', 'E-Wallet'),
(10, 'Handuk Terry Palmer', 'Gedung Pusat Perdagangan Pasar Pagi', '083871576645', 'Transfer Bank'),
(11, 'Planet Party', 'Keboan Sikep Rt 4 Rw1 Gedangan', '081219550857', 'E-Wallet'),
(12, 'PT. Manggala Indo Trading', 'Jl. Raya Serpong Km 8, Pakulonan, Serpong', '083871576645', 'Transfer Bank'),
(13, 'UD. Selatan Jaya', 'Songoyudan 31b, Surabaya', '081219550857', 'E-Wallet'),
(14, 'CV. Multi Solution Marketing', 'Rukan Newcastle Blok B-56, Jl. Green Lake', '083871576645', 'Transfer Bank'),
(15, 'Mutiara Sanjaya', 'Jl. Cakung Cilincing Timur Raya KM. 2', '081219550857', 'Paypal'),
(16, 'PT. Dhimas Trimitra Internasional', 'Gedung Plaza Jayakarta Lantai 1 No 2018', '081219550857', 'Transfer Bank'),
(17, 'PT. Denko Wahana Sakti DKI Jakarta', 'Komplek Duta Merlin Blok C 1-3', '083871576645', 'Paypal'),
(18, 'CV. Gihon Juma Sentosa', 'Jl. Letjend Jamin Ginting KM. 9,5', '081219550857', 'Transfer Bank'),
(19, 'Sami Jaya Tenda', 'Jl Raya Letjen R Suprapto No. 4', '083871576645', 'Transfer Bank'),
(20, 'Distributor Alat Perkakas & Teknik', 'Jln. Fajar Aladin Ruko Angke Permai ', '081219550857', 'Transfer Bank');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`IdBarang`),
  ADD KEY `IdPengguna` (`IdPengguna`);

--
-- Indeks untuk tabel `hakakses`
--
ALTER TABLE `hakakses`
  ADD PRIMARY KEY (`IdAkses`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`IdPelanggan`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`IdPembelian`),
  ADD KEY `IdBarang` (`IdBarang`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`IdPengguna`),
  ADD KEY `IdAkses` (`IdAkses`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`IdPenjualan`),
  ADD KEY `IdBarang` (`IdBarang`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`IdSupplier`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `IdBarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `hakakses`
--
ALTER TABLE `hakakses`
  MODIFY `IdAkses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `IdPembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `IdPengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `IdPenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `IdSupplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`IdPengguna`) REFERENCES `pengguna` (`IdPengguna`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`IdBarang`) REFERENCES `barang` (`IdBarang`);

--
-- Ketidakleluasaan untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`IdAkses`) REFERENCES `hakakses` (`IdAkses`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`IdBarang`) REFERENCES `barang` (`IdBarang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
