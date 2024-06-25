-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2024 at 06:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `home`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `emailAddress` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Alice', 'Brown', 'alice@example.com', '$2y$10$ojJyplbthMuNkztQQRqmJOT3n7sCltl/U5FadUBl2uGs7w2qL7A5i'),
(2, 'Bob', 'White', 'bob@example.com', 'password'),
(3, 'Carol', 'Green', 'carol@example.com', 'password'),
(4, 'Carolyn', 'Browning', 'harat@mailinator.com', 'Pa$$w0rd!'),
(5, 'aaaaaaaaaa', 'Browning', 'harat@mailinator.com', 'aaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `designcategory`
--

CREATE TABLE `designcategory` (
  `id` int NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designcategory`
--

INSERT INTO `designcategory` (`id`, `category`) VALUES
(1, 'Modern'),
(2, 'Country'),
(3, 'Coastal');

-- --------------------------------------------------------

--
-- Table structure for table `designconsultation`
--

CREATE TABLE `designconsultation` (
  `id` int NOT NULL,
  `requestID` int NOT NULL,
  `consultation` text COLLATE utf8mb4_general_ci NOT NULL,
  `consultationImgFileName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designconsultation`
--

INSERT INTO `designconsultation` (`id`, `requestID`, `consultation`, `consultationImgFileName`) VALUES
(1, 1, 'Consultation details for request 1', 'consultation1.jpg'),
(2, 2, 'Consultation details for request 2', 'consultation2.jpg'),
(3, 3, 'Consultation details for request 3', 'consultation3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `designconsultationrequest`
--

CREATE TABLE `designconsultationrequest` (
  `id` int NOT NULL,
  `ClientID` int NOT NULL,
  `designerID` int NOT NULL,
  `roomTypeID` int NOT NULL,
  `designCategoryID` int NOT NULL,
  `roomWidth` decimal(10,2) NOT NULL,
  `roomLength` decimal(10,2) NOT NULL,
  `colorPreferences` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `statusID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designconsultationrequest`
--

INSERT INTO `designconsultationrequest` (`id`, `ClientID`, `designerID`, `roomTypeID`, `designCategoryID`, `roomWidth`, `roomLength`, `colorPreferences`, `date`, `statusID`) VALUES
(1, 1, 1, 1, 1, 4.50, 5.50, 'Beige', '2024-09-02', 1),
(2, 2, 2, 2, 2, 6.20, 4.80, 'Blue', '2024-09-03', 1),
(3, 3, 3, 3, 3, 3.90, 7.10, 'Green', '2024-09-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designer`
--

CREATE TABLE `designer` (
  `id` int NOT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `emailAddress` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `brandName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `logoImgFileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designer`
--

INSERT INTO `designer` (`id`, `firstName`, `lastName`, `emailAddress`, `password`, `brandName`, `logoImgFileName`) VALUES
(1, 'John', 'Doe', 'john@example.com', '$2y$10$8ZlYr17hHaYXo1yW99WbL.BhYvMBlyWL7DiIqnnUhvIu3vHFehFty', 'JD Designs', 'img/logo1.png'),
(2, 'Jane', 'Smith', 'jane@example.com', '$2y$10$k0drVwkoLz9K0VFhYec./.Z2JwIgCQ7zE900GS3dYBTSuvdqtN1BO', 'JS Interiors', 'img/logo2.png'),
(3, 'Michael', 'Johnson', 'michael@example.com', '$2y$10$2LP.s5jPVzat85FGwvRw9.OIpU2E3Hp/gP/NK8/iuiClXMqD2EteW', 'MJ Studios', 'img/logo3.png'),
(4, 'Michael', 'Johnson', 'a@a.com', 'ahmed123', 'MJ Studios', 'img/logo3.png'),
(5, 'ss', 'sss', 'ahmed415059@fci.bu.edu.eggg', 'p65tZRTLtZeF@YR', 'sssss', 'Screenshot 2024-04-17 172822.png'),
(6, 'aaaaaaa', 'aaaaaaa', 'ahmed415059@fci.bu.edu.eggg', 'p65tZRTLtZeF@YR', 'aaa', 'Screenshot 2024-04-17 172822.png');

-- --------------------------------------------------------

--
-- Table structure for table `designerspeciality`
--

CREATE TABLE `designerspeciality` (
  `designerID` int NOT NULL,
  `designCategoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designerspeciality`
--

INSERT INTO `designerspeciality` (`designerID`, `designCategoryID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `designportfolioproject`
--

CREATE TABLE `designportfolioproject` (
  `id` int NOT NULL,
  `designerID` int NOT NULL,
  `projectName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `projectImgFileName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `designCategoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designportfolioproject`
--

INSERT INTO `designportfolioproject` (`id`, `designerID`, `projectName`, `projectImgFileName`, `description`, `designCategoryID`) VALUES
(1, 1, 'Living Room Redesign', 'project1.jpg', 'Description for project 1', 1),
(2, 2, 'Bedroom Renovation', 'project2.jpg', 'Description for project 2', 2),
(3, 3, 'Kitchen Makeover', 'project3.jpg', 'Description for project 3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `requeststatus`
--

CREATE TABLE `requeststatus` (
  `id` int NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requeststatus`
--

INSERT INTO `requeststatus` (`id`, `status`) VALUES
(1, 'Pending Consultation'),
(2, 'Consultation Declined'),
(3, 'Consultation Provided');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `id` int NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `type`) VALUES
(1, 'Living Room'),
(2, 'Bedroom'),
(3, 'Kitchen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designcategory`
--
ALTER TABLE `designcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designconsultation`
--
ALTER TABLE `designconsultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requestID` (`requestID`);

--
-- Indexes for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `designerID` (`designerID`),
  ADD KEY `designCategoryID` (`designCategoryID`),
  ADD KEY `statusID` (`statusID`),
  ADD KEY `roomTypeID` (`roomTypeID`);

--
-- Indexes for table `designer`
--
ALTER TABLE `designer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designerspeciality`
--
ALTER TABLE `designerspeciality`
  ADD KEY `designerID` (`designerID`),
  ADD KEY `designCategoryID` (`designCategoryID`);

--
-- Indexes for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designerID` (`designerID`),
  ADD KEY `designCategoryID` (`designCategoryID`);

--
-- Indexes for table `requeststatus`
--
ALTER TABLE `requeststatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `designcategory`
--
ALTER TABLE `designcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designconsultation`
--
ALTER TABLE `designconsultation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designer`
--
ALTER TABLE `designer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requeststatus`
--
ALTER TABLE `requeststatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `designconsultation`
--
ALTER TABLE `designconsultation`
  ADD CONSTRAINT `designconsultation_ibfk_1` FOREIGN KEY (`requestID`) REFERENCES `designconsultationrequest` (`id`);

--
-- Constraints for table `designconsultationrequest`
--
ALTER TABLE `designconsultationrequest`
  ADD CONSTRAINT `designconsultationrequest_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_2` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_3` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_4` FOREIGN KEY (`statusID`) REFERENCES `requeststatus` (`id`),
  ADD CONSTRAINT `designconsultationrequest_ibfk_5` FOREIGN KEY (`roomTypeID`) REFERENCES `roomtype` (`id`);

--
-- Constraints for table `designerspeciality`
--
ALTER TABLE `designerspeciality`
  ADD CONSTRAINT `designerspeciality_ibfk_1` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`),
  ADD CONSTRAINT `designerspeciality_ibfk_2` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`);

--
-- Constraints for table `designportfolioproject`
--
ALTER TABLE `designportfolioproject`
  ADD CONSTRAINT `designportfolioproject_ibfk_1` FOREIGN KEY (`designerID`) REFERENCES `designer` (`id`),
  ADD CONSTRAINT `designportfolioproject_ibfk_2` FOREIGN KEY (`designCategoryID`) REFERENCES `designcategory` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
