-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-10-04 18:20:26
-- 伺服器版本： 10.4.20-MariaDB
-- PHP 版本： 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `att`
--

-- --------------------------------------------------------

--
-- 資料表結構 `attendancerecord`
--

CREATE TABLE `attendancerecord` (
  `recordId` varchar(15) NOT NULL,
  `userId` varchar(15) NOT NULL,
  `statusId` varchar(15) NOT NULL,
  `statusName` varchar(255) NOT NULL,
  `recordDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `status`
--

CREATE TABLE `status` (
  `statusId` varchar(15) NOT NULL,
  `statusName` varchar(255) NOT NULL,
  `statusDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `status`
--

INSERT INTO `status` (`statusId`, `statusName`, `statusDescription`) VALUES
('1', 'Present', 'Student present on or before 8:00am'),
('2', 'Late', 'Students arrived at the classroom after 8:00am'),
('3', 'Early leave', 'Students leave school before the end of the school day'),
('4', 'Sick Leave', 'Students are required to give a phone call to the school. The school admin will help to mark the Sick\r\nLeave record. The student must upload a sick leave certificate, and Class teachers’ endorsement is\r\nneeded afterward.'),
('5', 'Absent without reason', 'Absent without reason');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `userId` varchar(15) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userPw` varchar(255) NOT NULL,
  `userTypeId` int(15) NOT NULL,
  `userType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`userId`, `userName`, `userPw`, `userTypeId`, `userType`) VALUES
('1', 'Chung Hiu Chun', '123', 2, 'Student'),
('2', 'SunYuenTung', '123', 1, 'Teacher'),
('3', 'JJ Jai', 'JJ', 3, 'Admin');

-- --------------------------------------------------------

--
-- 資料表結構 `usertype`
--

CREATE TABLE `usertype` (
  `userTypeId` int(15) NOT NULL,
  `userType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `usertype`
--

INSERT INTO `usertype` (`userTypeId`, `userType`) VALUES
(1, 'Teacher'),
(2, 'Student'),
(3, 'Admin');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `attendancerecord`
--
ALTER TABLE `attendancerecord`
  ADD PRIMARY KEY (`recordId`),
  ADD KEY `userId_fk` (`userId`),
  ADD KEY `statusId_fk` (`statusId`);

--
-- 資料表索引 `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusId`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `userTypeId_fk` (`userTypeId`);

--
-- 資料表索引 `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`userTypeId`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `attendancerecord`
--
ALTER TABLE `attendancerecord`
  ADD CONSTRAINT `statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`),
  ADD CONSTRAINT `userId_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 資料表的限制式 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `userTypeId_fk` FOREIGN KEY (`userTypeId`) REFERENCES `usertype` (`userTypeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
