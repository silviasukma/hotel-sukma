-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2022 pada 00.54
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasihotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailfasititaskamar`
--

CREATE TABLE `detailfasititaskamar` (
  `iddetailfasilitaskamar` int(11) NOT NULL,
  `fasilitasid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `idfasilitas` int(11) NOT NULL,
  `namafasilitas` varchar(50) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `picture` varchar(45) NOT NULL,
  `jenisfasilitas` enum('KAMAR','HOTEL') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`idfasilitas`, `namafasilitas`, `icon`, `picture`, `jenisfasilitas`, `created_at`, `updated_at`) VALUES
(1, 'Air Conditioner', 'fa fa-ac', '', 'KAMAR', '2022-11-01 04:31:15', '2022-11-01 04:31:15'),
(4, 'Shower', 'fa fa-shower', '', 'KAMAR', '2022-11-01 04:32:31', '2022-11-01 04:32:31'),
(5, 'Sofa', 'fa fa-shofa', '', 'KAMAR', '2022-11-01 04:33:23', '2022-11-01 04:33:23'),
(6, 'Kamar Mandi', 'fa fa-bath', '', 'KAMAR', '2022-11-01 07:30:27', '2022-11-01 07:30:27'),
(7, 'tes', '', '1000-IMG-Picture.jpg', 'HOTEL', '2022-11-08 02:04:55', '2022-11-08 02:04:55'),
(8, 'hotel', '', '1000-IMG-Picture.jpg', 'HOTEL', '2022-11-08 02:05:04', '2022-11-08 02:05:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` int(11) NOT NULL,
  `namakamar` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `jumlahqty` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipekamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamargalery`
--

CREATE TABLE `kamargalery` (
  `idkamargalery` int(11) NOT NULL,
  `url` text NOT NULL,
  `is_active` enum('YES','NO') NOT NULL,
  `kamarid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `idreservasi` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `lama` int(11) NOT NULL,
  `qtykamar` int(11) NOT NULL,
  `status` enum('RESERVASI','CHECKIN','CHECKOUT','CANCEL') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` int(11) NOT NULL,
  `canceled_by` int(11) NOT NULL,
  `approved_date` datetime NOT NULL,
  `canceled_date` datetime NOT NULL,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `idreview` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `idtamu` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jeniskelamin` enum('PRIA','WANITA') NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipekamar`
--

CREATE TABLE `tipekamar` (
  `idtipekamar` int(11) NOT NULL,
  `tipekamar` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tipekamar`
--

INSERT INTO `tipekamar` (`idtipekamar`, `tipekamar`, `created_at`, `updated_at`) VALUES
(1, 'single', '2022-11-01 00:34:44', '2022-11-01 00:34:44'),
(2, 'Hotel88', '2022-11-01 01:12:36', '2022-11-01 01:12:36'),
(3, 'VIP', '2022-11-01 02:07:54', '2022-11-01 02:07:54'),
(6, 'VVIP', '2022-11-01 02:18:15', '2022-11-01 02:18:15'),
(8, 'single saja 2', '2022-11-01 02:49:56', '2022-11-01 02:49:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tripadvisor`
--

CREATE TABLE `tripadvisor` (
  `idtripadvisor` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `nameuser` varchar(100) NOT NULL,
  `jeniskelamin` enum('pria','wanita') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `notelepon` varchar(13) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`iduser`, `nameuser`, `jeniskelamin`, `alamat`, `notelepon`, `username`, `password`, `role`, `created_at`, `update_at`) VALUES
(1, 'khusnul ning fadila', 'wanita', 'jember', '081353987594', 'khusnulningfadila04@gmail.com', '12345', 'admin', '2022-10-18 06:24:27', '2022-10-18 06:24:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailfasititaskamar`
--
ALTER TABLE `detailfasititaskamar`
  ADD PRIMARY KEY (`iddetailfasilitaskamar`),
  ADD KEY `fasilitasid` (`fasilitasid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`idfasilitas`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`),
  ADD KEY `tipekamarid` (`tipekamarid`);

--
-- Indeks untuk tabel `kamargalery`
--
ALTER TABLE `kamargalery`
  ADD PRIMARY KEY (`idkamargalery`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`idreservasi`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`idreview`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`idtamu`);

--
-- Indeks untuk tabel `tipekamar`
--
ALTER TABLE `tipekamar`
  ADD PRIMARY KEY (`idtipekamar`);

--
-- Indeks untuk tabel `tripadvisor`
--
ALTER TABLE `tripadvisor`
  ADD PRIMARY KEY (`idtripadvisor`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detailfasititaskamar`
--
ALTER TABLE `detailfasititaskamar`
  MODIFY `iddetailfasilitaskamar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `idfasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `idkamar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kamargalery`
--
ALTER TABLE `kamargalery`
  MODIFY `idkamargalery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `idreservasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `idreview` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `idtamu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tipekamar`
--
ALTER TABLE `tipekamar`
  MODIFY `idtipekamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tripadvisor`
--
ALTER TABLE `tripadvisor`
  MODIFY `idtripadvisor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailfasititaskamar`
--
ALTER TABLE `detailfasititaskamar`
  ADD CONSTRAINT `detailfasititaskamar_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`),
  ADD CONSTRAINT `detailfasititaskamar_ibfk_2` FOREIGN KEY (`fasilitasid`) REFERENCES `fasilitas` (`idfasilitas`);

--
-- Ketidakleluasaan untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`tipekamarid`) REFERENCES `tipekamar` (`idtipekamar`);

--
-- Ketidakleluasaan untuk tabel `kamargalery`
--
ALTER TABLE `kamargalery`
  ADD CONSTRAINT `kamargalery_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`);

--
-- Ketidakleluasaan untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`);

--
-- Ketidakleluasaan untuk tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`);

--
-- Ketidakleluasaan untuk tabel `tripadvisor`
--
ALTER TABLE `tripadvisor`
  ADD CONSTRAINT `tripadvisor_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`),
  ADD CONSTRAINT `tripadvisor_ibfk_2` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
