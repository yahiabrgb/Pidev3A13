-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 14 fév. 2020 à 08:11
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetintegrédev`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `fullname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phoneNumber` int(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`fullname`, `email`, `phoneNumber`, `gender`, `dob`, `id`, `role`) VALUES
('yahia', 'talent1@gmail.com', 99373588, 'homme', '2020-02-13', 1, 'talentueux'),
('rouge', 'talent2@gmail.com', 99373588, 'homme', '3920-03-13', 2, 'talentueux'),
('shil', 'talent3@gmail.com', 99373588, 'homme', '1920-05-13', 3, 'talentueux'),
('chokri', 'talent4@gmail.com', 99373588, 'homme', '2920-05-13', 4, 'talentueux'),
('zak', 'talent5@gmail.com', 99373588, 'homme', '1970-01-01', 5, 'talentueux'),
('yahia', 'talent6@gmail.com', 99373588, 'homme', '3920-02-13', 6, 'talentueux'),
('rouge', 'talent6@gmail.com', 99373588, 'homme', '3920-02-13', 8, 'talentueux');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `confirmation_token` tinyint(1) NOT NULL,
  `role` varchar(20) NOT NULL,
  `client_id` int(20) NOT NULL,
  `id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`username`, `password`, `enabled`, `confirmation_token`, `role`, `client_id`, `id`) VALUES
('Medyahia', 'brgb', 1, 1, 'sana1', 15, 19),
('Medyahia', 'brgb', 1, 1, 'sana1', 1, 20),
('Medyahia', 'brgb', 1, 1, 'sana1', 2, 22),
('Medyahia', 'brgbb', 0, 1, 'sana1a', 18, 25);

-- --------------------------------------------------------

--
-- Structure de la table `mails`
--

DROP TABLE IF EXISTS `mails`;
CREATE TABLE IF NOT EXISTS `mails` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(252) NOT NULL,
  `subject` varchar(252) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mail_list`
--

DROP TABLE IF EXISTS `mail_list`;
CREATE TABLE IF NOT EXISTS `mail_list` (
  `mail_id` int(20) NOT NULL,
  `to_id` int(20) NOT NULL,
  `from_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `profilePicURL` varchar(252) NOT NULL,
  `timelinePicURL` varchar(252) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
