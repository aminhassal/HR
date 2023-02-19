-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2023 at 06:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `AdminID_PK` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`AdminID_PK`, `userName`, `Email`, `password`) VALUES
(1, 'naziha', 'naziha@gmail.com', '199694');

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendence`
-- (See below for the actual view)
--
CREATE TABLE `attendence` (
`CourseiID` int(11)
,`ClassID_FK` int(11)
,`Name` varchar(30)
,`RecordStatus` varchar(50)
,`RecordTime` varchar(10)
,`RecordDate` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL,
  `SubjectID_FK` int(11) NOT NULL,
  `OpenDate` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `classname` varchar(30) DEFAULT NULL,
  `LectureName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `SubjectID_FK`, `OpenDate`, `IsActive`, `classname`, `LectureName`) VALUES
(12, 2, '2023-02-14 00:00:00', b'1', 'رياضة 1', '555'),
(37, 2, '2023-02-16 00:00:00', b'1', '11', '15'),
(39, 1, '2023-02-16 00:00:00', b'1', 'خريف انجليزي', 'أمين حصال'),
(40, 2, '2023-02-16 00:00:00', b'1', 'رياضة', 'سهيلة'),
(41, 1, '2023-02-17 00:00:00', b'1', 'فصل الخريف', 'خليفة');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseiID` int(11) NOT NULL,
  `ClassID_FK` int(11) NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `OpenDate` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseiID`, `ClassID_FK`, `CourseName`, `OpenDate`) VALUES
(21, 12, 'المحاضرة الاولى', '18-02-2023'),
(35, 41, 'الاولى', '03-03-2023'),
(36, 41, '', 'Array'),
(37, 41, '', '2023-02-17'),
(38, 41, '', '17-02-2023'),
(39, 12, '', '17-02-2023'),
(41, 12, '55', '19-02-2023'),
(42, 12, 'الثانية', '19-02-2023');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `DeviceID_PK` int(11) NOT NULL,
  `DeviceName` varchar(50) DEFAULT NULL,
  `DeviceTCP_IP` int(11) DEFAULT NULL,
  `DevicePort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `infostd`
--

CREATE TABLE `infostd` (
  `Uid` int(4) NOT NULL,
  `STD_id` int(4) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `InRollNumber` int(15) DEFAULT NULL,
  `Phone` int(12) DEFAULT NULL,
  `Password` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `infostd`
--

INSERT INTO `infostd` (`Uid`, `STD_id`, `Name`, `InRollNumber`, `Phone`, `Password`) VALUES
(1, 1, 'نزيهة', 181911, 92891, 0),
(2, 2, 'amin', 111, 91, 0),
(5, 5, 'عبدالسلام', 555, 5974, 0),
(6, 6, 'هدى', 1553, 918915632, 0),
(7, 7, 'محمد امين', 1533, 59741, 0),
(8, 8, 'كريم', 11233, 924951622, 0),
(10, 10, 'هادي', 159357, 1584793, 0),
(15, NULL, 'عمر', 1553, 924951622, 123456),
(16, NULL, 'أمين', 12233, 928912363, 1233456),
(17, NULL, 'الياس', 100253, 92584635, 1233456);

-- --------------------------------------------------------

--
-- Table structure for table `masterofcourse`
--

CREATE TABLE `masterofcourse` (
  `MasterOfCourseID_PK` int(11) NOT NULL,
  `StudentUID` int(11) NOT NULL,
  `RecordID_FK` int(11) NOT NULL,
  `CourseiID_FK` int(11) NOT NULL,
  `Attended` tinyint(1) DEFAULT NULL,
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `masterofcourse`
--

INSERT INTO `masterofcourse` (`MasterOfCourseID_PK`, `StudentUID`, `RecordID_FK`, `CourseiID_FK`, `Attended`, `ClassID`) VALUES
(118, 1, 55, 21, NULL, 12),
(119, 15, 72, 21, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `RecordID_PK` int(11) NOT NULL,
  `StudentUID` int(11) DEFAULT NULL,
  `RecordStatus` varchar(50) DEFAULT NULL,
  `RecordDate` varchar(10) DEFAULT NULL,
  `RecordTime` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`RecordID_PK`, `StudentUID`, `RecordStatus`, `RecordDate`, `RecordTime`) VALUES
(47, 1, 'Check In', '02-02-2023', '06-11-2022'),
(48, 1, 'Check In', '23:02:24', '06-11-2022'),
(49, 1, 'Check In', '23:02:33', '06-11-2022'),
(50, 1, 'Check In', '23:02:42', '06-11-2022'),
(51, 1, 'Check In', '23:02:48', '06-11-2022'),
(53, 1, 'Check In', '11:49:48', '08-11-2022'),
(54, 2, 'Check In', '18-02-2023', '18-02-2023'),
(55, 1, 'Check In', '18-02-2023', '18-02-2023'),
(56, 1, 'Check In', '11:57:42', '08-11-2022'),
(57, 2, 'Check In', '16:34:59', '08-11-2022'),
(58, 2, 'Check In', '20:24:33', '10-11-2022'),
(59, 1, 'Check In', '17:15:55', '08-12-2022'),
(60, 1, 'Check In', '17:16:13', '08-12-2022'),
(61, 1, 'Check In', '17:23:41', '08-12-2022'),
(62, 2, 'Check In', '17:26:27', '08-12-2022'),
(63, 1, 'Check In', '17:32:23', '08-12-2022'),
(64, 2, 'Check In', '17:32:26', '08-12-2022'),
(65, 1, 'Check In', '17:32:30', '08-12-2022'),
(66, 2, 'Check In', '17:32:32', '08-12-2022'),
(67, 1, 'Check In', '17:32:35', '08-12-2022'),
(68, 2, 'Check In', '17:32:36', '08-12-2022'),
(69, 1, 'Check In', '19:51:00', '11-12-2022'),
(70, 1, 'Check In', '19:51:23', '11-12-2022'),
(71, 1, 'Check In', '03-03-2023', '03-03-2023'),
(72, 15, 'Check In', '18-02-2023', '18-02-2023'),
(73, 2, 'Check In', '22:09:19', '31-01-2023'),
(74, 2, 'Check In', '22:10:24', '31-01-2023'),
(75, 1, 'Check In', '17:21:24', '01-02-2023'),
(76, 1, 'Check In', '17:23:21', '01-02-2023'),
(77, 2, 'Check In', '17:32:06', '01-02-2023'),
(78, 2, 'Check In', '17:32:08', '01-02-2023'),
(79, 2, 'Check In', '17:32:16', '01-02-2023'),
(80, 2, 'Check In', '17:32:45', '01-02-2023'),
(81, 2, 'Check In', '22:49:12', '01-02-2023'),
(84, 5, 'Check In', '11:12:32', '04-02-2023'),
(85, 6, 'Check In', '11:13:22', '04-02-2023'),
(86, 6, 'Check In', '11:13:29', '04-02-2023'),
(87, 7, 'Check In', '11:14:18', '04-02-2023'),
(88, 8, 'Check In', '12:23:14', '04-02-2023'),
(91, 10, 'Check In', '12:26:21', '04-02-2023'),
(93, 2, 'Check In', '20:53:35', '12-02-2023');

-- --------------------------------------------------------

--
-- Table structure for table `studentclass`
--

CREATE TABLE `studentclass` (
  `StudentClassID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `StdUid_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `studentclass`
--

INSERT INTO `studentclass` (`StudentClassID`, `ClassID`, `StdUid_FK`) VALUES
(30, 12, 1),
(37, 12, 15),
(36, 12, 17),
(31, 39, 1),
(32, 39, 2),
(19, 40, 7),
(35, 41, 17);

-- --------------------------------------------------------

--
-- Stand-in structure for view `students_record`
-- (See below for the actual view)
--
CREATE TABLE `students_record` (
`RecordID_PK` int(11)
,`ClassID` int(11)
,`StdUid_FK` int(11)
,`CourseiID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_in_class`
-- (See below for the actual view)
--
CREATE TABLE `student_in_class` (
`Uid` int(4)
,`Name` varchar(30)
,`InRollNumber` int(15)
,`ClassID` int(11)
,`StudentClassID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectID_PK` int(11) NOT NULL,
  `SubjectName` varchar(15) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID_PK`, `SubjectName`, `SubjectCode`) VALUES
(1, 'إنجليزي', '[ENG102]'),
(2, 'رياضة 1', 'math101');

-- --------------------------------------------------------

--
-- Structure for view `attendence`
--
DROP TABLE IF EXISTS `attendence`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendence`  AS SELECT `courses`.`CourseiID` AS `CourseiID`, `courses`.`ClassID_FK` AS `ClassID_FK`, `infostd`.`Name` AS `Name`, `records`.`RecordStatus` AS `RecordStatus`, `records`.`RecordTime` AS `RecordTime`, `records`.`RecordDate` AS `RecordDate` FROM (((`masterofcourse` join `infostd` on(`masterofcourse`.`StudentUID` = `infostd`.`Uid`)) join `records` on(`records`.`RecordID_PK` = `masterofcourse`.`RecordID_FK`)) left join `courses` on(`masterofcourse`.`CourseiID_FK` = `courses`.`CourseiID`))  ;

-- --------------------------------------------------------

--
-- Structure for view `students_record`
--
DROP TABLE IF EXISTS `students_record`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `students_record`  AS SELECT `records`.`RecordID_PK` AS `RecordID_PK`, `studentclass`.`ClassID` AS `ClassID`, `studentclass`.`StdUid_FK` AS `StdUid_FK`, `courses`.`CourseiID` AS `CourseiID` FROM ((`studentclass` join `records` on(`studentclass`.`StdUid_FK` = `records`.`StudentUID`)) join `courses` on(`studentclass`.`ClassID` = `courses`.`ClassID_FK` and `records`.`RecordDate` = `courses`.`OpenDate`))  ;

-- --------------------------------------------------------

--
-- Structure for view `student_in_class`
--
DROP TABLE IF EXISTS `student_in_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_in_class`  AS SELECT `infostd`.`Uid` AS `Uid`, `infostd`.`Name` AS `Name`, `infostd`.`InRollNumber` AS `InRollNumber`, `studentclass`.`ClassID` AS `ClassID`, `studentclass`.`StudentClassID` AS `StudentClassID` FROM (((`class` join `subjects` on(`class`.`SubjectID_FK` = `subjects`.`SubjectID_PK`)) join `studentclass` on(`class`.`ClassID` = `studentclass`.`ClassID`)) join `infostd` on(`studentclass`.`StdUid_FK` = `infostd`.`Uid`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`AdminID_PK`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `SubjectID_FK` (`SubjectID_FK`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseiID`),
  ADD KEY `CorseTOclass` (`ClassID_FK`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`DeviceID_PK`);

--
-- Indexes for table `infostd`
--
ALTER TABLE `infostd`
  ADD PRIMARY KEY (`Uid`);

--
-- Indexes for table `masterofcourse`
--
ALTER TABLE `masterofcourse`
  ADD PRIMARY KEY (`MasterOfCourseID_PK`),
  ADD UNIQUE KEY `StudentUID_2` (`StudentUID`,`CourseiID_FK`),
  ADD KEY `StudentUID` (`StudentUID`),
  ADD KEY `RecordID_FK` (`RecordID_FK`),
  ADD KEY `CourseiID_FK` (`CourseiID_FK`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`RecordID_PK`),
  ADD KEY `StudentUID` (`StudentUID`);

--
-- Indexes for table `studentclass`
--
ALTER TABLE `studentclass`
  ADD PRIMARY KEY (`StudentClassID`),
  ADD UNIQUE KEY `ClassID` (`ClassID`,`StdUid_FK`),
  ADD KEY `STDclassStudents` (`StdUid_FK`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectID_PK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `AdminID_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `DeviceID_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `infostd`
--
ALTER TABLE `infostd`
  MODIFY `Uid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `masterofcourse`
--
ALTER TABLE `masterofcourse`
  MODIFY `MasterOfCourseID_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `RecordID_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `studentclass`
--
ALTER TABLE `studentclass`
  MODIFY `StudentClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SubjectID_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `ClassTOSubject` FOREIGN KEY (`SubjectID_FK`) REFERENCES `subjects` (`SubjectID_PK`) ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `CorseTOclass` FOREIGN KEY (`ClassID_FK`) REFERENCES `class` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `masterofcourse`
--
ALTER TABLE `masterofcourse`
  ADD CONSTRAINT `Course_To_master` FOREIGN KEY (`CourseiID_FK`) REFERENCES `courses` (`CourseiID`),
  ADD CONSTRAINT `RecordToMasterOfCourse` FOREIGN KEY (`RecordID_FK`) REFERENCES `records` (`RecordID_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Std_To_Master` FOREIGN KEY (`StudentUID`) REFERENCES `infostd` (`Uid`);

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `InfoSTDtoRecord` FOREIGN KEY (`StudentUID`) REFERENCES `infostd` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentclass`
--
ALTER TABLE `studentclass`
  ADD CONSTRAINT `STDclassClasses` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `STDclassStudents` FOREIGN KEY (`StdUid_FK`) REFERENCES `infostd` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
