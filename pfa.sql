-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 01 juil. 2021 à 13:55
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
-- Base de données :  `pfa`
--

-- --------------------------------------------------------

--
-- Structure de la table `audios`
--

DROP TABLE IF EXISTS `audios`;
CREATE TABLE IF NOT EXISTS `audios` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `singer` varchar(200) NOT NULL,
  `src` text NOT NULL,
  `emotion_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emotion_audio` (`emotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `audios`
--

INSERT INTO `audios` (`id`, `title`, `singer`, `src`, `emotion_id`) VALUES
(5, 'Epic Motivational Music', 'Born A Legend', 'https://drive.google.com/uc?export=download&id=1m2LoWOVADgn77-yTCurbBVfKbfYe5XQ3', 1),
(6, 'Most Happy Background Music ', 'MorningLight Music', 'https://drive.google.com/uc?export=download&id=1BtAD1vZQ3BqNtMHgmU_wy5Ioqn-rCzv-', 1),
(7, 'Emotional Cinematic Background Music', 'AShamaluevMusic', 'https://drive.google.com/uc?export=download&id=1aX8E6Ef_rAbfWKgOO6dW2Z_pU8Y2gxHK', 2),
(8, 'Sad And Emotional Music', 'Rain Melody', 'https://drive.google.com/uc?export=download&id=1glm23tcmJlrOHfTdIPpXSMVvnuaeuFNs', 2);

-- --------------------------------------------------------

--
-- Structure de la table `emotion`
--

DROP TABLE IF EXISTS `emotion`;
CREATE TABLE IF NOT EXISTS `emotion` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emotion`
--

INSERT INTO `emotion` (`id`, `name`, `description`) VALUES
(1, 'happy', 'test test'),
(2, 'Sad', 'Sad!'),
(3, 'Angry', 'angry!'),
(4, 'Neutral', 'neutral!');

-- --------------------------------------------------------

--
-- Structure de la table `paragraphe`
--

DROP TABLE IF EXISTS `paragraphe`;
CREATE TABLE IF NOT EXISTS `paragraphe` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `emotion_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `para_emotion` (`emotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paragraphe`
--

INSERT INTO `paragraphe` (`id`, `title`, `content`, `emotion_id`) VALUES
(2, 'Be Positive', 'The first and foremost key for happiness is to be positive and always see the positive aspect of any scenario. There is a saying that failures are the lessons for success, its simple even your failures are build-up you as a person.', 1),
(3, 'Stop Worrying', 'Worry and future insecurities are the obstructions for progress. What if we stop worrying over small issues? It is not that easy that it sounds, but relieving our self from the worries will be a step towards a happy and determined life.', 2),
(4, 'Stay Happy', 'Staying happy is one of the best cures for regular life. One could find happiness and motivation at the same time. But question is that How? People complain that they are not mentally satisfied and they always face stress.', 1),
(5, 'Unhappy', 'Don’t waste your time in anger, regrets, worries, and grudges. Life is too short to be unhappy', 3),
(6, 'anger is like fire', 'Bitterness is like cancer. It eats upon the host. But anger is like fire. It burns it all clean', 3),
(7, 'Be Positive', 'The first and foremost key for happiness is to be positive and always see the positive aspect of any scenario. There is a saying that failures are the lessons for success, its simple even your failures are build-up you as a person.', 4),
(8, 'Dont let them to hurt you', 'If you spend your time hoping someone will suffer the consequences for what they did to your heart, then you\'re allowing them to hurt you a second time in your mind.', 2);

-- --------------------------------------------------------

--
-- Structure de la table `qoutes`
--

DROP TABLE IF EXISTS `qoutes`;
CREATE TABLE IF NOT EXISTS `qoutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `emotion_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emotio_qoutes` (`emotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `qoutes`
--

INSERT INTO `qoutes` (`id`, `content`, `emotion_id`) VALUES
(1, 'Never Forget The Hands That Raised You', 1),
(5, 'Be healthy and take care of yourself', 1),
(6, 'The biggest adventure you can ever take is to live the life of your dreams.', 1),
(7, 'Beauty is everywhere. You only have to look to see it.', 1),
(8, 'You can’t stop the waves, but you can learn to swim.', 2),
(9, 'You can’t stop the waves, but you can learn to swim.', 3),
(10, 'Life is the dancer and you are the dance.', 1),
(11, 'Every day is a new day.', 1),
(12, 'No medicine cures what happiness cannot.', 1),
(13, 'Things change. And friends leave. Life doesn\'t stop for anybody.', 2),
(14, 'To have felt too much is to end in feeling nothing.', 2),
(15, 'Life\'s under no obligation to give us what we expect.', 2),
(16, 'One must not let oneself be overwhelmed by sadness.', 2),
(17, 'Our sweetest songs are those that tell of saddest thought.', 2),
(18, 'In deep sadness there is no place for sentimentality.', 2),
(19, 'Life is too short to be angry or sad for long.', 2),
(20, 'Life is too short to be angry or sad for long.', 3),
(21, 'When you feel sad, it’s okay. It’s not the end of the world.', 2),
(22, 'When you feel angry, it’s okay. It’s not the end of the world.', 3),
(23, 'It doesn’t hurt to feel sad from time to time.', 2),
(24, 'It doesn’t hurt to feel angry from time to time.', 3),
(25, 'Be healthy and take care of yourself', 4),
(26, 'Beauty is everywhere. You only have to look to see it.', 4),
(27, 'Every day is a new day.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `vidoes`
--

DROP TABLE IF EXISTS `vidoes`;
CREATE TABLE IF NOT EXISTS `vidoes` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `src` text NOT NULL,
  `emotion_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emotion_vidoe` (`emotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vidoes`
--

INSERT INTO `vidoes` (`id`, `title`, `src`, `emotion_id`) VALUES
(2, 'adnane ibrahim 1', 'https://www.youtube.com/embed/hcGaqCbRe6E', 1),
(4, 'Hamza Namira - Dari Ya Alby | حمزة نمرة - داري يا قلبي', 'https://www.youtube.com/embed/23ruEfLScnM', 2),
(5, 'ENJOY LIFE', 'https://www.youtube.com/embed/I7fA8hdrqp8', 1),
(6, 'Why I Never Get Angry', 'https://www.youtube.com/embed/t7ae5lhQZz8', 3),
(7, 'If you\'re feeling depressed, anxious, sad, or angry ', 'https://www.youtube.com/embed/ZebSXPUCPFc', 3),
(8, 'THE MINDSET OF HIGH ACHIEVERS ', 'https://www.youtube.com/embed/0mm57rH1sTE', 2),
(9, 'ENJOY LIFE', 'https://www.youtube.com/embed/Tv5aobzM_hY', 1),
(10, 'How To Be Happy ', 'https://www.youtube.com/embed/g57Ch-PFpvM', 1),
(11, 'YOU ARE STRONG - Inspiring Speech On Depression & Mental Health', 'https://www.youtube.com/embed/-GXfLY4-d8w', 2),
(12, 'OVERCOME DEPRESSION', 'https://www.youtube.com/embed/d96akWDnx0w', 2),
(13, 'ENJOY LIFE', 'https://www.youtube.com/embed/I7fA8hdrqp8', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `audios`
--
ALTER TABLE `audios`
  ADD CONSTRAINT `emotion_audio` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `paragraphe`
--
ALTER TABLE `paragraphe`
  ADD CONSTRAINT `para_emotion` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `qoutes`
--
ALTER TABLE `qoutes`
  ADD CONSTRAINT `emotio_qoutes` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vidoes`
--
ALTER TABLE `vidoes`
  ADD CONSTRAINT `emotion_vidoe` FOREIGN KEY (`emotion_id`) REFERENCES `emotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
