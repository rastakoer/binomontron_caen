-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 oct. 2022 à 12:17
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomontron`
--

-- --------------------------------------------------------

--
-- Structure de la table `ELEVES`
--

CREATE TABLE `ELEVES` (
  `id_eleves` int NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ELEVES`
--

INSERT INTO `ELEVES` (`id_eleves`, `prenom`, `nom`, `mail`) VALUES
(1, 'Kevin', 'LE GRAND', 'kevin.le-grand@isen-ouest.yncr'),
(2, 'Harold', 'PETIARD', 'harold.petiard@isen-ouest.yncr'),
(3, 'David', 'SCANU', 'david.scanu@isen-ouest.yncrea.'),
(4, 'Antoine', 'ANCELIN', 'antoine.ancelin@isen-ouest.ync'),
(5, 'Johann', 'JOURNAUX', 'johann.journaux@isen-ouest.ync'),
(6, 'Charley', 'LEBARBIER', 'charley.lebarbier@isen-ouest.y'),
(7, 'Amadou', 'DIABY', 'amadou.diaby@isen-ouest.yncrea'),
(8, 'Geoffroy', 'DAUMER', 'geoffroy.daumer@isen-ouest.ync'),
(9, 'Dimitri', 'JULES', 'dimitri.jules@isen-ouest.yncre'),
(10, 'Basile', 'GUERIN', 'basile.guerin@isen-ouest.yncre'),
(11, 'Viacheslav', 'OSWALD', 'viacheslav.oswald@isen-ouest.y'),
(12, 'Soraya', 'DUSSART', 'ramata-soraya.dussart@isen-oue'),
(13, 'Guinel', 'ZOUITEN', 'guinel.zouiten@isen-ouest.yncr');

-- --------------------------------------------------------

--
-- Structure de la table `ELEVES_GROUPES`
--

CREATE TABLE `ELEVES_GROUPES` (
  `id_eleve_groupe` int NOT NULL,
  `id_eleve` int NOT NULL,
  `id_groupe` int NOT NULL,
  `id_projet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ELEVES_GROUPES`
--

INSERT INTO `ELEVES_GROUPES` (`id_eleve_groupe`, `id_eleve`, `id_groupe`, `id_projet`) VALUES
(4, 6, 1, 61),
(5, 13, 1, 61),
(6, 10, 1, 61),
(7, 2, 1, 61),
(8, 7, 2, 61),
(9, 11, 2, 61),
(10, 12, 2, 61),
(11, 4, 3, 61),
(12, 1, 3, 61),
(13, 9, 3, 61),
(14, 8, 4, 61),
(15, 3, 4, 61),
(16, 5, 4, 61),
(17, 12, 1, 62),
(18, 3, 1, 62),
(19, 1, 1, 62),
(20, 2, 1, 62),
(21, 10, 1, 62),
(22, 13, 2, 62),
(23, 5, 2, 62),
(24, 11, 2, 62),
(25, 7, 2, 62),
(26, 6, 3, 62),
(27, 4, 3, 62),
(28, 8, 3, 62),
(29, 9, 3, 62),
(30, 9, 1, 63),
(31, 7, 1, 63),
(32, 6, 1, 63),
(33, 2, 1, 63),
(34, 5, 2, 63),
(35, 11, 2, 63),
(36, 8, 2, 63),
(37, 12, 3, 63),
(38, 1, 3, 63),
(39, 10, 3, 63),
(40, 4, 4, 63),
(41, 13, 4, 63),
(42, 3, 4, 63);

-- --------------------------------------------------------

--
-- Structure de la table `GROUPES`
--

CREATE TABLE `GROUPES` (
  `id_groupe` int NOT NULL,
  `denomination` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `GROUPES`
--

INSERT INTO `GROUPES` (`id_groupe`, `denomination`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3'),
(4, 'Groupe 4'),
(5, 'Groupe 5'),
(6, 'Groupe 6'),
(7, 'Groupe 7'),
(8, 'Groupe 8'),
(9, 'Groupe 9'),
(10, 'Groupe 10');

-- --------------------------------------------------------

--
-- Structure de la table `PROJETS`
--

CREATE TABLE `PROJETS` (
  `id_projet` int NOT NULL,
  `projet` varchar(20) NOT NULL,
  `date_debut` varchar(20) NOT NULL,
  `date_fin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PROJETS`
--

INSERT INTO `PROJETS` (`id_projet`, `projet`, `date_debut`, `date_fin`) VALUES
(61, 'HHHH', '2022-10-27', '2022-10-30'),
(62, 'essai n_???', '2022-10-28', '2022-11-11'),
(63, 'dernier_essai', '2022-10-28', '2022-11-07');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ELEVES`
--
ALTER TABLE `ELEVES`
  ADD PRIMARY KEY (`id_eleves`);

--
-- Index pour la table `ELEVES_GROUPES`
--
ALTER TABLE `ELEVES_GROUPES`
  ADD PRIMARY KEY (`id_eleve_groupe`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_groupe` (`id_groupe`),
  ADD KEY `id_date` (`id_projet`);

--
-- Index pour la table `GROUPES`
--
ALTER TABLE `GROUPES`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `PROJETS`
--
ALTER TABLE `PROJETS`
  ADD PRIMARY KEY (`id_projet`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ELEVES`
--
ALTER TABLE `ELEVES`
  MODIFY `id_eleves` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `ELEVES_GROUPES`
--
ALTER TABLE `ELEVES_GROUPES`
  MODIFY `id_eleve_groupe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `GROUPES`
--
ALTER TABLE `GROUPES`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `PROJETS`
--
ALTER TABLE `PROJETS`
  MODIFY `id_projet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ELEVES_GROUPES`
--
ALTER TABLE `ELEVES_GROUPES`
  ADD CONSTRAINT `ELEVES_GROUPES_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `ELEVES` (`id_eleves`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ELEVES_GROUPES_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `GROUPES` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ELEVES_GROUPES_ibfk_3` FOREIGN KEY (`id_projet`) REFERENCES `PROJETS` (`id_projet`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
