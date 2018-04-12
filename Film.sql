-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018 年 04 月 12 日 08:14
-- 伺服器版本: 10.1.26-MariaDB
-- PHP 版本： 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `Film`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Cinemas`
--

CREATE TABLE `Cinemas` (
  `CID` int(11) NOT NULL,
  `C_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `District`
--

CREATE TABLE `District` (
  `D_Code` int(11) NOT NULL,
  `D_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Movie`
--

CREATE TABLE `Movie` (
  `MID` int(11) NOT NULL,
  `M_Name` varchar(50) NOT NULL,
  `MRWID` int(11) NOT NULL,
  `M_Score` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Movie Review Website`
--

CREATE TABLE `Movie Review Website` (
  `MRWID` int(11) NOT NULL,
  `MRW` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Production House`
--

CREATE TABLE `Production House` (
  `PID` int(11) NOT NULL,
  `P_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `Sale`
--

CREATE TABLE `Sale` (
  `MID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL,
  `Total Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `ShowTimeDate`
--

CREATE TABLE `ShowTimeDate` (
  `ShowID` int(11) NOT NULL,
  `Show Date` date NOT NULL,
  `Start Time` time NOT NULL,
  `End Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `Cinemas`
--
ALTER TABLE `Cinemas`
  ADD PRIMARY KEY (`CID`);

--
-- 資料表索引 `District`
--
ALTER TABLE `District`
  ADD PRIMARY KEY (`D_Code`);

--
-- 資料表索引 `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`MID`,`MRWID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `MRWID` (`MRWID`);

--
-- 資料表索引 `Movie Review Website`
--
ALTER TABLE `Movie Review Website`
  ADD PRIMARY KEY (`MRWID`);

--
-- 資料表索引 `Production House`
--
ALTER TABLE `Production House`
  ADD PRIMARY KEY (`PID`);

--
-- 資料表索引 `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`MID`,`CID`,`ShowID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `ShowID` (`ShowID`);

--
-- 資料表索引 `ShowTimeDate`
--
ALTER TABLE `ShowTimeDate`
  ADD PRIMARY KEY (`ShowID`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `Movie_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `Production House` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Movie_ibfk_2` FOREIGN KEY (`MRWID`) REFERENCES `Movie Review Website` (`MRWID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `Movie Review Website`
--
ALTER TABLE `Movie Review Website`
  ADD CONSTRAINT `Movie Review Website_ibfk_1` FOREIGN KEY (`MRWID`) REFERENCES `Movie` (`MRWID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Cinemas` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`MID`) REFERENCES `Movie` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_ibfk_3` FOREIGN KEY (`ShowID`) REFERENCES `ShowTimeDate` (`ShowID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
