-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 14 fév. 2020 à 08:13
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pidev`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` varchar(20) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `login_admin` varchar(20) DEFAULT NULL,
  `mdp_admin` varchar(20) DEFAULT NULL,
  `num_compte` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `num_compte` (`num_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id_commentaire` int(20) NOT NULL AUTO_INCREMENT,
  `date_commentaire` date DEFAULT NULL,
  `contenu_commentaire` varchar(252) DEFAULT NULL,
  `id_user` int(20) NOT NULL,
  `id_pub` int(20) NOT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `id_user` (`id_user`),
  KEY `id_pub` (`id_pub`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `date_commentaire`, `contenu_commentaire`, `id_user`, `id_pub`) VALUES
(1, '2048-01-05', 'delevvvvte', 5, 8),
(4, '2012-11-05', 'delete', 5, 77),
(8, '2013-01-05', 'delete', 5, 8),
(77, '2013-01-05', 'delete', 5, 8),
(78, '2048-01-05', 'update', 5, 8),
(88, '2048-01-05', 'update', 5, 8),
(89, '2020-02-19', 'coount', 2, 2),
(90, '1919-12-12', 'autuuoincrement', 0, 0),
(91, '1919-12-12', 'contenu_commentaire', 0, 26),
(92, '1920-06-12', 'contenu_', 0, 26),
(93, '1920-06-12', 'contenu_', 0, 26),
(94, '1920-06-12', 'contenu_', 0, 26),
(95, '1920-06-12', 'contenu_', 0, 26),
(96, '1920-06-12', 'contenu_', 0, 26),
(97, '1920-06-12', 'contenu_', 0, 26),
(98, '1920-06-12', 'contenu_', 0, 26),
(99, '1920-06-12', 'contenu_', 0, 26),
(100, '1920-06-12', 'contenu_', 0, 26),
(101, '1920-06-12', 'contenu_', 0, 26),
(102, '1920-06-12', 'contenu_', 0, 26),
(103, '1920-06-12', 'contenu_', 0, 26),
(104, '1920-06-12', 'contenu_', 0, 26),
(105, '1920-06-12', 'contenu_', 0, 26),
(106, '1920-06-12', 'contenu_', 0, 26),
(107, '1920-06-12', 'contenu_', 0, 26),
(108, '1920-06-12', 'contenu_', 0, 26),
(109, '1920-06-12', 'contenu_', 0, 26),
(110, '1920-06-12', 'contenu_', 0, 26),
(111, '1920-06-12', 'contenu_', 0, 26),
(112, '1920-06-12', 'contenu_', 0, 26),
(113, '1920-06-12', 'contenu_', 0, 26),
(114, '1920-06-12', 'contenu_', 0, 26),
(115, '1920-06-12', 'contenu_', 0, 26),
(116, '1920-06-12', 'contenu_', 0, 26),
(117, '1920-06-12', 'contenu_', 0, 26),
(118, '1920-06-12', 'contenu_', 0, 26),
(119, '1920-06-12', 'contenu_', 0, 26),
(120, '1920-06-12', 'contenu_', 0, 26),
(121, '1920-06-12', 'contenu_', 0, 26),
(122, '1920-06-12', 'contenu_', 0, 26),
(123, '1920-06-12', 'contenu_', 0, 26),
(124, '1920-06-12', 'contenu_', 0, 26),
(125, '1920-06-12', 'contenu_', 0, 26),
(126, '1920-06-12', 'contenu_', 0, 26),
(127, '1920-06-12', 'contenu_', 0, 26),
(128, '1920-06-12', 'contenu_', 0, 26),
(129, '1920-06-12', 'contenu_', 0, 26),
(130, '1920-06-12', 'contenu_', 0, 26),
(131, '1920-06-12', 'contenu_', 0, 26),
(132, '1920-06-12', 'contenu_', 0, 26),
(133, '1920-06-12', 'contenu_', 0, 26),
(134, '1920-06-12', 'contenu_', 0, 26),
(135, '1920-06-12', 'contenu_', 0, 26),
(136, '1920-06-12', 'contenu_', 0, 26),
(137, '1920-06-12', 'contenu_', 0, 26),
(138, '1920-06-12', 'contenu_', 0, 26),
(139, '1920-06-12', 'contenu_', 0, 26),
(140, '1920-06-12', 'contenu_', 0, 26),
(141, '1920-06-12', 'contenu_', 0, 26),
(142, '1920-06-12', 'contenu_', 0, 26),
(143, '1920-06-12', 'contenu_', 0, 26),
(144, '1920-06-12', 'contenu_', 0, 26),
(145, '1920-06-12', 'contenu_', 0, 26),
(146, '1920-06-12', 'contenu_', 0, 26),
(147, '1920-06-12', 'contenu_', 0, 26),
(148, '1920-06-12', 'contenu_', 0, 26),
(149, '1920-06-12', 'contenu_', 0, 26),
(150, '1920-06-12', 'contenu_', 0, 26),
(151, '1920-06-12', 'contenu_', 0, 26),
(152, '1920-06-12', 'contenu_', 0, 26),
(153, '1920-06-12', 'contenu_', 0, 26),
(154, '1920-06-12', 'contenu_', 0, 26),
(155, '1920-06-12', 'contenu_', 0, 26),
(156, '1920-06-12', 'contenu_', 0, 26);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id_competence` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_competence`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `num_compte` int(20) NOT NULL AUTO_INCREMENT,
  `date_ajout` date NOT NULL,
  `id_user` int(20) NOT NULL,
  PRIMARY KEY (`num_compte`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE IF NOT EXISTS `connexion` (
  `date_co` date NOT NULL,
  `heure_co` time(6) NOT NULL,
  `id_user` int(20) NOT NULL AUTO_INCREMENT,
  `num_compte` int(20) NOT NULL,
  PRIMARY KEY (`id_user`,`num_compte`),
  KEY `num_compte` (`num_compte`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `date_evenement` date NOT NULL,
  `description` varchar(252) DEFAULT NULL,
  `nom_evenement` varchar(30) DEFAULT NULL,
  `id_evenement` int(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `nombre_participant` int(11) NOT NULL,
  `nombre_interesse` int(11) NOT NULL,
  `Etat` varchar(30) NOT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`date_evenement`, `description`, `nom_evenement`, `id_evenement`, `photo`, `nombre_participant`, `nombre_interesse`, `Etat`) VALUES
('2019-01-05', 'aaa', 's', 1, 'ghjkl', 13, 15, 'D'),
('2019-01-05', 'ggg', 's', 2, 'ghjkl', 14, 14, 'A');

-- --------------------------------------------------------

--
-- Structure de la table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
CREATE TABLE IF NOT EXISTS `invitation` (
  `id_event` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  KEY `id_event` (`id_event`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `invitation`
--

INSERT INTO `invitation` (`id_event`, `id_user`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `listabonne`
--

DROP TABLE IF EXISTS `listabonne`;
CREATE TABLE IF NOT EXISTS `listabonne` (
  `id_listabo` int(20) NOT NULL AUTO_INCREMENT,
  `nbrabo` int(50) NOT NULL,
  `id_user` int(20) NOT NULL,
  PRIMARY KEY (`id_listabo`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE IF NOT EXISTS `maintenance` (
  `date_maj` date NOT NULL,
  `date_suppr` date NOT NULL,
  `motif` varchar(20) DEFAULT NULL,
  `id_admin` int(20) NOT NULL AUTO_INCREMENT,
  `num_compte` int(20) NOT NULL,
  PRIMARY KEY (`id_admin`,`num_compte`),
  KEY `num_compte` (`num_compte`),
  KEY `id_admin` (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_msg` int(20) NOT NULL AUTO_INCREMENT,
  `id_user` int(20) NOT NULL,
  `type_msg` int(20) NOT NULL,
  PRIMARY KEY (`id_msg`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `id_pub` int(20) NOT NULL AUTO_INCREMENT,
  `type_pub` varchar(20) DEFAULT NULL,
  `id_user` int(20) DEFAULT NULL,
  `nom_pub` varchar(20) DEFAULT NULL,
  `date_pub` date DEFAULT NULL,
  `contenu_pub` varchar(252) NOT NULL,
  PRIMARY KEY (`id_pub`),
  KEY `id_user` (`id_user`),
  KEY `id_user_2` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `publication`
--

INSERT INTO `publication` (`id_pub`, `type_pub`, `id_user`, `nom_pub`, `date_pub`, `contenu_pub`) VALUES
(2, 'amal', 0, 'sab', '2019-01-05', ' contenu_pub'),
(3, 'amal', 0, ' ahmed', '2019-01-05', ' contenu_pub'),
(26, 'audio', 0, 'try', '1919-12-12', 'url');

-- --------------------------------------------------------

--
-- Structure de la table `sponsoring`
--

DROP TABLE IF EXISTS `sponsoring`;
CREATE TABLE IF NOT EXISTS `sponsoring` (
  `id_spon` int(20) NOT NULL AUTO_INCREMENT,
  `montant` float NOT NULL,
  `id_pub` int(20) NOT NULL,
  `id_event` int(20) NOT NULL,
  PRIMARY KEY (`id_spon`),
  UNIQUE KEY `id_pub` (`id_pub`),
  UNIQUE KEY `id_event` (`id_event`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `adresse` varchar(20) DEFAULT NULL,
  `adresse_mail` varchar(20) DEFAULT NULL,
  `loginc_user` varchar(20) DEFAULT NULL,
  `mdp_user` varchar(20) NOT NULL,
  `talent` varchar(20) NOT NULL,
  `num_compte` int(20) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `num_compte` (`num_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `adresse`, `adresse_mail`, `loginc_user`, `mdp_user`, `talent`, `num_compte`) VALUES
(1, 'sab', 'sab', 'sab', 'sab', 'sab', 'sab', 'sb', 23);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id_evenement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
