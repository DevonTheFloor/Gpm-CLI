-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 10 juin 2020 à 20:03
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
  `titre` varchar(100) DEFAULT NULL,
  `auteur` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `urlimg` varchar(255) DEFAULT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum`
--

INSERT INTO `forum` (`_id`, `titre`, `auteur`, `message`, `urlimg`, `quand`) VALUES
(14, 'oupss', 'admin1', 'test de modification \'plus un autre test de modif\'', 'http://localhost:4040/api/images/dl/external-1589526604262.jpg', '2020-05-15 09:10:04'),
(16, 'sql sans variable', 'lautre', 'variable declareés avant values', 'http://localhost:4040/api/images/dl/voiture11589527484542.jpg', '2020-05-15 09:24:44'),
(34, 'multi', 'test', 'direct bdd', 'http://localhost:4040/api/images/dl/chouette1591205748933.jpeg', '2020-06-03 19:35:48'),
(35, 'Test admin', 'admin1', 'juste pour l\'image', 'http://localhost:4040/api/images/dl/51yg_dVT_AmFL1591364828687.jpeg', '2020-06-05 15:47:08'),
(44, 'OUPSS', 'test', 'kip kalme', NULL, '2020-06-06 14:23:43'),
(45, 'SPECIALE Modif', 'admin1', '\"est ce que quand je modif les réponse disparaissent? \" Message modéré juste pour asseoir mon autorité!', NULL, '2020-06-06 14:33:32');

-- --------------------------------------------------------

--
-- Structure de la table `market`
--

CREATE TABLE `market` (
  `_id` int(11) NOT NULL,
  `auteur` varchar(155) NOT NULL,
  `titre` varchar(1000) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `annonce` text DEFAULT NULL,
  `urlimg` varchar(255) DEFAULT NULL,
  `quand` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `market`
--

INSERT INTO `market` (`_id`, `auteur`, `titre`, `categorie`, `annonce`, `urlimg`, `quand`) VALUES
(1, 'El punto final', 'Fiat punto grande', 'Auto', 'superbe fiat punto toi même tu vois frèrrrrr', 'https://voiture.kidioui.fr/image/img-auto/fiat-punto.jpg', '2020-05-01 18:08:01'),
(2, 'Jean Jean', 'nouvelle annonce', 'maison', 'là il faut fair preuve d\'imagination pour dev un reseau tout seul', 'https://voiture.kidioui.fr/image/img-auto/fiat-punto.jpg', '2020-05-01 20:15:57'),
(17, 'Jerôme', 'alors', 'Auto', 'apres j\'aiu plus d\'idée', 'http://localhost:4040/api/images/dl/voiture21589480453158.jpg', '2020-05-14 20:20:53'),
(23, 'admin1', 'Petit maison', 'maison', 'Dans la prairie loin de tout', 'http://localhost:4040/api/images/dl/maison21591776043160.jpeg', '2020-06-10 10:00:43'),
(24, 'Louison', 'Chalet ', 'maison', 'POur habiter à l\'année taxe d\'habitation 30€/an. Affaire à saisir!', 'http://localhost:4040/api/images/dl/maison11591776255520.jpeg', '2020-06-10 10:04:15'),
(26, 'test', 'JEUX', 'autre', 'Nombreux jeux de société pour soirée d\'hiver', 'http://localhost:4040/api/images/dl/autre11591776426971.jpeg', '2020-06-10 10:07:06'),
(27, 'Gooko', 'Ordi natan', 'infor', 'Olalala keske chu drôle!!', 'http://localhost:4040/api/images/dl/ordi21591776555082.png', '2020-06-10 10:09:15'),
(28, 'Leonidas', 'Computer', 'infor', 'Mega ram, hypra processor', 'http://localhost:4040/api/images/dl/ordi31591776594810.jpeg', '2020-06-10 10:09:54');

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
(4, 'lautre', 'message avec image', 'http://localhost:4040/api/images/dl/external-1589897767565.jpg', 14, 'forum', '2020-05-19 16:16:07'),
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
(18, 'test', 'Message avec auth sur la route... roulement de tambour', NULL, 15, 'forum', '2020-05-26 07:57:40'),
(19, 'test', 'Y a beacoup trop de reponse dans ce thread, ça ne le merite pas #troll', NULL, 32, 'forum', '2020-06-02 08:36:38'),
(20, 'test', 'testimoniale', NULL, 32, 'forum', '2020-06-02 08:38:56'),
(21, 'Oim-D', 'From req rest', NULL, 14, 'forum', '2020-06-02 14:47:36'),
(22, 'test', 'y a déjà trop de messages!!', NULL, 32, 'forum', '2020-06-02 18:16:45'),
(23, 'test', 'message avec image histoire de voir', NULL, 32, 'forum', '2020-06-02 18:21:09'),
(24, 'test', 'rtyhrfbg dfgbnethjn dfgbn ethjnhn', NULL, 32, 'forum', '2020-06-02 18:22:20'),
(25, 'test', 'hjdtfhg fgbrdghn vb rfghnb dfhn', NULL, 32, 'forum', '2020-06-02 18:35:13'),
(26, 'test', 'et avec la chouette', NULL, 32, 'forum', '2020-06-02 18:35:36'),
(27, 'admin1', 'test axios en rep forum avec fd ', NULL, 14, 'forum', '2020-06-05 14:15:27'),
(28, 'admin1', 'test axios en fd avec image sur rep forum', NULL, 14, 'forum', '2020-06-05 14:16:38'),
(29, 'admin1', 'avec un argument à formdata sans image en premier', NULL, 14, 'forum', '2020-06-05 14:30:46'),
(30, 'admin1', 're test sans imga', NULL, 34, 'forum', '2020-06-05 15:44:30'),
(31, 'admin1', 'est ce que tu trouve à redire?', 'http://localhost:4040/api/images/dl/gomme1591365052224.jpeg', 35, 'forum', '2020-06-05 15:50:52'),
(32, 'admin1', 'allez on va plus se priver maintenant.', 'http://localhost:4040/api/images/dl/homer1591367888083.jpeg', 35, 'forum', '2020-06-05 16:38:08'),
(33, 'admin1', 'On va peut re s\'arrêter?', NULL, 35, 'forum', '2020-06-05 16:40:43'),
(34, 'test', '', NULL, 34, 'forum', '2020-06-06 11:22:06'),
(35, 'test', '', NULL, 45, 'forum', '2020-06-06 14:38:58'),
(36, 'test', 'tentatuive de réponse pour voir', NULL, 45, 'forum', '2020-06-06 14:39:34'),
(37, 'admin1', 'message token', NULL, 14, 'forum', '2020-06-08 17:12:29');

-- --------------------------------------------------------

--
-- Structure de la table `rezo`
--

CREATE TABLE `rezo` (
  `_id` int(11) NOT NULL,
  `auteur` varchar(80) DEFAULT NULL,
  `message` text DEFAULT NULL,
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
(13, 'hello', 'where are you', '2020-05-13 14:06:00'),
(15, 'admin1', 'req.body.message', '2020-06-08 10:25:50'),
(25, NULL, NULL, '2020-06-09 16:29:00'),
(26, NULL, NULL, '2020-06-09 16:30:05'),
(27, NULL, NULL, '2020-06-09 16:36:17'),
(28, NULL, NULL, '2020-06-09 16:41:28'),
(29, NULL, NULL, '2020-06-09 16:42:15'),
(30, NULL, NULL, '2020-06-09 16:43:28'),
(31, 'the haakerz', 'vilain message from zi hakerzs', '2020-06-09 19:41:14'),
(32, NULL, NULL, '2020-06-09 19:50:10'),
(33, 'another', 'va savoir Charles', '2020-06-09 19:51:14'),
(34, NULL, NULL, '2020-06-09 19:59:46'),
(35, NULL, NULL, '2020-06-09 20:01:05'),
(36, NULL, NULL, '2020-06-09 20:04:13'),
(37, NULL, NULL, '2020-06-09 20:06:10'),
(38, NULL, 'coiuc nous vouilou', '2020-06-09 20:16:05'),
(39, 'Axux Malus', 'en direct du code dans axios', '2020-06-10 06:54:50'),
(40, 'Le bricoleur', 'toujours en direct du code dans axios', '2020-06-10 07:00:55'),
(41, 'Le bricoleur', 'Kesk kon est bien dans le code!!!', '2020-06-10 07:04:07'),
(42, NULL, NULL, '2020-06-10 07:07:43'),
(43, NULL, NULL, '2020-06-10 07:25:49'),
(44, 'admin1', '', '2020-06-10 07:28:56'),
(45, 'admin1', 'Ce coup  ci normalement c\'est le bon.', '2020-06-10 07:30:05'),
(46, 'admin1', 'Pouquoi fd m\'a planté?\n', '2020-06-10 07:33:10'),
(47, 'admin1', 'crotte de bique !!!!', '2020-06-10 12:35:50');

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
  `isadm` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`_id`, `email`, `mdp`, `isadm`) VALUES
(38, 'test7', '$2b$10$VYuthabRV7iNcJ/.98o6Z.Cwvq5EZUzmX0nTNvSlUDhiAnLm9BJ5.', 'false'),
(39, 'test7', '$2b$10$b/RGqBLkMgk0QHp2n94mNuWKIvCcoZyzA9J3H1X5PF6Q5OtjaKOZO', 'false'),
(45, 'test2', '$2b$10$lDNshhXPWDF714qfcUgTnOFN14stRHvXxUvxn6SZDz45DEFJZg8ey', 'false'),
(46, 'test', '$2b$10$M5UvqCku.3mqeu3rxsqY.ONFzt21HVXgKaMT5d84g3Bql/1bPjmYe', 'false'),
(47, 'test', '$2b$10$ZEcl976Gjd5WZHCmux2YFuwsubU52InrNgfueQ35ZyXuXzbTcU/AS', 'false'),
(49, 'test', '$2b$10$8Nek0qSWLbCLoYv6fOM1M.ikcFKjvb/VHVs/hHkag5LGvdkF9K9U2', 'false'),
(60, 'alors', '$2b$10$MzHibh2R8xk2x0msEP6kNuRCU4G8HL6xDg83/l5fNVYwag8n1xkfK', 'false'),
(61, 'admin1', '$2b$10$xzjAnnUq/ALuAQrv3OOGQegadFeNR3t70iZryC5wYzfQHMuZtHzSu', 'true'),
(67, 'validate', '$2b$10$oYf9U2mR6Lm2OgstMW037eYE855oO6AEsATKGLzO7WrY2Jq4MFBIO', '0'),
(68, 'relidate', '$2b$10$ijdvJHpH4ndMvcnMvuIdc.OwF30AfoWc6ry1tlphOmg1uSdXGnQPy', '0');

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
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `market`
--
ALTER TABLE `market`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `rezo`
--
ALTER TABLE `rezo`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
