-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 09:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymsubsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `fitness_programs`
--

CREATE TABLE `fitness_programs` (
  `program_id` int(11) NOT NULL,
  `program_name` varchar(150) NOT NULL,
  `program_goal` enum('lose_weight','build_muscle','muscle_toning','improve_endurance','general_fitness') NOT NULL,
  `program_desc` text NOT NULL,
  `program_duration_weeks` int(11) NOT NULL,
  `program_main_img` varchar(255) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `program_status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitness_programs`
--

INSERT INTO `fitness_programs` (`program_id`, `program_name`, `program_goal`, `program_desc`, `program_duration_weeks`, `program_main_img`, `trainer_id`, `program_status`) VALUES
(6, 'try2', 'lose_weight', 'sdsd', 3, 'lose-weight.png', 1, 'A'),
(7, 'try111', 'build_muscle', 'sass', 3, 'lose-weight.png', 8, 'A'),
(8, 'try3', 'muscle_toning', 'adasa', 3, 'lose-weight.png', 8, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `fitness_trainers`
--

CREATE TABLE `fitness_trainers` (
  `trainer_id` int(11) NOT NULL,
  `trainer_fullname` varchar(150) NOT NULL,
  `trainer_specialization` varchar(100) DEFAULT NULL,
  `trainer_contact_number` varchar(20) DEFAULT NULL,
  `trainer_profile_image` varchar(255) DEFAULT NULL,
  `trainer_status` char(1) DEFAULT 'A' COMMENT 'A=Active, I=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fitness_trainers`
--

INSERT INTO `fitness_trainers` (`trainer_id`, `trainer_fullname`, `trainer_specialization`, `trainer_contact_number`, `trainer_profile_image`, `trainer_status`) VALUES
(1, 'Leander Pines', 'cardioooo', '09888888888', 'dog-pictures-wjo6j6jyowsd2fi7.jpg', 'A'),
(8, 'Princess Aira Layosa', 'Weight Loss and Muscle Toning', '09777777777', 'thryjpg.jpg', 'A'),
(9, 'Jan Hericka Orbase', 'cardio', '09222222298', 'thryjpg.jpg', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `status` enum('paid','pending','failed') DEFAULT 'paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','expired','cancelled') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(150) NOT NULL,
  `plan_price` decimal(10,2) NOT NULL,
  `plan_desc` text NOT NULL,
  `plan_duration_days` int(50) NOT NULL,
  `plan_type` enum('monthly','yearly') NOT NULL,
  `plan_tier` varchar(50) NOT NULL,
  `plan_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A=Active,I=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`plan_id`, `plan_name`, `plan_price`, `plan_desc`, `plan_duration_days`, `plan_type`, `plan_tier`, `plan_status`) VALUES
(26, 'Plan A', 499.00, 'A month access to the best gym equipments and program plan of your choice.', 31, 'monthly', 'standard', 'A'),
(28, 'Plan B', 799.50, '	A month access to the best gym equipments and program plan of your choice + trainer.', 30, 'monthly', 'premium', 'A'),
(30, 'Plan C', 5400.00, 'Yearly access to gym equipments and program plan of your choice.', 365, 'yearly', 'Standard', 'A'),
(31, 'Plan D', 9000.00, 'Yearly access to gym equipments and program plan of your choice + trainer.', 365, 'yearly', 'Premium', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email` varchar(150) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` char(1) NOT NULL DEFAULT 'C',
  `user_status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fullname`, `password`, `email`, `gender`, `address`, `contact_number`, `date_added`, `user_type`, `user_status`) VALUES
(1, 'admin', 'admin', 'admin12345', '', '', '', '', '2025-05-07 10:46:35', 'A', ''),
(2, 'heks', 'Jan Hericka Orbase', 'heks', 'janaehenreesorbase@gmail.com', 'F', 'calzada guinobatan albay', '09171522474', '2025-05-07 13:00:11', 'C', 'A'),
(3, 'bidab', 'Janae Orbase', 'bidab', 'janaeorbase@gmail.com', 'female', '33 Ocfemia Street Calzada Guinobatan Albay', '09171522474', '2025-05-18 15:36:50', 'C', 'A'),
(4, 'Zandre', 'Zethos Ethorian', 'Rainier1', 'rainierservito001@gmail.com', 'other', 'No', '09663960079', '2025-05-19 13:06:08', 'C', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `height_cm` decimal(5,2) NOT NULL,
  `weight_kg` decimal(5,2) NOT NULL,
  `fitness_goal` enum('lose_weight','build_muscle','muscle_toning','improve_endurance','general_fitness') NOT NULL,
  `activity_level` enum('sedentary','lightly_active','active','very_active') NOT NULL,
  `medical_conditions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`profile_id`, `user_id`, `age`, `height_cm`, `weight_kg`, `fitness_goal`, `activity_level`, `medical_conditions`) VALUES
(1, 3, 19, 160.00, 64.00, 'lose_weight', 'sedentary', 'none'),
(2, 4, 18, 170.00, 55.00, 'lose_weight', 'sedentary', 'nh');

-- --------------------------------------------------------

--
-- Table structure for table `user_program_enrollments`
--

CREATE TABLE `user_program_enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL DEFAULT curdate(),
  `status` enum('active','completed','cancelled') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fitness_programs`
--
ALTER TABLE `fitness_programs`
  ADD PRIMARY KEY (`program_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `fitness_trainers`
--
ALTER TABLE `fitness_trainers`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_program_enrollments`
--
ALTER TABLE `user_program_enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `program_id` (`program_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fitness_programs`
--
ALTER TABLE `fitness_programs`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fitness_trainers`
--
ALTER TABLE `fitness_trainers`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_program_enrollments`
--
ALTER TABLE `user_program_enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fitness_programs`
--
ALTER TABLE `fitness_programs`
  ADD CONSTRAINT `fitness_programs_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `fitness_trainers` (`trainer_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`plan_id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_program_enrollments`
--
ALTER TABLE `user_program_enrollments`
  ADD CONSTRAINT `user_program_enrollments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_program_enrollments_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `fitness_programs` (`program_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
