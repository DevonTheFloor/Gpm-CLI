-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 30 mai 2020 à 07:29
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gm`
--

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

CREATE TABLE `forum` (
  `_id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `auteur` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `urlimg` varchar(255) DEFAULT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum`
--

INSERT INTO `forum` (`_id`, `titre`, `auteur`, `message`, `urlimg`, `quand`) VALUES
(14, 'test', 'lautre', 'i lived for test', '/api/images/dl/external-1589526604262.jpg', '2020-05-15 09:10:04'),
(15, 'modif sql', 'lautre', 'modif de la requete sans le null (j\'ai remis)  et sans les default values', '/api/images/dl/ordi21589527050016.jpg', '2020-05-15 09:17:30'),
(16, 'sql sans variable', 'lautre', 'variable declareés avant values', '/api/images/dl/voiture11589527484542.jpg', '2020-05-15 09:24:44'),
(27, 'image', 'lautre', 'tout naturelement', '/api/images/dl/guepe1590263399398.jpg', '2020-05-23 21:49:59'),
(28, 'Nouvelle', 'lautre', 'techno prevent default', NULL, '2020-05-26 23:15:49'),
(29, 'retrurn', 'lautre', 'of the message', NULL, '2020-05-26 23:17:39'),
(30, 'location ', 'lautre', 'reload', NULL, '2020-05-26 23:19:32'),
(31, 'Auth route', 'lautre', 'sans transition', NULL, '2020-05-27 10:32:17');

-- --------------------------------------------------------

--
-- Structure de la table `market`
--

CREATE TABLE `market` (
  `_id` int(11) NOT NULL,
  `titre` varchar(1000) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `annonce` text DEFAULT NULL,
  `urlimg` varchar(255) DEFAULT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `market`
--

INSERT INTO `market` (`_id`, `titre`, `categorie`, `annonce`, `urlimg`, `quand`) VALUES
(1, 'Fiat punto grande', 'Auto', 'superbe fiat punto toi même tu vois frèrrrrr', 'https://voiture.kidioui.fr/image/img-auto/fiat-punto.jpg', '2020-05-01 18:08:01'),
(2, 'maison', 'nouvelle annonce', 'là il faut fair preuve d\'imagination pour dev un reseau tout seul', 'https://voiture.kidioui.fr/image/img-auto/fiat-punto.jpg', '2020-05-01 20:15:57'),
(16, 'encore', 'Auto', 'rateé? va savoir', '/images/dl/voiture11589472074548.jpg', '2020-05-14 18:01:14'),
(17, 'alors', 'Auto', 'apres j\'aiu plus d\'idée', '/api/images/dl/voiture21589480453158.jpg', '2020-05-14 20:20:53');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `_id` int(11) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `urlimg` varchar(255) DEFAULT NULL,
  `id_question` int(255) DEFAULT NULL,
  `salon` varchar(255) DEFAULT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`_id`, `auteur`, `message`, `urlimg`, `id_question`, `salon`, `quand`) VALUES
(1, 'encore lui', 'message direct dbs in my admin', NULL, 14, 'forum', '2020-05-19 07:59:29'),
(4, 'lautre', 'message avec image', '/api/images/dl/external-1589897767565.jpg', 14, 'forum', '2020-05-19 16:16:07'),
(5, 'test', 'depuis request.rest', NULL, 14, 'forum', '2020-05-25 16:45:08'),
(6, 'testER', 'depuis request.rest two time', NULL, 14, 'forum', '2020-05-25 18:19:17'),
(7, 'test', 'oueop', NULL, 14, 'forum', '2020-05-25 18:41:16'),
(8, 'test', 'oueop', NULL, 14, 'forum', '2020-05-25 18:43:16'),
(9, 'test', 'avec multer', NULL, 14, 'forum', '2020-05-25 18:46:52'),
(10, 'test', 'current date time sans', NULL, 14, 'forum', '2020-05-25 18:47:54'),
(11, 'test', 'redirect back', NULL, 14, 'forum', '2020-05-25 18:50:04'),
(12, 'test', 'redirect id question', NULL, 14, 'forum', '2020-05-25 18:52:01'),
(13, 'test', 'history back', NULL, 14, 'forum', '2020-05-25 18:55:49'),
(14, 'test', 'Joli ordi, t\'s sur que c\'est la bonne image?', NULL, 15, 'forum', '2020-05-25 20:26:32'),
(15, 'test', 'Je vais peut être me creer un autre compte pour faire genre y a du monde?...', NULL, 15, 'forum', '2020-05-25 20:30:27'),
(16, 'test', 'Riger oublie pas de me rendre les clefs!', NULL, 16, 'forum', '2020-05-25 20:31:10'),
(17, 'test', 'Ouille, ouiille, ouille !', NULL, 27, 'forum', '2020-05-25 20:32:25'),
(18, 'test', 'Message avec auth sur la route... roulement de tambour', NULL, 15, 'forum', '2020-05-26 07:57:40');

-- --------------------------------------------------------

--
-- Structure de la table `rezo`
--

CREATE TABLE `rezo` (
  `_id` int(11) NOT NULL,
  `auteur` varchar(80) NOT NULL,
  `message` text NOT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rezo`
--

INSERT INTO `rezo` (`_id`, `auteur`, `message`, `quand`) VALUES
(1, 'oim ', 'Oui Jérôme c\'est moi, non je n\'ai pas changé.', '2020-05-02 07:13:04'),
(2, 'Encore', 'T\'es chanteur toi maintenant?', '2020-05-02 07:14:40'),
(3, 'Lautre', 'Chanteur de chaaaaaarmeuhhhhhh!', '2020-05-02 07:34:18'),
(4, 'adakor', 'Je suis producteur, je cherche un guignole, heu! Un artiste', '2020-05-02 08:27:18'),
(5, 'cava', 'Partir en live, pas bonne idée ce chat!!', '2020-05-02 09:18:19'),
(6, 'oim', 'pourquoi tu es parti sans moi, yes to do?!\r\n', '2020-05-03 19:05:34'),
(7, 'reoim', 'message en live', '2020-05-04 10:31:45'),
(8, 'juste', 'un bridou?', '2020-05-11 07:35:23'),
(9, 'Inpecteur', 'Sais tu danser la carioca!?', '2020-05-11 07:43:52'),
(10, 'iuyt', 'message', '2020-05-11 10:16:12'),
(11, 'jerome', 'ici ça merde aussi?', '2020-05-13 06:42:39'),
(12, 'coucou', 'a toi', '2020-05-13 10:33:00'),
(13, 'hello', 'where are you', '2020-05-13 14:06:00');

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `hgf` varchar(54) NOT NULL,
  `hgdf` varchar(54) NOT NULL,
  `hgd` varchar(54) NOT NULL,
  `hgfd` varchar(54) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `isadm` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`_id`, `email`, `mdp`, `isadm`) VALUES
(1, 'test@test.fr', 'mots_secret', 0),
(2, 'retest@retest.fr', 'mots_secret2', NULL),
(3, 'retest@retest.fr', 'mots_secret3', NULL),
(33, 'test5', '$2b$10$lXdDWgi54Q./tl/qSZNOaOOG1AQ4OKj3jg2aHXntoNFP20YbLRxYS', NULL),
(38, 'test7', '$2b$10$VYuthabRV7iNcJ/.98o6Z.Cwvq5EZUzmX0nTNvSlUDhiAnLm9BJ5.', NULL),
(39, 'test7', '$2b$10$b/RGqBLkMgk0QHp2n94mNuWKIvCcoZyzA9J3H1X5PF6Q5OtjaKOZO', NULL),
(44, 'test', '$2b$10$Ztvv/b9EO043uoHoeaAGBOmpDjo0YJHwFh0Q/lOxcRGGHvW/enWv2', NULL),
(45, 'test2', '$2b$10$lDNshhXPWDF714qfcUgTnOFN14stRHvXxUvxn6SZDz45DEFJZg8ey', NULL),
(46, 'test', '$2b$10$M5UvqCku.3mqeu3rxsqY.ONFzt21HVXgKaMT5d84g3Bql/1bPjmYe', NULL),
(47, 'test', '$2b$10$ZEcl976Gjd5WZHCmux2YFuwsubU52InrNgfueQ35ZyXuXzbTcU/AS', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`_id`);

--
-- Index pour la table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`_id`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`_id`);

--
-- Index pour la table `rezo`
--
ALTER TABLE `rezo`
  ADD PRIMARY KEY (`_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `market`
--
ALTER TABLE `market`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `rezo`
--
ALTER TABLE `rezo`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
