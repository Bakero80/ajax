-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Ven 31 Mars 2017 à 14:28
-- Version du serveur :  5.6.34
-- Version de PHP :  7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cdtheque`
--
CREATE DATABASE IF NOT EXISTS `cdtheque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cdtheque`;

-- --------------------------------------------------------

--
-- Structure de la table `cd_album`
--

CREATE TABLE `cd_album` (
  `album_id` int(11) NOT NULL,
  `album_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cd_album`
--

INSERT INTO `cd_album` (`album_id`, `album_name`) VALUES
(1, 'La paix du soir'),
(2, 'Paix du matin');

-- --------------------------------------------------------

--
-- Structure de la table `cd_album_has_categ`
--

CREATE TABLE `cd_album_has_categ` (
  `categ_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cd_album_has_categ`
--

INSERT INTO `cd_album_has_categ` (`categ_id`, `album_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cd_categ`
--

CREATE TABLE `cd_categ` (
  `categ_id` int(11) NOT NULL,
  `categ_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cd_categ`
--

INSERT INTO `cd_categ` (`categ_id`, `categ_name`) VALUES
(1, 'HIP HOP'),
(2, 'Techno Transe'),
(3, 'Metal'),
(4, 'Reggae');

-- --------------------------------------------------------

--
-- Structure de la table `cd_piste`
--

CREATE TABLE `cd_piste` (
  `piste_id` int(11) NOT NULL,
  `piste_ref` varchar(4) NOT NULL,
  `piste_name` varchar(250) NOT NULL,
  `piste_duration` varchar(50) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cd_piste`
--

INSERT INTO `cd_piste` (`piste_id`, `piste_ref`, `piste_name`, `piste_duration`, `album_id`) VALUES
(1, '01', 'Chant du Merle', '55 min', 1),
(2, '02', 'Chant du dauphin', '5 min', 1),
(3, '01', 'Les voix de L\'IMIE', '50 min', 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cd_album`
--
ALTER TABLE `cd_album`
  ADD PRIMARY KEY (`album_id`);

--
-- Index pour la table `cd_album_has_categ`
--
ALTER TABLE `cd_album_has_categ`
  ADD PRIMARY KEY (`categ_id`,`album_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Index pour la table `cd_categ`
--
ALTER TABLE `cd_categ`
  ADD PRIMARY KEY (`categ_id`);

--
-- Index pour la table `cd_piste`
--
ALTER TABLE `cd_piste`
  ADD PRIMARY KEY (`piste_id`),
  ADD KEY `album_id` (`album_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cd_album`
--
ALTER TABLE `cd_album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `cd_categ`
--
ALTER TABLE `cd_categ`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `cd_piste`
--
ALTER TABLE `cd_piste`
  MODIFY `piste_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cd_album_has_categ`
--
ALTER TABLE `cd_album_has_categ`
  ADD CONSTRAINT `cd_album_has_categ_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `cd_categ` (`categ_id`),
  ADD CONSTRAINT `cd_album_has_categ_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `cd_album` (`album_id`);

--
-- Contraintes pour la table `cd_piste`
--
ALTER TABLE `cd_piste`
  ADD CONSTRAINT `cd_piste_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `cd_album` (`album_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
