-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 08:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS `pengembalian`;
DROP TABLE IF EXISTS `peminjaman`;
DROP TABLE IF EXISTS `buku`;
DROP TABLE IF EXISTS `anggota`;

-- Table structure for table `anggota`
CREATE TABLE `anggota` (
  `ID_Anggota` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Telepon` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Tanggal_Daftar` date NOT NULL,
  PRIMARY KEY (`ID_Anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `buku`
CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(100) NOT NULL,
  `Penerbit` varchar(100) NOT NULL,
  `Tahun_Terbit` year NOT NULL,
  `Kategori` varchar(50) NOT NULL,
  `Jumlah_Buku` int(11) NOT NULL,
  PRIMARY KEY (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `peminjaman`
CREATE TABLE `peminjaman` (
  `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Anggota` int(11) NOT NULL,
  `ID_Buku` int(11) NOT NULL,
  `Tanggal_Pinjam` date NOT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Peminjaman`),
  FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota`(`ID_Anggota`) ON DELETE CASCADE,
  FOREIGN KEY (`ID_Buku`) REFERENCES `buku`(`ID_Buku`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `pengembalian`
CREATE TABLE `pengembalian` (
  `ID_Pengembalian` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Peminjaman` int(11) NOT NULL,
  `Tanggal_Pengembalian` date NOT NULL,
  `Denda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Pengembalian`),
  FOREIGN KEY (`ID_Peminjaman`) REFERENCES `peminjaman`(`ID_Peminjaman`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
