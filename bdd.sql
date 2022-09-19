-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 02 juin 2022 à 12:14
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `Book`
--

CREATE TABLE `Book` (
  `idBook` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `idDiscipline` int(11) DEFAULT NULL,
  `idDomaine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Book`
--

INSERT INTO `Book` (`idBook`, `title`, `author`, `version`, `ISBN`, `description`, `etat`, `idDiscipline`, `idDomaine`) VALUES
(1, 'index/progit.pdf', 'Scott Chacon & Ben Straub', 'Seconde version', 3003, 'Tout ce que vous devez savoir sur GIT', NULL, 1, NULL),
(2, 'index/sql.pdf', 'Philippe Rigaux', '2017-2019 V1.0', 34, 'Cours de bases de données', NULL, 2, NULL),
(3, 'index/react-fr.pdf', 'Stack Overflow', 'None', 5, 'Cours de reactjs', NULL, 3, NULL),
(4, 'index/LES DIODES.pdf', 'DJOGBE', 'Edition 1', 5, 'Tout sur les diodes', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Discipline`
--

CREATE TABLE `Discipline` (
  `idDiscipline` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Discipline`
--

INSERT INTO `Discipline` (`idDiscipline`, `nom`) VALUES
(1, 'EDL'),
(2, 'SGBD'),
(3, 'Programmation Web'),
(4, 'Fonction Electronique');

-- --------------------------------------------------------

--
-- Structure de la table `Domaine`
--

CREATE TABLE `Domaine` (
  `idDomaine` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Emprunt`
--

CREATE TABLE `Emprunt` (
  `idEmprunt` int(11) NOT NULL,
  `expirationDate` date NOT NULL,
  `User_matricule` int(11) NOT NULL,
  `Book_idBook` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Filiere`
--

CREATE TABLE `Filiere` (
  `idFiliere` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Filiere`
--

INSERT INTO `Filiere` (`idFiliere`, `nom`) VALUES
(1, 'GIT-3'),
(2, 'GE-3');

-- --------------------------------------------------------

--
-- Structure de la table `FiliereBook`
--

CREATE TABLE `FiliereBook` (
  `idFiliereBook` int(11) NOT NULL,
  `idFiliere` int(11) NOT NULL,
  `idBook` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `FiliereBook`
--

INSERT INTO `FiliereBook` (`idFiliereBook`, `idFiliere`, `idBook`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `matricule` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `inscrit` tinyint(1) NOT NULL DEFAULT 0,
  `idFiliere` int(11) DEFAULT NULL,
  `idUserType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`matricule`, `firstname`, `lastname`, `email`, `password`, `inscrit`, `idFiliere`, `idUserType`) VALUES
(13539020, 'Roméo', 'KAKPO', 'romeokakpo3gmail.com', 'OQM7fAJ3', 0, 1, 1),
(13613120, 'Franck', 'AVODAGBA', 'franckavodagba1er@gmail.com', 'gRCKUaNO', 0, 1, 1),
(13613420, 'Kader', 'CHITOU', 'kaderchitou98@gmail.com', 'LcN@2%sR', 0, 1, 1),
(13614520, 'Ananias', 'GBADESSI', 'ananiasgbadessi00@gmail.com', 'YXsjc%ro', 0, 1, 1),
(13615120, 'Hospice', 'HOUNFODJI', 'hospicehounfodji@gmail.com', 'M9RpSjDs', 0, 1, 1),
(13615720, 'Marcolin', 'MONTCHO', 'marcolinmontcho@gmail.com', 'w$aB(j8K', 0, 1, 1),
(13615820, 'Uriel', 'ONI', 'oniuriel@gmail.com', 'ybFGQ5pB', 0, 1, 1),
(13616820, 'Ramziath', 'ADAM CHABI', 'ramziathnonsouadamchabi@gmail.com', 'QAylOGkg', 0, 1, 1),
(13617020, 'Peggy', 'ADJAGAN', 'pegdjune19@gmail.com', 'j78W5Ay*', 0, 1, 1),
(13617120, 'Calvin', 'ADOHO', 'adohocalvin@gmail.com', 'N95PWEXh', 0, 1, 1),
(13617720, 'Dounicia', 'AGLIKPO', 'laurenceaglikpo@gmail.com', 'lpQ*W!CQ', 0, 1, 1),
(13617820, 'Jannos', 'AHANNINKPO', 'ahanninkpojannos@gmail.com', 'AT5ntSkI', 0, 1, 1),
(13617920, 'Karsten', 'AHOUANGAN', 'karstenahouangan@gmail.com', 'Csm&%T&G', 0, 1, 1),
(13618320, 'Merveille', 'AIZANNON', 'merveilleaizannon@gmail.com', 'DsYLNKQW', 0, 1, 1),
(13618720, 'Osée', 'ALODEHOU', 'zaosee58@gmail.com', 'ANVfPvjf', 0, 1, 1),
(13619620, 'Sedjro', 'BONOU', 'habibhbn3@gmail.com', 'AMOxL7XR', 0, 1, 1),
(13620120, 'Hermann', 'd\'ALMEIDA', 'adreanodalmeida@gmail.com', '5VvQhgpB', 0, 1, 1),
(13621720, 'Ulrich', 'GOHOUE', 'ulrichgohoue@gmail.com', 'z!p9MSuU', 0, 1, 1),
(13621920, 'Marie-Josué', 'HOUESSOU', 'josuehouessou57@gmail.com', 'aTiB*6rO', 0, 1, 1),
(13622820, 'Rayane', 'KADRI', 'rayanekadri57@gmail.com', 'HbyDwd6t', 0, 1, 1),
(13623020, 'Esther', 'KIKI', 'esthermfkiki@gmail.com', '%CDj)*Sg', 0, 1, 1),
(13623620, 'Andilath', 'MALADE', 'andilathmalade0@gmail.com', '9V%0PPoK', 0, 1, 1),
(13624420, 'Orphée', 'SOGBOHOSSOU', 'ikuolsogbohossou@gmail.com', 'A!NG(&6S', 0, 1, 1),
(13624620, 'Aristide', 'SOTOHOU', 'sotohoueuloge@gmail.com', 'iZUd5T91', 0, 1, 1),
(13625320, 'Ovilga', 'WOTTO', 'ovilgawoto@gmail.com', 'te!swkiA', 0, 1, 1),
(13625820, 'Karl', 'ZINSOU', 'juvencezinsou@gmail.com', 'ziwQFu87', 0, 1, 1),
(13874220, 'Albéric', 'ADJOVI', 'adjovialberie@gmail.com', 'eoMB!qce', 0, 1, 1),
(30351420, 'Hermine', 'IGABOUY CHOBLI', 'chobliafiwa@gmail.com', '%CDj)*Sg', 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `UserType`
--

CREATE TABLE `UserType` (
  `idUserType` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `UserType`
--

INSERT INTO `UserType` (`idUserType`, `nom`) VALUES
(1, 'Etudiant');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`idBook`),
  ADD KEY `fk_Book_Discipline1_idx` (`idDiscipline`),
  ADD KEY `idDomaine` (`idDomaine`);

--
-- Index pour la table `Discipline`
--
ALTER TABLE `Discipline`
  ADD PRIMARY KEY (`idDiscipline`);

--
-- Index pour la table `Domaine`
--
ALTER TABLE `Domaine`
  ADD PRIMARY KEY (`idDomaine`);

--
-- Index pour la table `Emprunt`
--
ALTER TABLE `Emprunt`
  ADD PRIMARY KEY (`idEmprunt`),
  ADD KEY `fk_Emprunt_User1_idx` (`User_matricule`),
  ADD KEY `fk_Emprunt_Book1_idx` (`Book_idBook`);

--
-- Index pour la table `Filiere`
--
ALTER TABLE `Filiere`
  ADD PRIMARY KEY (`idFiliere`);

--
-- Index pour la table `FiliereBook`
--
ALTER TABLE `FiliereBook`
  ADD PRIMARY KEY (`idFiliereBook`),
  ADD KEY `fk_FiliereBook_Filiere1_idx` (`idFiliere`),
  ADD KEY `fk_FiliereBook_Book1_idx` (`idBook`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`matricule`),
  ADD KEY `fk_User_Filiere_idx` (`idFiliere`),
  ADD KEY `fk_User_UserType1_idx` (`idUserType`);

--
-- Index pour la table `UserType`
--
ALTER TABLE `UserType`
  ADD PRIMARY KEY (`idUserType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Book`
--
ALTER TABLE `Book`
  MODIFY `idBook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Discipline`
--
ALTER TABLE `Discipline`
  MODIFY `idDiscipline` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Domaine`
--
ALTER TABLE `Domaine`
  MODIFY `idDomaine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Emprunt`
--
ALTER TABLE `Emprunt`
  MODIFY `idEmprunt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Filiere`
--
ALTER TABLE `Filiere`
  MODIFY `idFiliere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `FiliereBook`
--
ALTER TABLE `FiliereBook`
  MODIFY `idFiliereBook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `UserType`
--
ALTER TABLE `UserType`
  MODIFY `idUserType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`idDomaine`) REFERENCES `Domaine` (`idDomaine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Book_Discipline1` FOREIGN KEY (`idDiscipline`) REFERENCES `Discipline` (`idDiscipline`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Emprunt`
--
ALTER TABLE `Emprunt`
  ADD CONSTRAINT `fk_Emprunt_Book1` FOREIGN KEY (`Book_idBook`) REFERENCES `Book` (`idBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Emprunt_User1` FOREIGN KEY (`User_matricule`) REFERENCES `User` (`matricule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `FiliereBook`
--
ALTER TABLE `FiliereBook`
  ADD CONSTRAINT `fk_FiliereBook_Book1` FOREIGN KEY (`idBook`) REFERENCES `Book` (`idBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_FiliereBook_Filiere1` FOREIGN KEY (`idFiliere`) REFERENCES `Filiere` (`idFiliere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `fk_User_Filiere` FOREIGN KEY (`idFiliere`) REFERENCES `Filiere` (`idFiliere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_UserType1` FOREIGN KEY (`idUserType`) REFERENCES `UserType` (`idUserType`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
