-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jul 2023 pada 13.18
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `streamlit`
--

CREATE TABLE `streamlit` (
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kondisi` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `streamlit`
--

INSERT INTO `streamlit` (`waktu`, `kondisi`) VALUES
('2023-07-09 17:00:00', 'Cheating'),
('2023-07-09 17:00:00', 'Cheating'),
('2023-07-09 17:00:00', 'Cheating'),
('2023-07-09 17:00:00', 'No_Cheating'),
('2023-07-09 17:00:00', 'No_Cheating'),
('2023-07-09 17:00:00', 'No_Cheating'),
('2023-07-10 21:25:45', 'No_Cheating'),
('2023-07-10 21:26:22', 'No_Cheating'),
('2023-07-10 21:28:06', 'No_Cheating'),
('2023-07-10 21:28:17', 'No_Cheating'),
('2023-07-10 21:31:20', 'No_Cheating'),
('2023-07-10 21:32:56', 'No_Cheating'),
('2023-07-10 21:33:04', 'No_Cheating'),
('2023-07-11 01:42:39', 'No_Cheating'),
('2023-07-11 01:43:47', 'No_Cheating'),
('2023-07-11 01:58:53', 'Cheating'),
('2023-07-11 02:57:08', 'No_Cheating'),
('2023-07-11 03:00:32', 'No_Cheating'),
('2023-07-11 03:08:24', 'No_Cheating'),
('2023-07-11 03:09:25', 'No_Cheating'),
('2023-07-11 03:09:41', 'No_Cheating'),
('2023-07-11 03:09:47', 'No_Cheating'),
('2023-07-11 03:11:05', 'No_Cheating'),
('2023-07-11 03:15:02', 'Cheating'),
('2023-07-11 03:18:12', 'Cheating'),
('2023-07-11 03:18:24', 'Cheating'),
('2023-07-11 03:18:56', 'Cheating'),
('2023-07-11 03:19:59', 'Cheating'),
('2023-07-11 03:20:27', 'Cheating'),
('2023-07-11 04:21:56', 'Cheating'),
('2023-07-11 04:29:52', 'Cheating');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `is_verified`, `createdAt`, `updatedAt`) VALUES
(13, 'Ikhsan', 'rifatsean24@gmail.com', 'pbkdf2:sha256:600000$ATlRyO6HxJL99lH6$d15cb16411654974555b8096c247d19863bbe181bf571d366acb30fb922800d2', 1, '2023-07-11 03:50:31', '2023-07-11 03:50:31'),
(14, 'anggi', 'anggicecel@gmail.com', 'pbkdf2:sha256:600000$S5UEs7K8E5GEkgoE$970fe47595301faada57dd0b0032920c73a70f8f9e6d00f901c3b913d7515bc1', 1, '2023-07-11 03:54:47', '2023-07-11 03:54:47'),
(22, 'string', 'sifanuzulwulan@gmail.com', 'pbkdf2:sha256:600000$N6K3jo2fJHp0iNyx$6552a8e14671839787030ed856bf13958d2ac691b84f719798f1c8e8777127f6', 1, '2023-07-11 03:55:00', '2023-07-11 03:55:00'),
(24, 'nabila', 'nabilaasshafap@gmail.com', 'pbkdf2:sha256:600000$7QBhDmipbglvXMSF$0a3e94791fc84a8a6d296c240ea7c7f5b77e6bf3079c4fff206c701ecd92fc60', 1, '2023-07-13 05:09:37', '2023-07-13 05:09:37'),
(25, 'nabila', 'nabilaasshafap@gmail.com', 'pbkdf2:sha256:600000$BiNgtALnrhR6uOdQ$24bb84ef4c41f3df7a9c5d9623ab1ed369d3a4bef4f1a4a5877d7156676f904a', 1, '2023-07-11 10:36:12', '2023-07-11 10:36:12'),
(26, 'ningrum', 'estirestian80@gmail.com', '12345', 1, '2023-07-13 07:17:56', '2023-07-13 07:17:56'),
(27, 'lalaa', 'annilanurulhusna123@gmail.com', '12345', 1, '2023-07-13 07:17:40', '2023-07-13 07:17:40'),
(28, 'anah', 'trialmuamanah123@gmail.com', '12345', 1, '2023-07-13 07:19:13', '2023-07-13 07:19:13'),
(29, 'nabila', 'nabila.ap169@gmail.com', '12345', 1, '2023-07-13 07:20:15', '2023-07-13 07:20:15'),
(30, 'zahra', 'salsabila200@gmail.com', '12345', 1, '2023-07-13 07:21:17', '2023-07-13 07:21:17'),
(31, 'evi', 'mamaevipuspawati0@gmail.com', '12345', 1, '2023-07-13 07:22:10', '2023-07-13 07:22:10'),
(32, 'darpleng', 'darpleng1234@gmail.com', '12345', 1, '2023-07-13 07:23:13', '2023-07-13 07:23:13'),
(33, 'juli', 'juli123@gmail.com', '12345', 1, '2023-07-13 07:23:54', '2023-07-13 07:23:54'),
(35, 'hariss', 'fariyano999@gmail.com', '12345', 1, '2023-07-13 07:24:35', '2023-07-13 07:24:35'),
(36, 'cu', 'cuganteng0@gmail.com', '12345', 1, '2023-07-13 07:26:10', '2023-07-13 07:26:10'),
(37, 'tamami', 'tamami222@gmail.com', '12345', 1, '2023-07-13 07:26:54', '2023-07-13 07:26:54'),
(38, 'balmond', 'balmond111@gmail.com', '12345', 1, '2023-07-13 07:27:33', '2023-07-13 07:27:33'),
(39, 'farel', 'farel1234@gmail.com', '12345', 1, '2023-07-13 07:28:23', '2023-07-13 07:28:23'),
(40, 'kikii', 'kikiii@gmail.com', '12345', 1, '2023-07-13 07:29:08', '2023-07-13 07:29:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
