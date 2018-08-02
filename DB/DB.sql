-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 02 أغسطس 2018 الساعة 17:01
-- إصدار الخادم: 5.6.39
-- PHP Version: 7.1.14

--
-- Database: 
--

-- --------------------------------------------------------

--
-- بنية الجدول `medical_rec`
--

CREATE TABLE `medical_rec` (
  `MRID` int(50) NOT NULL,
  `QRID` varchar(100) NOT NULL,
  `UID` int(50) NOT NULL,
  `OID` int(50) NOT NULL,
  `UPDATEDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MRTYPE` varchar(100) NOT NULL,
  `MRVALUE` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- بنية الجدول `notes`
--

CREATE TABLE `notes` (
  `NID` int(50) NOT NULL,
  `QRID` varchar(100) NOT NULL,
  `UID` int(50) NOT NULL,
  `OID` int(50) NOT NULL,
  `UPDATEDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TYPEN` varchar(100) NOT NULL,
  `TXTNOTE` varchar(500) NOT NULL,
  `LOC` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `offices`
--

CREATE TABLE `offices` (
  `OID` int(50) NOT NULL,
  `LIC_NUM` varchar(100) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `ADDRESS` varchar(300) NOT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `MOBILE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- بنية الجدول `pilgrims`
--

CREATE TABLE `pilgrims` (
  `PID` int(50) NOT NULL,
  `QRID` varchar(200) NOT NULL,
  `OID` int(50) NOT NULL,
  `PASSPORTID` varchar(100) NOT NULL,
  `FULLNAME` varchar(200) NOT NULL,
  `NATIONALITY` varchar(100) NOT NULL,
  `BLOOD` varchar(20) NOT NULL,
  `ADDRESS` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- بنية الجدول `types`
--

CREATE TABLE `types` (
  `TYPEN` int(100) NOT NULL,
  `TYPEV` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `types`
--

INSERT INTO `types` (`TYPEN`, `TYPEV`) VALUES
(1, 'ضائع أو تائه'),
(2, 'مصاب'),
(3, 'أسعف'),
(4, 'تلقى العلاج وغادر'),
(5, 'ميت'),
(6, 'مفقودات وجدت'),
(7, 'أخرى');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `UID` int(50) NOT NULL,
  `TYPE` int(2) NOT NULL,
  `OID` int(50) NOT NULL,
  `USER` varchar(100) NOT NULL,
  `PWD` varchar(150) NOT NULL,
  `FULLNAME` varchar(200) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `MOBILE` varchar(100) DEFAULT NULL,
  `ACTIVE` int(2) NOT NULL DEFAULT '1',
  `NOTE` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `medical_rec`
--
ALTER TABLE `medical_rec`
  ADD PRIMARY KEY (`MRID`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`NID`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`OID`);

--
-- Indexes for table `pilgrims`
--
ALTER TABLE `pilgrims`
  ADD PRIMARY KEY (`PID`),
  ADD UNIQUE KEY `QRID` (`QRID`),
  ADD UNIQUE KEY `PASSPORTID` (`PASSPORTID`),
  ADD UNIQUE KEY `QRID_2` (`QRID`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`TYPEN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`);

  
  
  
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medical_rec`
--
ALTER TABLE `medical_rec`
  MODIFY `MRID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `NID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `OID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pilgrims`
--
ALTER TABLE `pilgrims`
  MODIFY `PID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `TYPEN` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

