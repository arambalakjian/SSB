-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 29, 2014 at 11:04 AM
-- Server version: 5.5.38
-- PHP Version: 5.3.10-1ubuntu3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ssbits_local`
--

-- --------------------------------------------------------

--
-- Table structure for table `ArticleIdea`
--

CREATE TABLE IF NOT EXISTS `ArticleIdea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ArticleIdea') CHARACTER SET utf8 DEFAULT 'ArticleIdea',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8,
  `Rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ArticleIdea`
--

INSERT INTO `ArticleIdea` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Rating`) VALUES
(1, 'ArticleIdea', '2014-07-21 15:22:15', '2014-07-21 15:22:29', 'This is an idea for a tutorial', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ArticleVote`
--

CREATE TABLE IF NOT EXISTS `ArticleVote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ArticleVote') CHARACTER SET utf8 DEFAULT 'ArticleVote',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `ArticleIdeaID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ArticleIdeaID` (`ArticleIdeaID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ArticleVote`
--

INSERT INTO `ArticleVote` (`ID`, `ClassName`, `Created`, `LastEdited`, `MemberID`, `ArticleIdeaID`) VALUES
(1, 'ArticleVote', '2014-07-21 15:22:29', '2014-07-21 15:22:29', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `CodeBlock`
--

CREATE TABLE IF NOT EXISTS `CodeBlock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` mediumtext CHARACTER SET utf8,
  `Caption` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `CodeBlock`
--

INSERT INTO `CodeBlock` (`ID`, `Content`, `Caption`) VALUES
(1, '$gridFieldConfig = new GridFieldConfig_RecordEditor();\r\n		$list = $this->owner->ItemComments();\r\n		$gridField = new GridField(''Comments'', ''ArticleVotes'', $list, $gridFieldConfig);\r\n		$fields->addFieldToTab(''Root.Comments'', $gridField);\r\n\r\n	/**\r\n	 * strip the file type from the block title \r\n	 * \r\n	 * @return String\r\n	 */\r\n	public function getCodeType()\r\n	{\r\n		if($fileSplit = explode(''.'', $this->Title))\r\n		{\r\n			return $fileSplit[1];\r\n		}\r\n	}', 'This is some code');

-- --------------------------------------------------------

--
-- Table structure for table `ContentBlock`
--

CREATE TABLE IF NOT EXISTS `ContentBlock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` mediumtext CHARACTER SET utf8,
  `ImageAlign` enum('left','right') CHARACTER SET utf8 DEFAULT 'left',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ContentBlock`
--

INSERT INTO `ContentBlock` (`ID`, `Content`, `ImageAlign`, `ImageID`) VALUES
(2, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>', 'left', 3);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPage`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DataObjectAsPage','Post','SOTMPost','Snippet','Tutorial','View') CHARACTER SET utf8 DEFAULT 'DataObjectAsPage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `Version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `DataObjectAsPage`
--

INSERT INTO `DataObjectAsPage` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MetaTitle`, `MetaDescription`, `Content`, `Version`) VALUES
(1, 'Tutorial', '2014-07-21 15:13:40', '2014-07-21 16:03:12', 'sample-tutorial', 'Sample Tutorial', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>', 3),
(3, 'View', '2014-07-29 09:26:52', '2014-07-29 09:28:34', 'a-sample-view', 'A Sample View', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>\n<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.</p>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPageCategory`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPageCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DataObjectAsPageCategory','SnippetTag','TutorialLevel','TutorialTag','Version','ViewTag') CHARACTER SET utf8 DEFAULT 'DataObjectAsPageCategory',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(140) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `DataObjectAsPageCategory`
--

INSERT INTO `DataObjectAsPageCategory` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`) VALUES
(1, 'TutorialTag', '2014-07-21 14:59:29', '2014-07-21 14:59:29', 'Tag 1'),
(2, 'TutorialTag', '2014-07-21 14:59:45', '2014-07-21 14:59:45', 'Tag 2'),
(3, 'TutorialTag', '2014-07-21 14:59:57', '2014-07-21 14:59:57', 'Tag 3'),
(4, 'TutorialLevel', '2014-07-21 15:00:24', '2014-07-21 15:00:24', 'Beginner'),
(5, 'TutorialLevel', '2014-07-21 15:00:42', '2014-07-21 15:00:42', 'Intermediate'),
(6, 'TutorialLevel', '2014-07-21 15:00:56', '2014-07-21 15:00:56', 'Advanced'),
(7, 'ViewTag', '2014-07-21 15:30:16', '2014-07-21 15:30:16', 'Tag 1'),
(8, 'SnippetTag', '2014-07-21 15:56:43', '2014-07-21 15:56:43', 'Snippet Tag 1'),
(9, 'Version', '2014-07-21 15:57:24', '2014-07-21 15:57:24', '2.4'),
(10, 'Version', '2014-07-21 15:57:55', '2014-07-21 15:57:55', '3.0'),
(11, 'Version', '2014-07-21 15:58:14', '2014-07-21 15:58:14', '3.1');

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPageHolder`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPageHolder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ItemsAsChildren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Paginate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `DataObjectAsPageHolder`
--

INSERT INTO `DataObjectAsPageHolder` (`ID`, `ItemsPerPage`, `ItemsAsChildren`, `Paginate`) VALUES
(6, 10, 0, 1),
(7, 10, 0, 1),
(8, 10, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPageHolder_Live`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPageHolder_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ItemsAsChildren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Paginate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `DataObjectAsPageHolder_Live`
--

INSERT INTO `DataObjectAsPageHolder_Live` (`ID`, `ItemsPerPage`, `ItemsAsChildren`, `Paginate`) VALUES
(6, 10, 0, 1),
(7, 10, 0, 1),
(8, 10, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPageHolder_versions`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPageHolder_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ItemsPerPage` int(11) NOT NULL DEFAULT '0',
  `ItemsAsChildren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Paginate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `DataObjectAsPageHolder_versions`
--

INSERT INTO `DataObjectAsPageHolder_versions` (`ID`, `RecordID`, `Version`, `ItemsPerPage`, `ItemsAsChildren`, `Paginate`) VALUES
(1, 6, 1, 10, 0, 1),
(2, 6, 2, 10, 0, 1),
(3, 6, 3, 10, 0, 1),
(4, 7, 1, 10, 0, 1),
(5, 7, 2, 10, 0, 1),
(6, 7, 3, 10, 0, 1),
(7, 8, 1, 10, 0, 1),
(8, 8, 2, 10, 0, 1),
(9, 8, 3, 10, 0, 1),
(10, 8, 4, 10, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPage_Live`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('DataObjectAsPage','Post','SOTMPost','Snippet','Tutorial','View') CHARACTER SET utf8 DEFAULT 'DataObjectAsPage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `Version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `URLSegment` (`URLSegment`) USING BTREE,
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `DataObjectAsPage_Live`
--

INSERT INTO `DataObjectAsPage_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MetaTitle`, `MetaDescription`, `Content`, `Version`) VALUES
(1, 'Tutorial', '2014-07-21 15:13:40', '2014-07-21 16:03:12', 'sample-tutorial', 'Sample Tutorial', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>', 3),
(2, 'Snippet', '2014-07-29 09:24:07', '2014-07-29 09:24:07', 'test-snippet', 'Test Snippet', NULL, NULL, 'This snippet is epic. Seriously', 1),
(3, 'View', '2014-07-29 09:26:52', '2014-07-29 09:28:34', 'a-sample-view', 'A Sample View', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>\n<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.</p>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `DataObjectAsPage_versions`
--

CREATE TABLE IF NOT EXISTS `DataObjectAsPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('DataObjectAsPage','Post','SOTMPost','Snippet','Tutorial','View') CHARACTER SET utf8 DEFAULT 'DataObjectAsPage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `URLSegment` (`URLSegment`) USING BTREE,
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `DataObjectAsPage_versions`
--

INSERT INTO `DataObjectAsPage_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MetaTitle`, `MetaDescription`, `Content`) VALUES
(1, 1, 1, 1, 1, 1, 'Tutorial', '2014-07-21 15:13:40', '2014-07-21 15:13:40', 'sample-tutorial', 'Sample Tutorial', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>'),
(2, 1, 2, 1, 1, 1, 'Tutorial', '2014-07-21 15:13:40', '2014-07-21 15:14:43', 'sample-tutorial', 'Sample Tutorial', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>'),
(3, 1, 3, 1, 1, 1, 'Tutorial', '2014-07-21 15:13:40', '2014-07-21 16:03:12', 'sample-tutorial', 'Sample Tutorial', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>'),
(4, 2, 1, 0, 1, 0, 'Snippet', '2014-07-29 09:24:07', '2014-07-29 09:24:07', 'test-snippet', 'Test Snippet', NULL, NULL, 'This snippet is epic. Seriously'),
(5, 3, 1, 1, 1, 1, 'View', '2014-07-29 09:26:52', '2014-07-29 09:26:52', 'a-sample-view', 'A Sample View', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>\n<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.</p>'),
(6, 3, 2, 1, 1, 1, 'View', '2014-07-29 09:26:52', '2014-07-29 09:28:06', 'a-sample-view', 'A Sample View', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>\n<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.</p>'),
(7, 3, 3, 1, 1, 1, 'View', '2014-07-29 09:26:52', '2014-07-29 09:28:34', 'a-sample-view', 'A Sample View', 'New Item', NULL, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.</p>\n<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>\n<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE IF NOT EXISTS `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE IF NOT EXISTS `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') CHARACTER SET utf8 DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `Created`, `LastEdited`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2014-07-21 15:16:19', '2014-07-21 15:16:19', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 1, 0, 1),
(2, 'Folder', '2014-07-21 15:16:19', '2014-07-21 15:16:19', 'content-block-images', 'content-block-images', 'assets/Uploads/content-block-images/', NULL, 1, 1, 1),
(3, 'Image', '2014-07-21 15:16:25', '2014-07-21 15:16:25', 'Chrysanthemum.jpg', 'Chrysanthemum', 'assets/Uploads/content-block-images/Chrysanthemum.jpg', NULL, 1, 2, 1),
(4, 'Folder', '2014-07-21 16:01:11', '2014-07-21 16:01:11', 'sotm-images', 'sotm-images', 'assets/Uploads/sotm-images/', NULL, 1, 1, 1),
(5, 'Image', '2014-07-21 16:01:12', '2014-07-21 16:01:12', 'CarbonCrayon-awwards.jpg', 'CarbonCrayon awwards', 'assets/Uploads/sotm-images/CarbonCrayon-awwards.jpg', NULL, 1, 4, 1),
(6, 'Folder', '2014-07-21 16:03:08', '2014-07-21 16:03:08', 'post-images', 'post-images', 'assets/Uploads/post-images/', NULL, 1, 1, 1),
(7, 'Image', '2014-07-21 16:03:09', '2014-07-21 16:03:09', 'CarbonCrayon-cssmania.png', 'CarbonCrayon cssmania', 'assets/Uploads/post-images/CarbonCrayon-cssmania.png', NULL, 1, 6, 1),
(8, 'Image', '2014-07-29 09:28:31', '2014-07-29 09:28:31', 'Chrysanthemum.jpg', 'Chrysanthemum', 'assets/Uploads/post-images/Chrysanthemum.jpg', NULL, 1, 6, 1),
(9, 'Image', '2014-07-29 09:31:22', '2014-07-29 09:31:22', 'Koala.jpg', 'Koala', 'assets/Uploads/sotm-images/Koala.jpg', NULL, 1, 4, 1),
(10, 'Folder', '2014-07-29 09:53:14', '2014-07-29 09:53:14', 'profile-pictures', 'profile-pictures', 'assets/Uploads/profile-pictures/', NULL, 1, 1, 1),
(11, 'Image', '2014-07-29 09:53:14', '2014-07-29 09:53:14', 'Koala.jpg', 'Koala', 'assets/Uploads/profile-pictures/Koala.jpg', NULL, 1, 10, 1),
(12, 'Image', '2014-07-29 09:57:15', '2014-07-29 09:57:15', 'Hydrangeas.jpg', 'Hydrangeas', 'assets/Uploads/sotm-images/Hydrangeas.jpg', NULL, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE IF NOT EXISTS `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE IF NOT EXISTS `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE IF NOT EXISTS `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ImageBlock`
--

CREATE TABLE IF NOT EXISTS `ImageBlock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CaptionLeft` mediumtext CHARACTER SET utf8,
  `CaptionRight` mediumtext CHARACTER SET utf8,
  `ImageLeftID` int(11) NOT NULL DEFAULT '0',
  `ImageRightID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageLeftID` (`ImageLeftID`),
  KEY `ImageRightID` (`ImageRightID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ItemComment`
--

CREATE TABLE IF NOT EXISTS `ItemComment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ItemComment') CHARACTER SET utf8 DEFAULT 'ItemComment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Comment` mediumtext CHARACTER SET utf8,
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `ItemID` int(11) NOT NULL DEFAULT '0',
  `ParentCommentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ItemID` (`ItemID`),
  KEY `ParentCommentID` (`ParentCommentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ItemComment`
--

INSERT INTO `ItemComment` (`ID`, `ClassName`, `Created`, `LastEdited`, `Comment`, `AuthorID`, `ItemID`, `ParentCommentID`) VALUES
(1, 'ItemComment', '2014-07-21 16:57:36', '2014-07-21 17:01:37', 'This is a sample comment and again edit ', 1, 1, 0),
(2, 'ItemComment', '2014-07-21 16:58:01', '2014-07-21 16:58:01', 'Another Comment', 1, 1, 0),
(3, 'ItemComment', '2014-07-21 17:01:51', '2014-07-21 17:01:51', 'A reply to my own comment', 1, 1, 2),
(4, 'ItemComment', '2014-07-21 17:02:23', '2014-07-21 17:02:23', 'Reply to this ', 1, 1, 1),
(5, 'ItemComment', '2014-07-29 09:28:59', '2014-07-29 09:28:59', 'This is a comment', 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE IF NOT EXISTS `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `EmailValidated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailValidationCode` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Username` varchar(75) CHARACTER SET utf8 DEFAULT NULL,
  `GithubName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `TwitterName` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `LinkedInName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Bio` mediumtext CHARACTER SET utf8,
  `SnippetCount` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `Email` (`Email`(255)),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `EmailValidated`, `EmailValidationCode`, `Username`, `GithubName`, `TwitterName`, `LinkedInName`, `Website`, `Bio`, `SnippetCount`, `ImageID`) VALUES
(1, 'Member', '2014-07-21 12:52:03', '2014-07-29 11:03:01', 'Aram', 'Balakjian', 'hello@carboncrayon.com', '$2y$10$a16fcea772d85c7446555u.hhsBDf8GKfUADK/QwBIHhJSKpaqQtS', NULL, 9, '2014-07-29 11:03:02', NULL, NULL, 'blowfish', '10$a16fcea772d85c74465553', NULL, NULL, 'en_US', 0, NULL, NULL, 1, '6k7p032w62w814tift1z', 'aram', 'arambalakjian', 'carbon_crayon', 'arambalalkjian', 'www.carboncrayon.com', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.', 1, 11),
(2, 'Member', '2014-07-21 13:56:01', '2014-07-21 14:04:33', 'Aram', 'Balakjian', 'aram@carboncrayon.com', NULL, NULL, 2, '2014-07-21 14:04:32', NULL, NULL, NULL, NULL, NULL, NULL, 'en_US', 0, NULL, NULL, 0, 'z9wzgwib6pg5742cyxp0', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE IF NOT EXISTS `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `Created`, `LastEdited`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2014-07-21 16:06:24', '2014-07-21 16:06:24', '$2y$10$a16fcea772d85c7446555u.hhsBDf8GKfUADK/QwBIHhJSKpaqQtS', '10$a16fcea772d85c74465553', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `OpauthIdentity`
--

CREATE TABLE IF NOT EXISTS `OpauthIdentity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('OpauthIdentity') CHARACTER SET utf8 DEFAULT 'OpauthIdentity',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `UID` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Provider` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `OpauthIdentity`
--

INSERT INTO `OpauthIdentity` (`ID`, `ClassName`, `Created`, `LastEdited`, `UID`, `Provider`, `MemberID`) VALUES
(1, 'OpauthIdentity', '2014-07-21 13:56:01', '2014-07-21 13:56:01', '330153', 'Github', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Page`
--

CREATE TABLE IF NOT EXISTS `Page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowInFooter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Page`
--

INSERT INTO `Page` (`ID`, `ShowInFooter`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Page_Live`
--

CREATE TABLE IF NOT EXISTS `Page_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowInFooter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Page_Live`
--

INSERT INTO `Page_Live` (`ID`, `ShowInFooter`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Page_versions`
--

CREATE TABLE IF NOT EXISTS `Page_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ShowInFooter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `Page_versions`
--

INSERT INTO `Page_versions` (`ID`, `RecordID`, `Version`, `ShowInFooter`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 3, 1, 0),
(4, 4, 1, 0),
(5, 5, 1, 0),
(6, 1, 2, 0),
(7, 2, 2, 0),
(8, 3, 2, 0),
(9, 6, 1, 0),
(10, 6, 2, 0),
(11, 6, 3, 0),
(12, 7, 1, 0),
(13, 7, 2, 0),
(14, 7, 3, 0),
(15, 8, 1, 0),
(16, 8, 2, 0),
(17, 8, 3, 0),
(18, 8, 4, 0),
(19, 9, 1, 0),
(20, 9, 2, 0),
(21, 9, 3, 0),
(22, 9, 4, 0),
(23, 1, 3, 0),
(24, 10, 1, 0),
(25, 10, 2, 0),
(26, 10, 3, 0),
(27, 10, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2014-07-21 12:52:03', '2014-07-21 12:52:03', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE IF NOT EXISTS `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PublishDate` date DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `VersionID` (`VersionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`ID`, `PublishDate`, `ImageID`, `AuthorID`, `VersionID`) VALUES
(1, '2014-07-20', 7, 0, 0),
(3, '2014-07-28', 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PostBlock`
--

CREATE TABLE IF NOT EXISTS `PostBlock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PostBlock','CodeBlock','ContentBlock','ImageBlock') CHARACTER SET utf8 DEFAULT 'PostBlock',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `PostID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PostID` (`PostID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `PostBlock`
--

INSERT INTO `PostBlock` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Sort`, `PostID`) VALUES
(1, 'CodeBlock', '2014-07-21 15:15:12', '2014-07-21 15:24:59', 'SomeClass.php', 0, 1),
(2, 'ContentBlock', '2014-07-21 15:16:28', '2014-07-21 15:16:28', 'Content Block', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Post_Live`
--

CREATE TABLE IF NOT EXISTS `Post_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PublishDate` date DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `VersionID` (`VersionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Post_Live`
--

INSERT INTO `Post_Live` (`ID`, `PublishDate`, `ImageID`, `AuthorID`, `VersionID`) VALUES
(1, '2014-07-20', 7, 0, 0),
(2, NULL, 0, 1, 11),
(3, '2014-07-28', 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Post_versions`
--

CREATE TABLE IF NOT EXISTS `Post_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PublishDate` date DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `VersionID` (`VersionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Post_versions`
--

INSERT INTO `Post_versions` (`ID`, `RecordID`, `Version`, `PublishDate`, `ImageID`, `AuthorID`, `VersionID`) VALUES
(1, 1, 1, '2014-07-20', 0, 0, 0),
(2, 1, 2, '2014-07-20', 0, 0, 0),
(3, 1, 3, '2014-07-20', 7, 0, 0),
(4, 2, 1, NULL, 0, 1, 11),
(5, 3, 1, '2014-07-28', 0, 0, 0),
(6, 3, 2, '2014-07-28', 0, 0, 0),
(7, 3, 3, '2014-07-28', 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE IF NOT EXISTS `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `ValidationEmailContent` mediumtext CHARACTER SET utf8,
  `ValidationCompleteContent` mediumtext CHARACTER SET utf8,
  `SendFormsTo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SendEmailsFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GistAccountToken` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SendTestEmailsTo` mediumtext CHARACTER SET utf8,
  `AboutPageID` int(11) NOT NULL DEFAULT '0',
  `WriteForUsPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AboutPageID` (`AboutPageID`),
  KEY `WriteForUsPageID` (`WriteForUsPageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `ValidationEmailContent`, `ValidationCompleteContent`, `SendFormsTo`, `SendEmailsFrom`, `GistAccountToken`, `SendTestEmailsTo`, `AboutPageID`, `WriteForUsPageID`) VALUES
(1, 'SiteConfig', '2014-07-21 12:52:03', '2014-07-29 09:20:46', 'SSBits', NULL, NULL, 'Anyone', 'LoggedInUsers', 'LoggedInUsers', NULL, NULL, NULL, 'noreply@ssbits.com', '70eb0022934728d9441c2480d9cf7462a3cc6261 ', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE IF NOT EXISTS `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','DataObjectAsPageHolder','FilteredListingPage','SnippetListingPage','TutorialListingPage','ViewListingPage','ContactPage','HomePage','ProfilePage','SOTMPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2014-07-21 12:52:05', '2014-07-21 14:12:04', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(2, 'Page', '2014-07-21 12:52:05', '2014-07-21 14:05:31', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 2, 0),
(3, 'ContactPage', '2014-07-21 12:52:05', '2014-07-21 14:05:47', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 2, 0),
(4, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 1, 0),
(5, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 1, 0),
(6, 'TutorialListingPage', '2014-07-21 14:06:39', '2014-07-21 14:07:01', 'tutorials', 'Tutorials', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(7, 'ViewListingPage', '2014-07-21 14:07:15', '2014-07-21 14:07:45', 'views', 'Views', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(8, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:36', 'snippets', 'Snippets', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0),
(9, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:09:19', 'awards', 'Awards', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0),
(10, 'ProfilePage', '2014-07-21 14:25:06', '2014-07-21 14:31:37', 'profile', 'profile', NULL, NULL, NULL, NULL, 0, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','DataObjectAsPageHolder','FilteredListingPage','SnippetListingPage','TutorialListingPage','ViewListingPage','ContactPage','HomePage','ProfilePage','SOTMPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2014-07-21 12:52:05', '2014-07-21 14:12:04', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(2, 'Page', '2014-07-21 12:52:05', '2014-07-21 14:05:31', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 2, 0),
(3, 'ContactPage', '2014-07-21 12:52:05', '2014-07-21 14:05:47', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 2, 0),
(4, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 1, 0),
(5, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 1, 0),
(6, 'TutorialListingPage', '2014-07-21 14:06:39', '2014-07-21 14:07:01', 'tutorials', 'Tutorials', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(7, 'ViewListingPage', '2014-07-21 14:07:15', '2014-07-21 14:07:45', 'views', 'Views', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 3, 0),
(8, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:36', 'snippets', 'Snippets', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0),
(9, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:09:19', 'awards', 'Awards', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0),
(10, 'ProfilePage', '2014-07-21 14:25:06', '2014-07-21 14:31:38', 'profile', 'profile', NULL, NULL, NULL, NULL, 0, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE IF NOT EXISTS `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','DataObjectAsPageHolder','FilteredListingPage','SnippetListingPage','TutorialListingPage','ViewListingPage','ContactPage','HomePage','ProfilePage','SOTMPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(2, 2, 1, 1, 0, 0, 'Page', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(3, 3, 1, 1, 0, 0, 'Page', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2014-07-21 12:52:05', '2014-07-21 12:52:05', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(6, 1, 2, 1, 1, 1, 'HomePage', '2014-07-21 12:52:05', '2014-07-21 14:05:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(7, 2, 2, 1, 1, 1, 'Page', '2014-07-21 12:52:05', '2014-07-21 14:05:31', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(8, 3, 2, 1, 1, 1, 'ContactPage', '2014-07-21 12:52:05', '2014-07-21 14:05:47', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 0, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(9, 6, 1, 0, 1, 0, 'TutorialListingPage', '2014-07-21 14:06:39', '2014-07-21 14:06:39', 'new-tutorial-listing-page', 'New Tutorial Listing Page', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(10, 6, 2, 1, 1, 1, 'TutorialListingPage', '2014-07-21 14:06:39', '2014-07-21 14:06:51', 'tutorials', 'Tutorials', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(11, 6, 3, 1, 1, 1, 'TutorialListingPage', '2014-07-21 14:06:39', '2014-07-21 14:06:57', 'tutorials', 'Tutorials', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(12, 7, 1, 0, 1, 0, 'ViewListingPage', '2014-07-21 14:07:15', '2014-07-21 14:07:15', 'new-view-listing-page', 'New View Listing Page', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(13, 7, 2, 1, 1, 1, 'ViewListingPage', '2014-07-21 14:07:15', '2014-07-21 14:07:25', 'views', 'Views', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(14, 7, 3, 1, 1, 1, 'ViewListingPage', '2014-07-21 14:07:15', '2014-07-21 14:07:41', 'views', 'Views', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(15, 8, 1, 0, 1, 0, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:12', 'new-snippet-listing-page', 'New Snippet Listing Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 7),
(16, 8, 2, 1, 1, 1, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:27', 'snippets', 'Snippets', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 7),
(17, 8, 3, 0, 1, 0, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:34', 'snippets', 'Snippets', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(18, 8, 4, 1, 1, 1, 'SnippetListingPage', '2014-07-21 14:08:12', '2014-07-21 14:08:34', 'snippets', 'Snippets', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(19, 9, 1, 0, 1, 0, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:08:53', 'new-s-o-t-m-page', 'New S O T M Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 8),
(20, 9, 2, 1, 1, 1, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:09:01', 'awards', 'Awards', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 8),
(21, 9, 3, 0, 1, 0, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:09:11', 'awards', 'Awards', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(22, 9, 4, 1, 1, 1, 'SOTMPage', '2014-07-21 14:08:53', '2014-07-21 14:09:11', 'awards', 'Awards', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(23, 1, 3, 1, 1, 1, 'HomePage', '2014-07-21 12:52:05', '2014-07-21 14:12:04', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(24, 10, 1, 0, 1, 0, 'Page', '2014-07-21 14:25:06', '2014-07-21 14:25:06', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(25, 10, 2, 1, 1, 1, 'Page', '2014-07-21 14:25:06', '2014-07-21 14:25:19', 'profile', 'profile', NULL, NULL, NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(26, 10, 3, 1, 1, 1, 'Page', '2014-07-21 14:25:06', '2014-07-21 14:26:27', 'profile', 'profile', NULL, NULL, NULL, NULL, 0, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0),
(27, 10, 4, 1, 1, 1, 'ProfilePage', '2014-07-21 14:25:06', '2014-07-21 14:31:37', 'profile', 'profile', NULL, NULL, NULL, NULL, 0, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteVote`
--

CREATE TABLE IF NOT EXISTS `SiteVote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteVote') CHARACTER SET utf8 DEFAULT 'SiteVote',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` year(4) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `SOTMNomineeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `SOTMNomineeID` (`SOTMNomineeID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteVote`
--

INSERT INTO `SiteVote` (`ID`, `ClassName`, `Created`, `LastEdited`, `Month`, `Year`, `MemberID`, `SOTMNomineeID`) VALUES
(1, 'SiteVote', '2014-07-29 09:33:07', '2014-07-29 09:33:07', 7, 2014, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Snippet`
--

CREATE TABLE IF NOT EXISTS `Snippet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GistID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `GistLink` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Snippet_Live`
--

CREATE TABLE IF NOT EXISTS `Snippet_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GistID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `GistLink` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Snippet_Live`
--

INSERT INTO `Snippet_Live` (`ID`, `GistID`, `GistLink`) VALUES
(2, '714bd664600d2fa63dac', 'https://gist.github.com/714bd664600d2fa63dac');

-- --------------------------------------------------------

--
-- Table structure for table `Snippet_SnippetTags`
--

CREATE TABLE IF NOT EXISTS `Snippet_SnippetTags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SnippetID` int(11) NOT NULL DEFAULT '0',
  `SnippetTagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SnippetID` (`SnippetID`),
  KEY `SnippetTagID` (`SnippetTagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Snippet_SnippetTags`
--

INSERT INTO `Snippet_SnippetTags` (`ID`, `SnippetID`, `SnippetTagID`) VALUES
(1, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Snippet_versions`
--

CREATE TABLE IF NOT EXISTS `Snippet_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `GistID` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `GistLink` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Snippet_versions`
--

INSERT INTO `Snippet_versions` (`ID`, `RecordID`, `Version`, `GistID`, `GistLink`) VALUES
(1, 2, 1, '714bd664600d2fa63dac', 'https://gist.github.com/714bd664600d2fa63dac');

-- --------------------------------------------------------

--
-- Table structure for table `SOTMNominee`
--

CREATE TABLE IF NOT EXISTS `SOTMNominee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SOTMNominee') CHARACTER SET utf8 DEFAULT 'SOTMNominee',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8,
  `Rating` int(11) NOT NULL DEFAULT '0',
  `Description` mediumtext CHARACTER SET utf8,
  `SiteURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` int(11) NOT NULL DEFAULT '0',
  `Accepted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Winner` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `SOTMNominee`
--

INSERT INTO `SOTMNominee` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Rating`, `Description`, `SiteURL`, `Month`, `Year`, `Accepted`, `Winner`, `ImageID`, `MemberID`) VALUES
(1, 'SOTMNominee', '2014-07-21 16:01:25', '2014-07-29 09:33:07', 'Carbon Crayon', 1, 'This is our portfolio site and it''s pretty cool', 'www.carboncrayon.com', 7, 2014, 1, 0, 5, 1),
(2, 'SOTMNominee', '2014-07-29 09:31:35', '2014-07-29 09:32:39', 'BBC', 0, 'This site is awesome, really great', 'www.bbc.co.uk', 7, 2014, 1, 0, 9, 1),
(3, 'SOTMNominee', '2014-07-29 09:57:20', '2014-07-29 09:57:20', 'A previous winner', 0, 'This is a great site. Previous winner it was.', 'http://www.google.com', 5, 2012, 0, 1, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SOTMPost`
--

CREATE TABLE IF NOT EXISTS `SOTMPost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOTMNomineeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SOTMNomineeID` (`SOTMNomineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SOTMPost_Live`
--

CREATE TABLE IF NOT EXISTS `SOTMPost_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOTMNomineeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SOTMNomineeID` (`SOTMNomineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SOTMPost_versions`
--

CREATE TABLE IF NOT EXISTS `SOTMPost_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SOTMNomineeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `SOTMNomineeID` (`SOTMNomineeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Tutorial`
--

CREATE TABLE IF NOT EXISTS `Tutorial` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GitLink` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `TutorialLevelID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TutorialLevelID` (`TutorialLevelID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Tutorial`
--

INSERT INTO `Tutorial` (`ID`, `GitLink`, `TutorialLevelID`) VALUES
(1, 'https://github.com/arambalakjian/DataObject-as-Page', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Tutorial_Live`
--

CREATE TABLE IF NOT EXISTS `Tutorial_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GitLink` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `TutorialLevelID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TutorialLevelID` (`TutorialLevelID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Tutorial_Live`
--

INSERT INTO `Tutorial_Live` (`ID`, `GitLink`, `TutorialLevelID`) VALUES
(1, 'https://github.com/arambalakjian/DataObject-as-Page', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Tutorial_TutorialTags`
--

CREATE TABLE IF NOT EXISTS `Tutorial_TutorialTags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TutorialID` int(11) NOT NULL DEFAULT '0',
  `TutorialTagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TutorialID` (`TutorialID`),
  KEY `TutorialTagID` (`TutorialTagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Tutorial_TutorialTags`
--

INSERT INTO `Tutorial_TutorialTags` (`ID`, `TutorialID`, `TutorialTagID`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Tutorial_versions`
--

CREATE TABLE IF NOT EXISTS `Tutorial_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `GitLink` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `TutorialLevelID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `TutorialLevelID` (`TutorialLevelID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Tutorial_versions`
--

INSERT INTO `Tutorial_versions` (`ID`, `RecordID`, `Version`, `GitLink`, `TutorialLevelID`) VALUES
(1, 1, 1, 'https://github.com/arambalakjian/DataObject-as-Page', 4),
(2, 1, 2, 'https://github.com/arambalakjian/DataObject-as-Page', 4),
(3, 1, 3, 'https://github.com/arambalakjian/DataObject-as-Page', 4);

-- --------------------------------------------------------

--
-- Table structure for table `View_ViewTags`
--

CREATE TABLE IF NOT EXISTS `View_ViewTags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ViewID` int(11) NOT NULL DEFAULT '0',
  `ViewTagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ViewID` (`ViewID`),
  KEY `ViewTagID` (`ViewTagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `View_ViewTags`
--

INSERT INTO `View_ViewTags` (`ID`, `ViewID`, `ViewTagID`) VALUES
(1, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE IF NOT EXISTS `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
