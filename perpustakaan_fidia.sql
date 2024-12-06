-- Membuat database perpustakaan_fidia
CREATE DATABASE perpustakaan_fidia;
USE perpustakaan_fidia;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2024 at 09:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_fidia`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` INT NOT NULL AUTO_INCREMENT,
  `nama_depan` VARCHAR(100) NOT NULL,
  `nama_belakang` VARCHAR(100) NOT NULL,
  `tanggal_lahir` DATE NOT NULL,
  `alamat` VARCHAR(255) NOT NULL,
  `telepon` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `tanggal_keanggotaan` DATE NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pustakawan`
--

CREATE TABLE `pustakawan` (
  `id_pustakawan` INT NOT NULL AUTO_INCREMENT,
  `nama_depan` VARCHAR(100) NOT NULL,
  `nama_belakang` VARCHAR(100) NOT NULL,
  `telepon` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (`id_pustakawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` INT NOT NULL AUTO_INCREMENT,
  `judul` VARCHAR(255) NOT NULL,
  `penulis` VARCHAR(255) NOT NULL,
  `penerbit` VARCHAR(255) NOT NULL,
  `tahun_terbit` YEAR NOT NULL,
  `isbn` VARCHAR(20) NOT NULL UNIQUE,
  `kategori` VARCHAR(100) NOT NULL,
  `jumlah` INT NOT NULL,
  `lokasi_rak` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` INT NOT NULL AUTO_INCREMENT,
  `id_buku` INT NOT NULL,
  `id_anggota` INT NOT NULL,
  `id_pustakawan` INT NOT NULL,
  `tanggal_pinjam` DATE NOT NULL,
  `tanggal_kembali` DATE NOT NULL,
  `status_pengembalian` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_peminjaman`),
  FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_pustakawan`) REFERENCES `pustakawan` (`id_pustakawan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;