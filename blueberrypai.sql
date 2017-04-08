-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 08, 2017 at 08:07 AM
-- Server version: 5.5.49-log
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blueberrypai`
--

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE IF NOT EXISTS `home` (
  `id` int(100) NOT NULL,
  `AlbumTitle` varchar(100) NOT NULL,
  `AlbumCover` text NOT NULL,
  `author` text NOT NULL,
  `AlbumList` text NOT NULL,
  `playcount` float(11,1) NOT NULL,
  `category` varchar(100) NOT NULL,
  `mark` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='首页数据表';

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`id`, `AlbumTitle`, `AlbumCover`, `author`, `AlbumList`, `playcount`, `category`, `mark`) VALUES
(1, '这个世界，我只有你', 'http://on4akwtwp.bkt.clouddn.com/new1.jpg', '宁恒宇', '床边的故事', 18.6, '', 'newsonglist'),
(2, '一只小猪', 'http://on4akwtwp.bkt.clouddn.com/new2.jpg', '泳儿', '八度空间', 0.0, '', 'newsonglist'),
(3, '等', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', '严艺丹', '范特西', 0.0, '', 'newsonglist'),
(4, '不标准情人', 'http://on4akwtwp.bkt.clouddn.com/new4.jpg', '水木年华', '十一月的萧邦', 0.0, '', 'newsonglist'),
(5, '好好爱个女孩', 'http://on4akwtwp.bkt.clouddn.com/new5.jpg', '张信哲', '叶惠美', 0.0, '', 'newsonglist'),
(6, 'SALUTE TO DEAR LESLIE', 'http://on4akwtwp.bkt.clouddn.com/new12.jpg', '古巨基', '回蔚', 21.3, '', 'newsonglist'),
(7, '一只小猪', 'http://on4akwtwp.bkt.clouddn.com/new7.jpg', '泳儿', '十一月的萧邦', 0.0, '', 'newsonglist'),
(8, '等', 'http://on4akwtwp.bkt.clouddn.com/new8.jpg', '严艺丹', '十一月的萧邦', 0.0, '', 'newsonglist'),
(9, '不标准情人', 'http://on4akwtwp.bkt.clouddn.com/new9.jpg', '水木年华', '叶惠美', 0.0, '', 'newsonglist'),
(10, '同在', 'http://on4akwtwp.bkt.clouddn.com/new10.jpg', '泳儿', '八度空间', 0.0, '', 'newsonglist'),
(11, '声呐', 'http://on4akwtwp.bkt.clouddn.com/new11.jpg', 'A-lin', '床边的故事', 16.7, '', 'newsonglist'),
(12, '世人笑我太疯癫', 'http://on4akwtwp.bkt.clouddn.com/new6.jpg', '王若琪', '床边的故事', 18.9, '', 'newsonglist');

-- --------------------------------------------------------

--
-- Table structure for table `songlibrary`
--

CREATE TABLE IF NOT EXISTS `songlibrary` (
  `songid` int(11) NOT NULL COMMENT '歌曲id',
  `src` text NOT NULL COMMENT '音乐路径',
  `songname` char(255) NOT NULL COMMENT '歌曲名字',
  `author` char(255) NOT NULL COMMENT '歌曲作者',
  `album` char(255) NOT NULL COMMENT '所属专辑',
  `albumcover` char(255) NOT NULL COMMENT '歌曲图片',
  `type` text NOT NULL COMMENT '歌曲分类'
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `songlibrary`
--

INSERT INTO `songlibrary` (`songid`, `src`, `songname`, `author`, `album`, `albumcover`, `type`) VALUES
(1, 'http://on3skkgj3.bkt.clouddn.com/Now_You_See_Me-%E5%91%A8%E6%9D%B0%E4%BC%A6.mp3', 'Now_You_See_Me', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(2, 'http://on3skkgj3.bkt.clouddn.com/%E4%B8%8D%E8%AF%A5%28With_aMEI%29-%E5%91%A8%E6%9D%B0%E4%BC%A6.mp3', '一点点', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(3, 'http://on3skkgj3.bkt.clouddn.com/%E4%B8%8D%E8%AF%A5%28With_aMEI%29-%E5%91%A8%E6%9D%B0%E4%BC%A6.mp3', '不该', '周杰伦', '床边故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(4, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%8A%E7%99%BD%E6%B0%94%E7%90%83.mp3', '告白气球', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(5, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%BA%8A%E8%BE%B9%E6%95%85%E4%BA%8B.mp3', '床边的故事', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(6, 'http://on3skkgj3.bkt.clouddn.com/%E8%8B%B1%E9%9B%84-%28%E6%B8%B8%E6%88%8F%E3%80%8A%E8%8B%B1%E9%9B%84%E8%81%94%E7%9B%9F%E3%80%8B%E4%B8%BB%E9%A2%98%E6%9B%B2%29-%E5%91%A8%E6%9D%B0%E4%BC%A6.mp3', '英雄', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(7, 'http://on3skkgj3.bkt.clouddn.com/%E8%AF%B4%E8%B5%B0%E5%B0%B1%E8%B5%B0.mp3', '说走就走', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(8, 'http://on3skkgj3.bkt.clouddn.com/%E7%88%B1%E6%83%85%E5%BA%9F%E6%9F%B4.mp3', '爱情废柴', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(9, 'http://on3skkgj3.bkt.clouddn.com/%E5%9C%9F%E8%80%B3%E5%85%B6%E5%86%B0%E6%B7%87%E6%B7%8B.mp3', '土耳其冰淇淋', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(10, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%89%8D%E4%B8%96%E6%83%85%E4%BA%BA.mp3', '前世情人', '周杰伦', '床边的故事', 'http://on48k4f79.bkt.clouddn.com/8718367adab44aed2aed88c9bb1c8701a18bfb7f.jpg', 'originallist'),
(13, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%88%86%E8%A3%82%EF%BC%88%E7%A6%BB%E5%BC%80%EF%BC%89.mp3', '分裂（离开）', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'originallist'),
(14, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%9B%9E%E5%88%B0%E8%BF%87%E5%8E%BB.mp3', '回到过去', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(15, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%81%AB%E8%BD%A6%E5%8F%A8%E4%BD%8D%E5%8E%BB.mp3', '火车叨位去', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(16, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%88%B7%E7%88%B7%E6%B3%A1%E7%9A%84%E8%8C%B6.mp3', '爷爷泡的茶', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(17, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E9%BE%99%E6%8B%B3.mp3', '龙拳', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(18, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%B1%B3%E5%85%B0%E7%9A%84%E5%B0%8F%E9%93%81%E5%8C%A0.mp3', '米兰的小铁匠', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(19, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%9A%97%E5%8F%B7.mp3', '暗号', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(20, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%9C%80%E5%90%8E%E7%9A%84%E6%88%98%E5%BD%B9.mp3', '最后的战役', '周杰伦', '八度空间', 'http://on48k4f79.bkt.clouddn.com/09fa513d269759ee1d4e45dbb1fb43166d22df87.jpg', 'newlist'),
(21, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%AE%89%E9%9D%99.mp3', '安静', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', 'newlist'),
(22, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%AF%B9%E4%B8%8D%E8%B5%B7.mp3', '对不起', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', 'newlist'),
(23, 'http://on40fijev.bkt.clouddn.com/Ludovico%20Einaudi%20-%20Le%20Onde.mp3', 'Ludovico Einaudi', 'Le Onde', '钢琴', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', 'newlist'),
(24, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%BF%8D%E8%80%85.mp3', '忍者', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', 'newlist'),
(25, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B8%8A%E6%B5%B7%E4%B8%80%E4%B9%9D%E5%9B%9B%E4%B8%89.mp3', '上海一九四三.', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', 'newlist'),
(26, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%8F%8C%E6%88%AA%E6%A3%8D.mp3', '双节棍', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', ''),
(27, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%AE%80%E5%8D%95%E7%88%B1.mp3', '简单爱', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', ''),
(28, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%A8%81%E5%BB%89%E5%8F%A4%E5%A0%A1.mp3', '威廉古堡', '周杰伦', '范特西', 'http://on48k4f79.bkt.clouddn.com/279759ee3d6d55fb247bddda6c224f4a21a4dd89.jpg', ''),
(29, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%83%8A%E5%8F%B9%E5%8F%B7.mp3', '惊叹号', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', ''),
(30, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%85%AC%E4%B8%BB%E7%97%85.mp3', '公主病', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', ''),
(31, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E8%BF%B7%E9%AD%82%E6%9B%B2.mp3', '迷魂曲', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', ''),
(32, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E8%B6%85%E8%B7%91%E5%A5%B3%E7%A5%9E.mp3', '超跑女神', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(33, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%BD%A0%E5%A5%BD%E5%90%97.mp3', '你好吗', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(34, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%90%B4%E4%BC%A4.mp3', '琴伤', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(35, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%B0%B4%E6%89%8B%E6%80%95%E6%B0%B4.mp3', '水手怕水', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(36, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B8%96%E7%95%8C%E6%9C%AA%E6%9C%AB%E6%97%A5.mp3', '世界末日', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(37, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%9A%AE%E5%BD%B1%E6%88%8F.mp3', '皮影戏', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(38, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%96%97%E4%BC%A4%E7%83%A7%E8%82%89%E7%B2%BD.mp3', '疗伤烧肉粽', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(39, 'http://on3skkgj3.bkt.clouddn.com/Mine%20Mine.mp3', 'Mine Mine', '周杰伦', '惊叹号', 'http://on48k4f79.bkt.clouddn.com/a2cc7cd98d1001e9c109a0ceba0e7bec54e7973e.jpg', 'poplist'),
(40, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%80%9F%E5%8F%A3.mp3', '借口', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', 'poplist'),
(41, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%90%81%E6%B5%85.mp3', '搁浅', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', 'poplist'),
(42, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B9%B1%E8%88%9E%E6%98%A5%E7%A7%8B.mp3', '乱舞春秋', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', 'poplist'),
(43, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%A4%96%E5%A9%86.mp3', '外婆', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', 'poplist'),
(44, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%9B%AD%E6%B8%B8%E4%BC%9A.mp3', '园游会', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', ''),
(45, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%88%91%E7%9A%84%E5%9C%B0%E7%9B%98.mp3', '我的地盘', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', ''),
(46, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%AD%A2%E6%88%98%E4%B9%8B%E6%AE%87.mp3', '止战之殇', '周杰伦', '七里香', 'http://on48k4f79.bkt.clouddn.com/T002R300x300M000000ibLEm3rEG2S.jpg', ''),
(47, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%8F%91%E5%A6%82%E9%9B%AA.mp3', '发如雪', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', ''),
(48, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%9E%AB.mp3', '枫', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', ''),
(49, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E8%93%9D%E8%89%B2%E9%A3%8E%E6%9A%B4.mp3', '蓝色风暴', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', ''),
(50, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E9%BB%91%E8%89%B2%E6%AF%9B%E8%A1%A3.mp3', '黑色毛衣', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', ''),
(51, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%B5%AA%E6%BC%AB%E6%89%8B%E6%9C%BA.mp3', '浪漫手机', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(52, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E9%BA%A6%E8%8A%BD%E7%B3%96.mp3', '麦芽糖', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(53, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E9%A3%98%E7%A7%BB.mp3', '飘移', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(54, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E9%80%86%E9%B3%9E.mp3', '逆鳞', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(55, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%9B%9B%E9%9D%A2%E6%A5%9A%E6%AD%8C.mp3', '四面楚歌', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(56, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%8F%8A%E7%91%9A%E6%B5%B7.mp3', '珊瑚海', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(58, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%A4%9C%E6%9B%B2.mp3', '夜曲', '周杰伦', '十一月的萧邦', 'http://on48k4f79.bkt.clouddn.com/d01373f082025aaf2f782f39faedab64024f1afd.jpg', 'hotlist'),
(59, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%88%B1%E6%83%85%E6%82%AC%E5%B4%96.mp3', '爱情悬崖', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(60, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B8%9C%E9%A3%8E%E7%A0%B4.mp3', '东风破', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(61, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%87%A6%E5%A4%AB.mp3', '懦夫', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(62, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%BD%A0%E5%90%AC%E5%BE%97%E5%88%B0.mp3', '你听得到', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(63, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B8%89%E5%B9%B4%E4%BA%8C%E7%8F%AD.mp3', '三年二班', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(64, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%99%B4%E5%A4%A9.mp3', '晴天', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'hotlist'),
(65, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%A5%B9%E7%9A%84%E7%9D%AB%E6%AF%9B.mp3', '她的睫毛', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'newlist'),
(66, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%8F%8C%E5%88%80.mp3', '双刀', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'newlist'),
(67, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E6%A2%AF%E7%94%B0.mp3', '梯田', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'newlist'),
(68, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%90%8C%E4%B8%80%E7%A7%8D%E8%B0%83%E8%B0%83.mp3', '同一种调调', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'poplist'),
(69, 'http://on3skkgj3.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%BB%A5%E7%88%B6%E4%B9%8B%E5%90%8D.mp3', '以父之名', '周杰伦', '叶惠美', 'http://on48k4f79.bkt.clouddn.com/023b5bb5c9ea15ce699421c8b3003af33b87b2fd.jpg', 'poplist'),
(70, 'http://on40fijev.bkt.clouddn.com/%E8%8E%AB%E6%96%87%E8%94%9A%20-%20%E5%AE%9D%E8%B4%9D.mp3', '宝贝', '莫文蔚', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/momo1.jpg', 'newlist'),
(71, 'http://on40fijev.bkt.clouddn.com/%E8%8E%AB%E6%96%87%E8%94%9A%20-%20%E7%9B%9B%E5%A4%8F%E7%9A%84%E6%9E%9C%E5%AE%9E.mp3', '外面的世界', '莫文蔚', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/momo1.jpg', 'poplist'),
(72, 'http://on40fijev.bkt.clouddn.com/%E6%9D%8E%E8%8D%A3%E6%B5%A9%E2%80%94%E5%BE%AE%E5%BE%AE.mp3', '微微', '李荣浩', '2016歌剧盛典', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'poplist'),
(73, 'http://on40fijev.bkt.clouddn.com/%E5%B0%8F%E5%B9%B8%E8%BF%90.mp3', '小幸运', 'JsonChen', '莫后年代', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'newlist'),
(74, 'http://on40fijev.bkt.clouddn.com/%E5%88%98%E6%98%8E%E6%B1%89%20-%20%E6%88%91%E4%B8%80%E7%9B%B4%E9%83%BD%E7%AB%99%E5%9C%A8%E8%BF%99%E9%87%8C%20%5Bmqms2%5D.mp3', '我一直都站在这里', '刘明汉', '', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'poplist'),
(75, 'http://on40fijev.bkt.clouddn.com/%E5%B0%8F%E5%B9%B8%E8%BF%90.mp3', '小幸运', 'JsonChen', '莫后年代', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'poplist'),
(76, 'http://on40fijev.bkt.clouddn.com/%E5%88%98%E6%98%8E%E6%B1%89%20-%20%E6%88%91%E4%B8%80%E7%9B%B4%E9%83%BD%E7%AB%99%E5%9C%A8%E8%BF%99%E9%87%8C%20%5Bmqms2%5D.mp3', '我一直都站在这里', '刘明汉', '', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'poplist'),
(77, 'http://on40fijev.bkt.clouddn.com/%E5%BC%A0%E5%9B%BD%E8%8D%A3%20-%20%E7%8E%BB%E7%92%83%E4%B9%8B%E6%83%85%20%5Bmqms2%5D.mp3', '月亮代表我的心', '张国荣', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/new3.jpg', 'poplist'),
(78, 'http://on40fijev.bkt.clouddn.com/%E8%8E%AB%E6%96%87%E8%94%9A%20-%20%E4%B8%8D%E6%95%A3%EF%BC%8C%E4%B8%8D%E8%A7%81.mp3', '不见不散', '莫文蔚', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/momo1.jpg', 'poplist'),
(79, 'http://on40fijev.bkt.clouddn.com/%E8%8E%AB%E6%96%87%E8%94%9A%20-%20%E4%B8%80%E5%88%87%E5%AE%89%E5%A5%BD.mp3', '一切安好', '莫文蔚', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/momo1.jpg', 'poplist'),
(80, 'http://on40fijev.bkt.clouddn.com/%E8%8E%AB%E6%96%87%E8%94%9A%20-%20%E7%9C%8B%E7%9C%8B%20%5Bmqms2%5D.mp3', '看看', '莫文蔚', '回蔚', 'http://on4akwtwp.bkt.clouddn.com/momo1.jpg', 'poplist'),
(81, 'http://on40fijev.bkt.clouddn.com/%E7%8E%8B%E8%8F%B2%20-%20%E5%BD%B1%E5%AD%90.mp3', '影子', '王菲', '情菲得意', 'http://on4akwtwp.bkt.clouddn.com/wangfei.jpg', 'poplist'),
(82, 'http://on40fijev.bkt.clouddn.com/%E7%8E%8B%E8%8F%B2%20-%20%E7%BA%A2%E8%B1%86.mp3', '红豆', '王菲', '情菲得意', 'http://on4akwtwp.bkt.clouddn.com/wangfei.jpg', 'poplist'),
(83, 'http://on40fijev.bkt.clouddn.com/%E7%8E%8B%E8%8F%B2%20-%20%E6%B5%AE%E8%BA%81.mp3', '浮躁', '王菲', '情菲得意', 'http://on4akwtwp.bkt.clouddn.com/wangfei.jpg', 'poplist');

-- --------------------------------------------------------

--
-- Table structure for table `songlist`
--

CREATE TABLE IF NOT EXISTS `songlist` (
  `id` int(11) NOT NULL,
  `listname` text NOT NULL,
  `listimg` text NOT NULL,
  `listsongs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='歌单列表';

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL,
  `username` text NOT NULL,
  `userpwd` text NOT NULL,
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  `age` int(11) NOT NULL,
  `sex` text NOT NULL,
  `level` int(11) NOT NULL,
  `userPic` text NOT NULL COMMENT '用户头像',
  `mylist` text NOT NULL COMMENT '创建的歌单'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `userpwd`, `nickname`, `age`, `sex`, `level`, `userPic`, `mylist`) VALUES
(1, '962672201@qq.com', 'cengjing', 'AinyTong', 19, '女', 666, '', '[{"listname":"回蔚","listCover": "http://on4akwtwp.bkt.clouddn.com/momo.jpg","listSongNum":" 12"\r\n    },\r\n    {"listname": "情菲得意", "listCover": "http://on4akwtwp.bkt.clouddn.com/wangfei.jpg","listSongNum": "10"\r\n    }\r\n]'),
(2, '18310633350', 'nihenhao', '一只特立独行的猫', 0, '', 0, '', '[{"listname":"莫后年代","listCover": "http://on4akwtwp.bkt.clouddn.com/new11.jpg","listSongNum":" 4"\r\n    },\r\n    {"listname": "编号89757", "listCover": "http://on4akwtwp.bkt.clouddn.com/m5.jpg","listSongNum": "5"\r\n    }\r\n]'),
(4, '123456', '123456', 'kitty', 0, '', 0, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songlibrary`
--
ALTER TABLE `songlibrary`
  ADD PRIMARY KEY (`songid`);

--
-- Indexes for table `songlist`
--
ALTER TABLE `songlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `songlibrary`
--
ALTER TABLE `songlibrary`
  MODIFY `songid` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `songlist`
--
ALTER TABLE `songlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
