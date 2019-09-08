-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2019 at 12:59 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_crawl`
--

-- --------------------------------------------------------

--
-- Table structure for table `imdb_cast`
--

CREATE TABLE `imdb_cast` (
  `id_cast` int(11) NOT NULL,
  `nama_cast` varchar(100) DEFAULT NULL,
  `link_cast` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_director`
--

CREATE TABLE `imdb_director` (
  `id_director` int(11) NOT NULL,
  `nama_director` varchar(100) DEFAULT NULL,
  `link_director` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_genre`
--

CREATE TABLE `imdb_genre` (
  `id_genre` int(11) NOT NULL,
  `nama_genre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_movie`
--

CREATE TABLE `imdb_movie` (
  `id_movie` int(11) NOT NULL,
  `judul_movie` varchar(200) NOT NULL,
  `tahun_movie` varchar(20) DEFAULT NULL,
  `gross_movie` int(11) DEFAULT NULL,
  `rating_movie` double DEFAULT NULL,
  `meta_movie` double DEFAULT NULL,
  `vote_movie` int(11) DEFAULT NULL,
  `rate_movie` varchar(50) DEFAULT NULL,
  `durasi_movie` varchar(50) DEFAULT NULL,
  `deskripsi_movie` text,
  `link_movie` varchar(200) DEFAULT NULL,
  `poster_movie` text,
  `dt_movie` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_movie_cast`
--

CREATE TABLE `imdb_movie_cast` (
  `id_movie_cast` int(11) NOT NULL,
  `id_cast` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_movie_director`
--

CREATE TABLE `imdb_movie_director` (
  `id_movie_director` int(11) NOT NULL,
  `id_director` int(11) DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imdb_movie_genre`
--

CREATE TABLE `imdb_movie_genre` (
  `id_movie_genre` int(11) NOT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cast`
-- (See below for the actual view)
--
CREATE TABLE `v_cast` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`id_cast` int(11)
,`nama_cast` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cast_listed`
-- (See below for the actual view)
--
CREATE TABLE `v_cast_listed` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`cast_movie` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_director`
-- (See below for the actual view)
--
CREATE TABLE `v_director` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`id_director` int(11)
,`nama_director` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_director_listed`
-- (See below for the actual view)
--
CREATE TABLE `v_director_listed` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`director_movie` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_genre`
-- (See below for the actual view)
--
CREATE TABLE `v_genre` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`id_genre` int(11)
,`nama_genre` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_genre_listed`
-- (See below for the actual view)
--
CREATE TABLE `v_genre_listed` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`genre_movie` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_imdb`
-- (See below for the actual view)
--
CREATE TABLE `v_imdb` (
`id_movie` int(11)
,`judul_movie` varchar(200)
,`tahun_movie` varchar(20)
,`gross_movie` int(11)
,`rating_movie` double
,`meta_movie` double
,`vote_movie` int(11)
,`rate_movie` varchar(50)
,`durasi_movie` varchar(50)
,`deskripsi_movie` text
,`link_movie` varchar(200)
,`poster_movie` text
,`dt_movie` datetime
,`id_cast` int(11)
,`nama_cast` varchar(100)
,`id_director` int(11)
,`nama_director` varchar(100)
,`id_genre` int(11)
,`nama_genre` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_movie`
-- (See below for the actual view)
--
CREATE TABLE `v_movie` (
`id` int(11)
,`judul` varchar(200)
,`tahun` varchar(20)
,`gross` int(11)
,`rating` double
,`meta` double
,`vote` int(11)
,`rate` varchar(50)
,`durasi` varchar(50)
,`deskripsi` text
,`link` varchar(200)
,`poster` text
,`date_update` datetime
,`genre` text
,`director` text
,`cast` text
);

-- --------------------------------------------------------

--
-- Structure for view `v_cast`
--
DROP TABLE IF EXISTS `v_cast`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cast`  AS  select `b`.`id_movie` AS `id_movie`,`b`.`judul_movie` AS `judul_movie`,`b`.`tahun_movie` AS `tahun_movie`,`b`.`rating_movie` AS `rating_movie`,`b`.`meta_movie` AS `meta_movie`,`b`.`vote_movie` AS `vote_movie`,`b`.`rate_movie` AS `rate_movie`,`b`.`durasi_movie` AS `durasi_movie`,`b`.`deskripsi_movie` AS `deskripsi_movie`,`b`.`link_movie` AS `link_movie`,`b`.`poster_movie` AS `poster_movie`,`b`.`dt_movie` AS `dt_movie`,`a`.`id_cast` AS `id_cast`,`a`.`nama_cast` AS `nama_cast` from ((`imdb_cast` `a` join `imdb_movie` `b`) join `imdb_movie_cast` `c`) where ((`b`.`id_movie` = `c`.`id_movie`) and (`a`.`id_cast` = `c`.`id_cast`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_cast_listed`
--
DROP TABLE IF EXISTS `v_cast_listed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cast_listed`  AS  select `a`.`id_movie` AS `id_movie`,`a`.`judul_movie` AS `judul_movie`,`a`.`tahun_movie` AS `tahun_movie`,`a`.`rating_movie` AS `rating_movie`,`a`.`meta_movie` AS `meta_movie`,`a`.`vote_movie` AS `vote_movie`,`a`.`rate_movie` AS `rate_movie`,`a`.`durasi_movie` AS `durasi_movie`,`a`.`deskripsi_movie` AS `deskripsi_movie`,`a`.`link_movie` AS `link_movie`,`a`.`poster_movie` AS `poster_movie`,`a`.`dt_movie` AS `dt_movie`,group_concat(`a`.`nama_cast` separator ',') AS `cast_movie` from `v_cast` `a` group by `a`.`id_movie` ;

-- --------------------------------------------------------

--
-- Structure for view `v_director`
--
DROP TABLE IF EXISTS `v_director`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_director`  AS  select `b`.`id_movie` AS `id_movie`,`b`.`judul_movie` AS `judul_movie`,`b`.`tahun_movie` AS `tahun_movie`,`b`.`rating_movie` AS `rating_movie`,`b`.`meta_movie` AS `meta_movie`,`b`.`vote_movie` AS `vote_movie`,`b`.`rate_movie` AS `rate_movie`,`b`.`durasi_movie` AS `durasi_movie`,`b`.`deskripsi_movie` AS `deskripsi_movie`,`b`.`link_movie` AS `link_movie`,`b`.`poster_movie` AS `poster_movie`,`b`.`dt_movie` AS `dt_movie`,`a`.`id_director` AS `id_director`,`a`.`nama_director` AS `nama_director` from ((`imdb_director` `a` join `imdb_movie` `b`) join `imdb_movie_director` `c`) where ((`b`.`id_movie` = `c`.`id_movie`) and (`a`.`id_director` = `c`.`id_director`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_director_listed`
--
DROP TABLE IF EXISTS `v_director_listed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_director_listed`  AS  select `a`.`id_movie` AS `id_movie`,`a`.`judul_movie` AS `judul_movie`,`a`.`tahun_movie` AS `tahun_movie`,`a`.`rating_movie` AS `rating_movie`,`a`.`meta_movie` AS `meta_movie`,`a`.`vote_movie` AS `vote_movie`,`a`.`rate_movie` AS `rate_movie`,`a`.`durasi_movie` AS `durasi_movie`,`a`.`deskripsi_movie` AS `deskripsi_movie`,`a`.`link_movie` AS `link_movie`,`a`.`poster_movie` AS `poster_movie`,`a`.`dt_movie` AS `dt_movie`,group_concat(`a`.`nama_director` separator ',') AS `director_movie` from `v_director` `a` group by `a`.`id_movie` ;

-- --------------------------------------------------------

--
-- Structure for view `v_genre`
--
DROP TABLE IF EXISTS `v_genre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_genre`  AS  select `b`.`id_movie` AS `id_movie`,`b`.`judul_movie` AS `judul_movie`,`b`.`tahun_movie` AS `tahun_movie`,`b`.`rating_movie` AS `rating_movie`,`b`.`meta_movie` AS `meta_movie`,`b`.`vote_movie` AS `vote_movie`,`b`.`rate_movie` AS `rate_movie`,`b`.`durasi_movie` AS `durasi_movie`,`b`.`deskripsi_movie` AS `deskripsi_movie`,`b`.`link_movie` AS `link_movie`,`b`.`poster_movie` AS `poster_movie`,`b`.`dt_movie` AS `dt_movie`,`a`.`id_genre` AS `id_genre`,`a`.`nama_genre` AS `nama_genre` from ((`imdb_genre` `a` join `imdb_movie` `b`) join `imdb_movie_genre` `c`) where ((`b`.`id_movie` = `c`.`id_movie`) and (`a`.`id_genre` = `c`.`id_genre`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_genre_listed`
--
DROP TABLE IF EXISTS `v_genre_listed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_genre_listed`  AS  select `a`.`id_movie` AS `id_movie`,`a`.`judul_movie` AS `judul_movie`,`a`.`tahun_movie` AS `tahun_movie`,`a`.`rating_movie` AS `rating_movie`,`a`.`meta_movie` AS `meta_movie`,`a`.`vote_movie` AS `vote_movie`,`a`.`rate_movie` AS `rate_movie`,`a`.`durasi_movie` AS `durasi_movie`,`a`.`deskripsi_movie` AS `deskripsi_movie`,`a`.`link_movie` AS `link_movie`,`a`.`poster_movie` AS `poster_movie`,`a`.`dt_movie` AS `dt_movie`,group_concat(`a`.`nama_genre` separator ',') AS `genre_movie` from `v_genre` `a` group by `a`.`id_movie` ;

-- --------------------------------------------------------

--
-- Structure for view `v_imdb`
--
DROP TABLE IF EXISTS `v_imdb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_imdb`  AS  select `d`.`id_movie` AS `id_movie`,`d`.`judul_movie` AS `judul_movie`,`d`.`tahun_movie` AS `tahun_movie`,`d`.`gross_movie` AS `gross_movie`,`d`.`rating_movie` AS `rating_movie`,`d`.`meta_movie` AS `meta_movie`,`d`.`vote_movie` AS `vote_movie`,`d`.`rate_movie` AS `rate_movie`,`d`.`durasi_movie` AS `durasi_movie`,`d`.`deskripsi_movie` AS `deskripsi_movie`,`d`.`link_movie` AS `link_movie`,`d`.`poster_movie` AS `poster_movie`,`d`.`dt_movie` AS `dt_movie`,`a`.`id_cast` AS `id_cast`,`a`.`nama_cast` AS `nama_cast`,`b`.`id_director` AS `id_director`,`b`.`nama_director` AS `nama_director`,`c`.`id_genre` AS `id_genre`,`c`.`nama_genre` AS `nama_genre` from ((((((`imdb_cast` `a` join `imdb_director` `b`) join `imdb_genre` `c`) join `imdb_movie` `d`) join `imdb_movie_cast` `e`) join `imdb_movie_director` `f`) join `imdb_movie_genre` `g`) where ((`d`.`id_movie` = `e`.`id_movie`) and (`d`.`id_movie` = `f`.`id_movie`) and (`d`.`id_movie` = `g`.`id_movie`) and (`a`.`id_cast` = `e`.`id_cast`) and (`b`.`id_director` = `f`.`id_director`) and (`c`.`id_genre` = `g`.`id_genre`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_movie`
--
DROP TABLE IF EXISTS `v_movie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_movie`  AS  select `d`.`id_movie` AS `id`,`d`.`judul_movie` AS `judul`,`d`.`tahun_movie` AS `tahun`,`d`.`gross_movie` AS `gross`,`d`.`rating_movie` AS `rating`,`d`.`meta_movie` AS `meta`,`d`.`vote_movie` AS `vote`,`d`.`rate_movie` AS `rate`,`d`.`durasi_movie` AS `durasi`,`d`.`deskripsi_movie` AS `deskripsi`,`d`.`link_movie` AS `link`,`d`.`poster_movie` AS `poster`,`d`.`dt_movie` AS `date_update`,`c`.`genre_movie` AS `genre`,`b`.`director_movie` AS `director`,`a`.`cast_movie` AS `cast` from (((`v_cast_listed` `a` join `v_director_listed` `b`) join `v_genre_listed` `c`) join `imdb_movie` `d`) where ((`d`.`id_movie` = `a`.`id_movie`) and (`d`.`id_movie` = `b`.`id_movie`) and (`d`.`id_movie` = `c`.`id_movie`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `imdb_cast`
--
ALTER TABLE `imdb_cast`
  ADD PRIMARY KEY (`id_cast`),
  ADD UNIQUE KEY `id_cast` (`id_cast`);

--
-- Indexes for table `imdb_director`
--
ALTER TABLE `imdb_director`
  ADD PRIMARY KEY (`id_director`),
  ADD UNIQUE KEY `id_director` (`id_director`);

--
-- Indexes for table `imdb_genre`
--
ALTER TABLE `imdb_genre`
  ADD PRIMARY KEY (`id_genre`),
  ADD UNIQUE KEY `id_genre` (`id_genre`);

--
-- Indexes for table `imdb_movie`
--
ALTER TABLE `imdb_movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD UNIQUE KEY `id_movie` (`id_movie`),
  ADD UNIQUE KEY `id_movie_2` (`id_movie`);

--
-- Indexes for table `imdb_movie_cast`
--
ALTER TABLE `imdb_movie_cast`
  ADD PRIMARY KEY (`id_movie_cast`),
  ADD UNIQUE KEY `id_movie_cast` (`id_movie_cast`),
  ADD KEY `id_cast` (`id_cast`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indexes for table `imdb_movie_director`
--
ALTER TABLE `imdb_movie_director`
  ADD PRIMARY KEY (`id_movie_director`),
  ADD UNIQUE KEY `id_movie_director` (`id_movie_director`),
  ADD KEY `id_director` (`id_director`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indexes for table `imdb_movie_genre`
--
ALTER TABLE `imdb_movie_genre`
  ADD PRIMARY KEY (`id_movie_genre`),
  ADD UNIQUE KEY `id_movie_genre` (`id_movie_genre`),
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `id_genre` (`id_genre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `imdb_cast`
--
ALTER TABLE `imdb_cast`
  MODIFY `id_cast` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_director`
--
ALTER TABLE `imdb_director`
  MODIFY `id_director` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_genre`
--
ALTER TABLE `imdb_genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_movie`
--
ALTER TABLE `imdb_movie`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_movie_cast`
--
ALTER TABLE `imdb_movie_cast`
  MODIFY `id_movie_cast` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_movie_director`
--
ALTER TABLE `imdb_movie_director`
  MODIFY `id_movie_director` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imdb_movie_genre`
--
ALTER TABLE `imdb_movie_genre`
  MODIFY `id_movie_genre` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `imdb_movie_cast`
--
ALTER TABLE `imdb_movie_cast`
  ADD CONSTRAINT `imdb_movie_cast_ibfk_1` FOREIGN KEY (`id_cast`) REFERENCES `imdb_cast` (`id_cast`),
  ADD CONSTRAINT `imdb_movie_cast_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `imdb_movie` (`id_movie`);

--
-- Constraints for table `imdb_movie_director`
--
ALTER TABLE `imdb_movie_director`
  ADD CONSTRAINT `imdb_movie_director_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `imdb_director` (`id_director`),
  ADD CONSTRAINT `imdb_movie_director_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `imdb_movie` (`id_movie`);

--
-- Constraints for table `imdb_movie_genre`
--
ALTER TABLE `imdb_movie_genre`
  ADD CONSTRAINT `imdb_movie_genre_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `imdb_genre` (`id_genre`),
  ADD CONSTRAINT `imdb_movie_genre_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `imdb_movie` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
