-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jun 30, 2024 at 01:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `id` int(11) NOT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`id`, `courseName`, `department`, `created_date`) VALUES
(1, 'English', 'English', '2024-06-30 05:19:42'),
(2, 'Science', 'Science', '2024-06-30 05:19:42'),
(3, 'Computer Science', 'Computer Science', '2024-06-30 05:20:17'),
(4, 'History', 'History', '2024-06-30 05:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parent`
--

CREATE TABLE `tbl_parent` (
  `id` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_parent`
--

INSERT INTO `tbl_parent` (`id`, `name`, `email`, `created_date`) VALUES
(1, 'John', 'john@gmail.com', '2024-06-30 05:16:48'),
(2, 'tom', 'tom2@gmail.com', '2024-06-30 05:16:48'),
(3, 'joy', 'joy@gmail.com', '2024-06-30 05:17:46'),
(4, 'adam', 'adam@gmail.com', '2024-06-30 05:17:46'),
(5, 'dennis', 'dennis@gmail.com', '2024-06-30 05:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`id`, `name`, `parent_id`, `gender`, `created_date`) VALUES
(1, 'Anju', 1, 'F', '2024-06-30 05:22:35'),
(2, 'Alex', 3, 'M', '2024-06-30 05:22:54'),
(3, 'Rols', 1, 'M', '2024-06-30 05:22:35'),
(4, 'david', 2, 'M', '2024-06-30 06:13:22'),
(5, 'Abi', 2, 'M', '2024-06-30 05:24:26'),
(6, 'Jinu', 4, 'F', '2024-06-30 05:24:26'),
(7, 'Aju', 3, 'M', '2024-06-30 05:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_opted_course`
--

CREATE TABLE `tbl_student_opted_course` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student_opted_course`
--

INSERT INTO `tbl_student_opted_course` (`id`, `student_id`, `course_id`, `is_active`, `created_date`) VALUES
(1, 7, 1, 1, '2024-06-30 08:10:09'),
(2, 2, 4, 1, '2024-06-30 05:27:36'),
(3, 4, 2, 1, '2024-06-30 09:55:54'),
(4, 2, 4, 1, '2024-06-30 09:55:07'),
(5, 5, 2, 1, '2024-06-30 10:54:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `tbl_student_opted_course`
--
ALTER TABLE `tbl_student_opted_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_student_opted_course`
--
ALTER TABLE `tbl_student_opted_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tbl_parent` (`id`);

--
-- Constraints for table `tbl_student_opted_course`
--
ALTER TABLE `tbl_student_opted_course`
  ADD CONSTRAINT `tbl_student_opted_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`id`),
  ADD CONSTRAINT `tbl_student_opted_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
