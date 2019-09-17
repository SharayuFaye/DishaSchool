-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2019 at 05:37 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `activity` varchar(50) NOT NULL,
  `details` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `submission_date` date NOT NULL,
  `sections_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `teachers_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `backgrounds`
--

CREATE TABLE `backgrounds` (
  `id` int(11) NOT NULL,
  `wallpaper` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `page-name` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backgrounds`
--

INSERT INTO `backgrounds` (`id`, `wallpaper`, `date`, `page-name`, `school_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(1, 'download2.jpeg', '2019-08-12', '', 3, NULL, NULL, 1, '2019-08-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `bus_number` varchar(110) NOT NULL,
  `route_id` int(11) NOT NULL,
  `student_strength` int(11) NOT NULL,
  `drivers_id` varchar(110) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `bus_number`, `route_id`, `student_strength`, `drivers_id`, `school_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(6, 'mh12313213', 15, 23, '1,6', 3, NULL, NULL, NULL, NULL, 1),
(25, 'mh4344', 18, 232, '5,1', 3, NULL, NULL, NULL, NULL, 1),
(26, 'mh1111', 15, 11, '1,5,6', 3, NULL, NULL, 34, '2019-08-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `drivers_name` varchar(50) NOT NULL,
  `drivers_address` varchar(250) NOT NULL,
  `drivers_mobile` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `users_id`, `drivers_name`, `drivers_address`, `drivers_mobile`, `join_date`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(1, 37, 'Ashutosh verma', 'Higna', 2147483647, '2019-07-03', NULL, NULL, 34, '2019-08-24', 1),
(5, 47, 'abc', 'abc', 2312321, '2019-08-16', NULL, NULL, 34, '2019-08-24', 1),
(6, 48, 'd1', 'd1', 2147483647, '2019-08-16', NULL, NULL, 34, '2019-08-24', 1),
(7, 84, 'd12', '12', 12, '2007-01-19', 34, '2019-08-24', NULL, NULL, 1),
(8, 85, 'd11', '11', 11, '2007-01-19', 34, '2019-08-24', NULL, NULL, 1),
(9, 86, 'd33', '11', 11, '2007-01-19', 34, '2019-08-24', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `subject` varchar(50) NOT NULL,
  `exam_type_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `class_id`, `sections_id`, `date`, `time`, `subject`, `exam_type_id`, `school_id`) VALUES
(1, 1, 1, '2019-07-01', '01:07:00', 'Math', 1, 3),
(4, 1, 12, '2019-08-09', '22:02:00', 'Hindi', 2, 3),
(5, 1, 2, '2019-08-10', '03:12:00', 'English', 1, 3),
(7, 1, 2, '2019-08-14', '03:23:00', 'English', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

CREATE TABLE `exam_type` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_type`
--

INSERT INTO `exam_type` (`id`, `type`, `school_id`) VALUES
(1, 'unit 1', 3),
(2, 'unit 2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `questions` varchar(250) NOT NULL,
  `answers` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `school_id`, `questions`, `answers`, `date`) VALUES
(2, 3, 'Does learning happen outside the classroom? ', 'What percentage of the school week is typically spent in the classroom and what percentage in labs and sports?  Do children go on field trips or visits to local museums?  Do they meet achievers in various fields?  Making real world connections to what children learn inside the classrooms are becoming very important.  Classrooms are the most artificial of places in the real world.  Many schools have started designing programs to ensure children see the purpose of their learning, by being exposed to the real world.', '2019-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `fees_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `annual_fees` int(11) NOT NULL,
  `total_fees` int(11) NOT NULL,
  `type_payment` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(50) NOT NULL,
  `details` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `submission_date` date NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_page_menu`
--

CREATE TABLE `home_page_menu` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(250) NOT NULL,
  `page_name` varchar(250) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_page_menu`
--

INSERT INTO `home_page_menu` (`id`, `menu_name`, `page_name`, `school_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(1, 'Notify', 'Notication', 4, NULL, NULL, NULL, NULL, 1),
(2, 'Fees', 'Fees', 4, NULL, NULL, 1, '2019-08-14', 1),
(3, 'Fees', 'Fees', 3, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `marks` int(11) NOT NULL,
  `out_of` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `competence` varchar(50) NOT NULL,
  `school_id` int(11) NOT NULL,
  `exam_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `roles_id` varchar(110) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `message` varchar(250) NOT NULL,
  `datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `roles_id`, `class_id`, `sections_id`, `school_id`, `message`, `datetime`) VALUES
(2, 'Section', 1, 1, 3, 'Section test', '2019-07-19'),
(3, 'Section', 2, 1, 3, '', '0000-00-00'),
(4, 'Section', 2, 1, 3, '', '0000-00-00'),
(5, 'Student', 0, 0, 3, '2112', '2019-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point`
--

CREATE TABLE `pickup_point` (
  `id` int(11) NOT NULL,
  `pickup_point` varchar(255) NOT NULL,
  `longitude` varchar(110) NOT NULL,
  `lattitude` varchar(110) NOT NULL,
  `school_id` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickup_point`
--

INSERT INTO `pickup_point` (`id`, `pickup_point`, `longitude`, `lattitude`, `school_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(3, 'erwr', '342.67', '4332.12', '3', NULL, NULL, 34, '2019-08-24', 1),
(4, 'khamla', '345324.51111', '34535.711111', '3', NULL, NULL, NULL, NULL, 1),
(6, 'Khamla Sq', '234234.324', '345.76', '3', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(55) NOT NULL,
  `menu_allowed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `menu_allowed`) VALUES
(1, 'admin', ''),
(2, 'School Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `pickup_point_id` varchar(110) DEFAULT NULL,
  `route_name` varchar(100) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `pickup_point_id`, `route_name`, `school_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(15, '4,3', 'AAAA', 3, NULL, NULL, 34, '2019-08-24', 1),
(18, '4,3,6', 'XYZ', 3, NULL, NULL, 34, '2019-08-24', 1),
(20, '3,3', 'bbb', 3, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `school_name` varchar(250) NOT NULL,
  `school_address` varchar(250) NOT NULL,
  `school_mobile` int(11) NOT NULL,
  `school_mobile2` int(11) NOT NULL,
  `school_logo` varchar(255) NOT NULL,
  `school_mail` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `school_name`, `school_address`, `school_mobile`, `school_mobile2`, `school_logo`, `school_mail`, `date`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active`) VALUES
(3, 'Disha', 'aa a a a,aaa', 2147483647, 2147483641, 'Screenshot_from_2019-06-12_11-46-404.png', 'aa@a.com', '2019-06-21', NULL, NULL, NULL, NULL, 1),
(4, 'NK', 'NK', 23123, 2131232111, 'download1.jpeg', 'nk@nk.com', '2019-06-15', NULL, NULL, NULL, NULL, 1),
(5, 'my school', 'hj dbjsdhjas', 1122112211, 2147483647, 'download10.jpeg', 'aaaaaa@aaaa.com', '2019-08-03', '2019-08-14', 1, '2019-08-14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections` varchar(50) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `student_name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `adhar` varchar(110) NOT NULL,
  `profile` varchar(110) NOT NULL,
  `parent_name` varchar(50) NOT NULL,
  `parent_mob` int(11) NOT NULL,
  `mother_name` varchar(110) NOT NULL,
  `mother_mail` varchar(110) DEFAULT NULL,
  `mother_mob` int(11) NOT NULL,
  `parent_scan_id` varchar(11) NOT NULL,
  `roll_number` int(11) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `teachers_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL,
  `bus_id` varchar(200) NOT NULL,
  `transportation_id` varchar(200) DEFAULT NULL,
  `join_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subject` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_address` varchar(250) NOT NULL,
  `teacher_mobile` int(11) NOT NULL,
  `teacher_mail` varchar(50) NOT NULL,
  `salary_details` int(11) NOT NULL,
  `education_details` varchar(250) NOT NULL,
  `class` varchar(50) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `school_id` varchar(20) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `class_id` varchar(50) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `subject` varchar(110) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transportation`
--

CREATE TABLE `transportation` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `pickup_point` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `role` varchar(50) NOT NULL,
  `school_id` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `gcm_id` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date`, `role`, `school_id`, `token`, `gcm_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active`) VALUES
(1, 'admin', 'admin', '2019-06-20', 'admin', 0, '79800_2019/08/19-12:08:33', '', NULL, NULL, NULL, NULL, 1),
(34, 'disha', 'disha', '0000-00-00', 'school_admin', 3, '', '', NULL, NULL, NULL, NULL, 1),
(35, 'nk', 'nk', '0000-00-00', 'school_admin', 4, '', '', NULL, NULL, 1, '2019-08-14', 1),
(37, 'ashutosh', 'ashutosh', '0000-00-00', 'driver', 3, '', '', NULL, NULL, 34, '2019-08-24', 1),
(43, 'aaa', 'aaa', '0000-00-00', 'driver', 3, '', '', NULL, NULL, NULL, NULL, 1),
(44, 'aa', 'aa', '0000-00-00', 'driver', 3, '', '', NULL, NULL, NULL, NULL, 1),
(45, 'rr', 'rr', '0000-00-00', 'driver', 3, '', '', NULL, NULL, NULL, NULL, 1),
(46, 'tt', 'tt', '0000-00-00', 'driver', 3, '', '', NULL, NULL, NULL, NULL, 1),
(47, 'abc', 'abc', '0000-00-00', 'driver', 3, '', '', NULL, NULL, 34, '2019-08-24', 1),
(48, 'd1', 'd1', '0000-00-00', 'driver', 3, '', '', NULL, NULL, 34, '2019-08-24', 1),
(84, 'd12', 'd12', '0000-00-00', 'driver', 3, '', '', 34, '2019-08-24', NULL, NULL, 1),
(85, 'd11', 'd11', '0000-00-00', 'driver', 3, '', '', 34, '2019-08-24', NULL, NULL, 1),
(86, '33', '33', '0000-00-00', 'driver', 3, '', '', 34, '2019-08-24', NULL, NULL, 1),
(87, 'qq', 'qq', '0000-00-00', 'driver', 3, '', '', 34, '2019-08-24', 34, '2019-08-24', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_id` (`sections_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`,`sections_id`),
  ADD KEY `sections_id` (`sections_id`),
  ADD KEY `students_id` (`students_id`),
  ADD KEY `teachers_id` (`teachers_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `backgrounds`
--
ALTER TABLE `backgrounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bus_number` (`bus_number`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_details_id` (`students_id`),
  ADD KEY `students_id` (`students_id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`,`students_id`,`teacher_id`),
  ADD KEY `students_id` (`students_id`),
  ADD KEY `teacher_details_id` (`teacher_id`);

--
-- Indexes for table `home_page_menu`
--
ALTER TABLE `home_page_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_details_id` (`teacher_id`,`students_id`),
  ADD KEY `students_id` (`students_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_id` (`roles_id`,`school_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `pickup_point`
--
ALTER TABLE `pickup_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`,`sections_id`,`teachers_id`,`school_id`),
  ADD KEY `sections_id` (`sections_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_details_id` (`teachers_id`),
  ADD KEY `transportation_id` (`transportation_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_id` (`sections_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_id` (`bus_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `bus_id_2` (`bus_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backgrounds`
--
ALTER TABLE `backgrounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `exam_type`
--
ALTER TABLE `exam_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `home_page_menu`
--
ALTER TABLE `home_page_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pickup_point`
--
ALTER TABLE `pickup_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `practice`
--
ALTER TABLE `practice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`teachers_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `attendance_ibfk_5` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `backgrounds`
--
ALTER TABLE `backgrounds`
  ADD CONSTRAINT `backgrounds_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Constraints for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD CONSTRAINT `exam_type_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Constraints for table `home_page_menu`
--
ALTER TABLE `home_page_menu`
  ADD CONSTRAINT `home_page_menu_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `practice`
--
ALTER TABLE `practice`
  ADD CONSTRAINT `practice_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Constraints for table `transportation`
--
ALTER TABLE `transportation`
  ADD CONSTRAINT `transportation_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
