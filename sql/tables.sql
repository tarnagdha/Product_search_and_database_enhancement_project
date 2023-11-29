-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 nov. 2023 à 21:53
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `traitement`
--

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `title`, `stock`, `description`, `created_at`, `id_category`, `price`) VALUES
(1, 'Pain', 119, 'Pain frais quotidien, croustillant Ã  l\'extÃ©rieur et moelleux Ã  l\'intÃ©rieur, parfait pour accompagner vos repas.', '2023-11-22 02:20:16', 1, 254877),
(2, 'Lait', 64, 'Lait frais de qualitÃ©, riche en calcium et en vitamines essentielles pour une alimentation Ã©quilibrÃ©e.', '2023-11-16 02:20:16', 1, 85099.3),
(3, 'Å’ufs', 67, 'Å’ufs fermiers biologiques, source de protÃ©ines et d\'Ã©lÃ©ments nutritifs essentiels pour une cuisine saine.', '2023-11-27 02:20:16', 1, 432137),
(4, 'Fromage', 10, 'Fromage affinÃ©, aux saveurs riches et variÃ©es, parfait pour les plateaux de fromages ou les sandwiches.', '2023-11-13 02:20:16', 1, 19581.1),
(5, 'Yaourt', 108, 'Yaourt onctueux et crÃ©meux, une collation saine et dÃ©licieuse, disponible en diffÃ©rentes saveurs.', '2023-11-03 02:20:16', 1, 450347),
(6, 'Fruits', 48, 'SÃ©lection de fruits frais de saison, naturellement sucrÃ©s et riches en vitamines.', '2023-11-13 02:20:16', 1, 151447),
(7, 'LÃ©gumes', 166, 'LÃ©gumes frais et croquants, parfaits pour prÃ©parer des plats savoureux et nutritifs.', '2023-11-09 02:20:16', 1, 10913.6),
(8, 'Viande de bÅ“uf', 114, 'Viande de bÅ“uf de qualitÃ© supÃ©rieure, tendre et juteuse, idÃ©ale pour griller ou mijoter.', '2023-11-09 02:20:16', 1, 241430),
(9, 'Poulet', 59, 'Filets de poulet frais, maigres et polyvalents, parfaits pour une variÃ©tÃ© de recettes savoureuses.', '2023-11-16 02:20:16', 1, 150671),
(10, 'Poisson', 25, 'Poisson frais de la mer, riche en acides gras omÃ©ga-3, excellent pour la santÃ© cardiaque.', '2023-11-20 02:20:16', 1, 449439),
(11, 'Riz', 7, 'Riz de qualitÃ© supÃ©rieure, idÃ©al comme accompagnement pour de nombreux plats du monde entier.', '2023-11-14 02:20:16', 1, 100200),
(12, 'PÃ¢tes', 74, 'PÃ¢tes italiennes de premiÃ¨re qualitÃ©, parfaites avec une variÃ©tÃ© de sauces et d\'accompagnements.', '2023-11-04 02:20:16', 1, 74226.9),
(13, 'CÃ©rÃ©ales', 2, 'CÃ©rÃ©ales complÃ¨tes et nutritives, un excellent choix pour un petit-dÃ©jeuner sain et Ã©nergÃ©tique.', '2023-11-22 02:20:16', 1, 139083),
(14, 'Soupes en conserve', 8, 'Soupes dÃ©licieuses en conserve, une option rapide et rÃ©confortante pour les jours chargÃ©s.', '2023-10-31 02:20:16', 1, 167246),
(15, 'Pizzas surgelÃ©es', 80, 'Pizzas surgelÃ©es de qualitÃ©, garnies d\'ingrÃ©dients frais, prÃªtes en quelques minutes.', '2023-11-06 02:20:16', 1, 146610),
(16, 'Jus de fruits', 91, 'Jus de fruits naturels, rafraÃ®chissants et pleins de vitamines essentielles.', '2023-11-13 02:20:16', 1, 345276),
(17, 'Eau en bouteille', 34, 'Eau minÃ©rale pure en bouteille, une option saine pour rester hydratÃ© tout au long de la journÃ©e.', '2023-10-30 02:20:16', 1, 248386),
(18, 'CafÃ©', 160, 'CafÃ© moulu de premiÃ¨re qualitÃ©, riche en arÃ´mes, parfait pour commencer votre journÃ©e.', '2023-11-27 02:20:16', 1, 453783),
(19, 'ThÃ©', 78, 'ThÃ© de haute qualitÃ©, aromatique et apaisant, disponible dans une variÃ©tÃ© de saveurs.', '2023-11-14 02:20:16', 1, 250484),
(20, 'Huile d\'olive', 161, 'Huile d\'olive extra vierge, parfaite pour assaisonner les salades et cuisiner des plats dÃ©licieux.', '2023-11-17 02:20:16', 1, 40437.2),
(21, 'Vinaigre balsamique', 65, 'Vinaigre balsamique vieilli, ajoutant une touche de saveur sucrÃ©e et acidulÃ©e Ã  vos plats.', '2023-11-13 02:20:16', 1, 492878),
(22, 'Sel', 69, 'Sel de mer fin, idÃ©al pour assaisonner vos plats et rehausser les saveurs naturelles des aliments.', '2023-11-26 02:20:16', 1, 100241),
(23, 'Poivre', 90, 'Poivre noir fraÃ®chement moulu, ajoutant une chaleur subtile et des arÃ´mes aux plats cuisinÃ©s.', '2023-11-14 02:20:16', 1, 323908),
(24, 'Sucre', 120, 'Sucre cristallisÃ© de qualitÃ©, idÃ©al pour sucrer vos boissons chaudes et prÃ©parer des desserts dÃ©licieux.', '2023-11-14 02:20:16', 1, 273412),
(25, 'Chocolat', 122, 'Chocolat noir de qualitÃ©, riche en cacao, parfait pour les amateurs de chocolat.', '2023-11-24 02:20:16', 1, 224654),
(26, 'Biscuits', 118, 'Assortiment de biscuits croquants, idÃ©al pour accompagner une pause cafÃ© ou un goÃ»ter rapide.', '2023-11-07 02:20:16', 1, 334862),
(27, 'Chips', 94, 'Chips croustillantes de pommes de terre, parfaites pour une collation savoureuse.', '2023-11-17 02:20:16', 1, 184864),
(28, 'Sauce tomate', 110, 'Sauce tomate savoureuse, parfaite pour prÃ©parer des pÃ¢tes, des pizzas et d\'autres plats dÃ©licieux.', '2023-11-21 02:20:16', 1, 407107),
(29, 'Confiture', 52, 'Confiture artisanale, prÃ©parÃ©e avec des fruits frais, idÃ©ale pour tartiner sur du pain ou des biscottes.', '2023-11-09 02:20:16', 1, 255248),
(30, 'Smartphone', 153, 'Un smartphone dernier cri avec un Ã©cran haute rÃ©solution, un appareil photo avancÃ© et des fonctionnalitÃ©s intelligentes pour rester connectÃ©.', '2023-11-03 02:20:16', 2, 86209.1),
(31, 'Ordinateur portable', 108, 'Un ordinateur portable puissant et portable, parfait pour le travail et les loisirs, avec un processeur rapide et un design Ã©lÃ©gant.', '2023-11-13 02:20:16', 2, 428212),
(32, 'Tablette', 37, 'Une tablette tactile lÃ©gÃ¨re et polyvalente, idÃ©ale pour la navigation, le streaming et la productivitÃ© en dÃ©placement.', '2023-11-01 02:20:16', 2, 31362),
(33, 'TÃ©lÃ©viseur', 92, 'Un tÃ©lÃ©viseur intelligent avec une qualitÃ© d\'image exceptionnelle, des fonctionnalitÃ©s de streaming et une connectivitÃ© avancÃ©e pour une expÃ©rience cinÃ©matographique Ã  la maison.', '2023-11-08 02:20:16', 2, 50525.1),
(34, 'Casque audio', 150, 'Un casque audio haut de gamme offrant une qualitÃ© sonore exceptionnelle, un confort optimal et une annulation de bruit pour une immersion totale.', '2023-11-15 02:20:16', 2, 448587),
(35, 'Enceinte Bluetooth', 8, 'Une enceinte portable Bluetooth puissante, offrant un son cristallin et une autonomie longue durÃ©e pour animer toutes vos fÃªtes.', '2023-11-26 02:20:16', 2, 116759),
(36, 'Appareil photo numÃ©rique', 81, 'Un appareil photo numÃ©rique avancÃ© avec des fonctionnalitÃ©s professionnelles, idÃ©al pour capturer des moments inoubliables avec une qualitÃ© exceptionnelle.', '2023-11-04 02:20:16', 2, 494791),
(37, 'Montre connectÃ©e', 170, 'Une montre connectÃ©e Ã©lÃ©gante avec des fonctionnalitÃ©s intelligentes, y compris le suivi d\'activitÃ©, les notifications et la compatibilitÃ© avec les applications populaires.', '2023-11-13 02:20:16', 2, 164789),
(38, 'Imprimante', 165, 'Une imprimante multifonction rapide et fiable, idÃ©ale pour l\'impression de documents de haute qualitÃ© Ã  domicile ou au bureau.', '2023-11-06 02:20:16', 2, 465007),
(39, 'Routeur Wi-Fi', 192, 'Un routeur Wi-Fi haute performance offrant une connectivitÃ© rapide et stable pour tous vos appareils, garantissant une expÃ©rience Internet sans faille.', '2023-11-06 02:20:16', 2, 397383),
(40, 'Souris sans fil', 73, 'Une souris sans fil ergonomique avec une prÃ©cision exceptionnelle, parfaite pour une utilisation quotidienne avec votre ordinateur portable ou de bureau.', '2023-11-05 02:20:16', 2, 66669.5),
(41, 'Clavier Bluetooth', 134, 'Un clavier sans fil Bluetooth Ã©lÃ©gant et rÃ©actif, idÃ©al pour une saisie confortable sur divers appareils.', '2023-11-05 02:20:16', 2, 495205),
(42, 'Ã‰couteurs sans fil', 114, 'Des Ã©couteurs sans fil compacts avec une qualitÃ© audio exceptionnelle, un ajustement confortable et une autonomie prolongÃ©e.', '2023-11-03 02:20:16', 2, 138273),
(43, 'Console de jeux vidÃ©o', 106, 'Une console de jeux vidÃ©o de derniÃ¨re gÃ©nÃ©ration offrant des graphismes Ã©poustouflants, une expÃ©rience de jeu immersive et une vaste bibliothÃ¨que de jeux.', '2023-11-15 02:20:16', 2, 297710),
(44, 'CamÃ©ra de sÃ©curitÃ©', 18, 'Une camÃ©ra de sÃ©curitÃ© intelligente avec une rÃ©solution haute dÃ©finition et des fonctionnalitÃ©s de surveillance avancÃ©es pour assurer la sÃ©curitÃ© de votre domicile.', '2023-11-26 02:20:16', 2, 388478),
(45, 'Disque dur externe', 152, 'Un disque dur externe spacieux pour le stockage sÃ©curisÃ© de vos donnÃ©es, offrant une grande capacitÃ© et une vitesse de transfert rapide.', '2023-10-30 02:20:16', 2, 433434),
(46, 'Chargeur sans fil', 140, 'Un chargeur sans fil Ã©lÃ©gant compatible avec une variÃ©tÃ© d\'appareils, offrant une charge rapide et pratique.', '2023-11-21 02:20:16', 2, 123135),
(47, 'Lampe LED intelligente', 103, 'Une lampe LED intelligente avec des options de couleur ajustables, contrÃ´lable via une application pour crÃ©er l\'ambiance parfaite dans n\'importe quelle piÃ¨ce.', '2023-11-08 02:20:16', 2, 108982),
(48, 'Aspirateur robot', 53, 'Un aspirateur robot intelligent qui nettoie automatiquement votre maison avec des capteurs avancÃ©s et une planification programmable.', '2023-10-30 02:20:16', 2, 413625),
(49, 'ThermomÃ¨tre connectÃ©', 95, 'Un thermomÃ¨tre connectÃ© qui permet de surveiller la tempÃ©rature Ã  distance via une application, idÃ©al pour la cuisine et la santÃ©.', '2023-11-19 02:20:16', 2, 19155.7),
(50, 'Balance intelligente', 73, 'Une balance intelligente qui mesure non seulement le poids, mais aussi d\'autres mÃ©triques corporelles importantes, synchronisÃ©e avec une application pour le suivi de la santÃ©.', '2023-11-07 02:20:16', 2, 308908),
(51, 'RÃ©veil intelligent', 127, 'Un rÃ©veil intelligent avec des fonctionnalitÃ©s de contrÃ´le vocal, de la musique intÃ©grÃ©e et des informations mÃ©tÃ©orologiques pour commencer votre journÃ©e du bon pied.', '2023-11-10 02:20:16', 2, 352264),
(52, 'CÃ¢ble USB-C', 72, 'Un cÃ¢ble USB-C robuste et rapide, idÃ©al pour charger vos appareils et transfÃ©rer des donnÃ©es Ã  des vitesses Ã©levÃ©es.', '2023-11-18 02:20:16', 2, 168385),
(53, 'Adaptateur secteur', 116, 'Un adaptateur secteur compact et puissant pour charger rapidement tous vos appareils Ã©lectroniques.', '2023-11-18 02:20:16', 2, 113488),
(54, 'Ã‰tui de protection pour smartphone', 103, 'Un Ã©tui de protection Ã©lÃ©gant et robuste pour votre smartphone, offrant une protection contre les chocs et les rayures.', '2023-11-10 02:20:16', 2, 205820),
(55, 'Support pour ordinateur portable', 146, 'Un support ergonomique pour ordinateur portable, idÃ©al pour amÃ©liorer la posture et la circulation de l\'air autour de votre appareil.', '2023-11-13 02:20:16', 2, 87947.9),
(56, 'Carte mÃ©moire', 145, 'Une carte mÃ©moire haute capacitÃ© pour Ã©tendre le stockage de vos appareils photo, smartphones et autres dispositifs.', '2023-11-26 02:20:16', 2, 74300.1),
(57, 'Ã‰cran d\'ordinateur', 74, 'Un Ã©cran d\'ordinateur haute rÃ©solution avec des couleurs vives, parfait pour le travail, le jeu et le streaming de contenu.', '2023-11-16 02:20:16', 2, 397953),
(58, 'Batterie externe', 75, 'Une batterie externe portable avec une grande capacitÃ©, idÃ©ale pour charger vos appareils lors de dÃ©placements ou en cas d\'urgence.', '2023-11-08 02:20:16', 2, 246329),
(59, 'T-shirt', 71, 'Un t-shirt basique et confortable, idÃ©al pour un look dÃ©contractÃ© au quotidien.', '2023-10-30 02:20:16', 3, 328910),
(60, 'Chemise', 157, 'Une chemise Ã©lÃ©gante pour des occasions formelles ou pour une tenue chic dÃ©contractÃ©e.', '2023-11-18 02:20:16', 3, 300701),
(61, 'Pull', 167, 'Un pull chaud et doux, parfait pour les journÃ©es fraÃ®ches d\'automne et d\'hiver.', '2023-11-15 02:20:16', 3, 28255.7),
(62, 'Veste en cuir', 11, 'Une veste en cuir tendance, ajoutant une touche de style rebelle Ã  votre garde-robe.', '2023-11-22 02:20:16', 3, 126418),
(63, 'Jean slim', 18, 'Un jean slim ajustÃ© pour un look moderne et Ã©lÃ©gant, parfait avec des baskets ou des bottines.', '2023-11-26 02:20:16', 3, 56014.5),
(64, 'Robe d\'Ã©tÃ©', 196, 'Une robe lÃ©gÃ¨re et colorÃ©e, parfaite pour les journÃ©es ensoleillÃ©es et les escapades estivales.', '2023-11-18 02:20:16', 3, 380749),
(65, 'Costume', 61, 'Un costume Ã©lÃ©gant pour les occasions spÃ©ciales, avec une coupe impeccable et des dÃ©tails raffinÃ©s.', '2023-11-19 02:20:16', 3, 442131),
(66, 'Chaussures de sport', 105, 'Des chaussures de sport confortables et stylÃ©es, idÃ©ales pour l\'entraÃ®nement ou les activitÃ©s dÃ©contractÃ©es.', '2023-11-13 02:20:16', 3, 433087),
(67, 'Chaussures Ã  talons', 192, 'Des chaussures Ã  talons Ã©lÃ©gantes, parfaites pour complÃ©ter une tenue habillÃ©e et sophistiquÃ©e.', '2023-11-20 02:20:16', 3, 419759),
(68, 'Ã‰charpe', 57, 'Une Ã©charpe douce et chaude, ajoutant une touche de confort et de style Ã  vos tenues d\'hiver.', '2023-11-25 02:20:16', 3, 222750),
(69, 'Bonnet', 94, 'Un bonnet en tricot confortable, idÃ©al pour garder votre tÃªte au chaud par temps froid.', '2023-10-30 02:20:16', 3, 57269.5),
(70, 'Gants', 110, 'Des gants Ã©lÃ©gants et fonctionnels, parfaits pour rester au chaud tout en restant tendance.', '2023-11-23 02:20:16', 3, 496960),
(71, 'Sac Ã  main', 63, 'Un sac Ã  main chic et pratique, idÃ©al pour transporter vos essentiels avec style.', '2023-10-30 02:20:16', 3, 456902),
(72, 'Ceinture', 86, 'Une ceinture polyvalente, ajoutant une touche finale Ã  vos tenues et soulignant votre silhouette.', '2023-11-24 02:20:16', 3, 489768),
(73, 'Maillot de bain', 78, 'Un maillot de bain Ã©lÃ©gant, parfait pour les journÃ©es ensoleillÃ©es Ã  la plage ou Ã  la piscine.', '2023-11-08 02:20:16', 3, 209854),
(74, 'Short', 27, 'Un short dÃ©contractÃ© et confortable, idÃ©al pour les journÃ©es chaudes d\'Ã©tÃ©.', '2023-11-01 02:20:16', 3, 160570),
(75, 'Jupe', 53, 'Une jupe fÃ©minine et tendance, parfaite pour crÃ©er des looks Ã©lÃ©gants en toute saison.', '2023-11-21 02:20:16', 3, 306036),
(76, 'Blouson en jean', 27, 'Un blouson en jean classique, un incontournable dÃ©contractÃ© pour toutes les saisons.', '2023-11-24 02:20:16', 3, 396897),
(77, 'Sweat Ã  capuche', 129, 'Un sweat Ã  capuche doux et dÃ©contractÃ©, idÃ©al pour une tenue confortable les jours de dÃ©tente.', '2023-11-27 02:20:16', 3, 70476.5),
(78, 'Chaussettes', 49, 'Des chaussettes confortables et colorÃ©es, ajoutant une touche de fantaisie Ã  votre style quotidien.', '2023-11-22 02:20:16', 3, 61963.1),
(79, 'Pyjama', 24, 'Un pyjama doux et confortable, parfait pour passer des nuits paisibles et reposantes.', '2023-11-28 02:20:16', 3, 373855),
(80, 'Chapeau', 6, 'Un chapeau tendance pour ajouter du flair Ã  votre tenue, que ce soit pour une journÃ©e ensoleillÃ©e ou pour un Ã©vÃ©nement dÃ©contractÃ©.', '2023-11-15 02:20:16', 3, 153091),
(81, 'Pantalon de jogging', 18, 'Un pantalon de jogging dÃ©contractÃ©, idÃ©al pour les journÃ©es dÃ©contractÃ©es Ã  la maison ou Ã  l\'extÃ©rieur.', '2023-11-12 02:20:16', 3, 251661),
(82, 'Chemisier', 9, 'Un chemisier Ã©lÃ©gant, parfait pour des looks professionnels ou dÃ©contractÃ©s, selon l\'occasion.', '2023-11-25 02:20:16', 3, 48143.1),
(83, 'Polo', 15, 'Un polo classique et confortable, idÃ©al pour un style dÃ©contractÃ© et Ã©lÃ©gant.', '2023-11-05 02:20:16', 3, 364714),
(84, 'Soutien-gorge', 5, 'Un soutien-gorge confortable et bien ajustÃ©, essentiel pour un soutien optimal au quotidien.', '2023-11-04 02:20:16', 3, 313124),
(85, 'CaleÃ§on', 0, 'Des caleÃ§ons confortables et stylÃ©s, ajoutant une touche de personnalitÃ© Ã  votre tiroir Ã  sous-vÃªtements.', '2023-11-13 02:20:16', 3, 253090),
(86, 'Cravate', 46, 'Une cravate Ã©lÃ©gante, parfaite pour complÃ©ter un costume formel ou ajouter une touche sophistiquÃ©e Ã  une tenue dÃ©contractÃ©e.', '2023-11-05 02:20:16', 3, 98879.9),
(87, 'Manteau', 196, 'Un manteau Ã©lÃ©gant et chaud, idÃ©al pour affronter les journÃ©es froides avec style.', '2023-11-18 02:20:16', 3, 255271);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_id` (`id_category`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
