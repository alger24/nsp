-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 07:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pds_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `act_no` int(11) NOT NULL,
  `act_time` datetime NOT NULL DEFAULT current_timestamp(),
  `act_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`act_no`, `act_time`, `act_text`) VALUES
(5, '2022-04-30 14:46:19', 'A user named: Alg Bed, has just created an account.'),
(6, '2022-06-27 13:29:50', 'User named: Alg Bed, added their child information.');

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `admin_id` varchar(11) NOT NULL,
  `admin_name` varchar(24) NOT NULL,
  `admin_pass` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`admin_id`, `admin_name`, `admin_pass`) VALUES
('pg0srvtv0kz', 'admin1', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `user_addr_tbl`
--

CREATE TABLE `user_addr_tbl` (
  `user_id` varchar(11) NOT NULL,
  `addr_user_hbl` varchar(12) DEFAULT NULL,
  `addr_user_strt` varchar(12) DEFAULT NULL,
  `addr_user_subdiv` varchar(12) DEFAULT NULL,
  `addr_user_brgy` varchar(12) NOT NULL,
  `addr_user_city` varchar(12) NOT NULL,
  `addr_user_prov` varchar(12) NOT NULL,
  `addr_user_zip` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_addr_tbl`
--

INSERT INTO `user_addr_tbl` (`user_id`, `addr_user_hbl`, `addr_user_strt`, `addr_user_subdiv`, `addr_user_brgy`, `addr_user_city`, `addr_user_prov`, `addr_user_zip`) VALUES
('5ebff8cb235', NULL, NULL, NULL, 'san', 'Pal', 'Nue', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_card_tbl`
--

CREATE TABLE `user_card_tbl` (
  `user_id` varchar(11) NOT NULL,
  `card_user_gsis` varchar(24) DEFAULT NULL,
  `card_user_ibig` varchar(24) DEFAULT NULL,
  `card_user_phil` varchar(24) DEFAULT NULL,
  `card_user_sss` varchar(24) DEFAULT NULL,
  `card_user_tin` varchar(24) DEFAULT NULL,
  `card_user_mply` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_card_tbl`
--

INSERT INTO `user_card_tbl` (`user_id`, `card_user_gsis`, `card_user_ibig`, `card_user_phil`, `card_user_sss`, `card_user_tin`, `card_user_mply`) VALUES
('5ebff8cb235', '123456789', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_child_tbl`
--

CREATE TABLE `user_child_tbl` (
  `user_id` varchar(11) NOT NULL,
  `child_id` varchar(11) DEFAULT NULL,
  `child_user_name` varchar(224) DEFAULT NULL,
  `child_user_bdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_child_tbl`
--

INSERT INTO `user_child_tbl` (`user_id`, `child_id`, `child_user_name`, `child_user_bdate`) VALUES
('', 'childb51d52', 'a', '2022-06-19'),
('5ebff8cb235', 'child3f25fd', 'a', '2022-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `user_civil_tbl`
--

CREATE TABLE `user_civil_tbl` (
  `user_id` varchar(11) NOT NULL,
  `civil_id` varchar(11) NOT NULL,
  `civil_user_info` varchar(24) DEFAULT NULL,
  `civil_user_rate` varchar(224) DEFAULT NULL,
  `civil_user_exam` date DEFAULT NULL,
  `civil_user_addr` varchar(224) DEFAULT NULL,
  `civil_user_lcnnum` varchar(224) DEFAULT NULL,
  `civil_user_lcndate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_collbg_tbl`
--

CREATE TABLE `user_collbg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `collbg_user_name` varchar(24) DEFAULT NULL,
  `collbg_user_degre` varchar(224) DEFAULT NULL,
  `collbg_user_pfrom` date DEFAULT NULL,
  `collbg_user_pto` date DEFAULT NULL,
  `collbg_user_earn` varchar(224) DEFAULT NULL,
  `collbg_user_grad` varchar(224) DEFAULT NULL,
  `collbg_user_reci` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_elembg_tbl`
--

CREATE TABLE `user_elembg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `elembg_user_name` varchar(24) DEFAULT NULL,
  `elembg_user_degre` varchar(224) DEFAULT NULL,
  `elembg_user_pfrom` date DEFAULT NULL,
  `elembg_user_pto` date DEFAULT NULL,
  `elembg_user_earn` varchar(224) DEFAULT NULL,
  `elembg_user_grad` varchar(224) DEFAULT NULL,
  `elembg_user_reci` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_fmly_tbl`
--

CREATE TABLE `user_fmly_tbl` (
  `user_id` varchar(11) NOT NULL,
  `fmly_spous_sname` varchar(12) DEFAULT NULL,
  `fmly_spous_fname` varchar(12) DEFAULT NULL,
  `fmly_spous_mname` varchar(12) DEFAULT NULL,
  `fmly_spous_occup` varchar(24) DEFAULT NULL,
  `fmly_spous_emplyr_name` varchar(24) DEFAULT NULL,
  `fmly_spous_busines_addr` varchar(24) DEFAULT NULL,
  `fmly_spous_telno` varchar(24) DEFAULT NULL,
  `fmly_user_sname_fthr` varchar(12) DEFAULT NULL,
  `fmly_user_fname_fthr` varchar(12) DEFAULT NULL,
  `fmly_user_mname_fthr` varchar(12) DEFAULT NULL,
  `fmly_user_maiden_mthr` varchar(12) DEFAULT NULL,
  `fmly_user_sname_mthr` varchar(12) DEFAULT NULL,
  `fmly_user_fname_mthr` varchar(12) DEFAULT NULL,
  `fmly_user_mname_mthr` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_fmly_tbl`
--

INSERT INTO `user_fmly_tbl` (`user_id`, `fmly_spous_sname`, `fmly_spous_fname`, `fmly_spous_mname`, `fmly_spous_occup`, `fmly_spous_emplyr_name`, `fmly_spous_busines_addr`, `fmly_spous_telno`, `fmly_user_sname_fthr`, `fmly_user_fname_fthr`, `fmly_user_mname_fthr`, `fmly_user_maiden_mthr`, `fmly_user_sname_mthr`, `fmly_user_fname_mthr`, `fmly_user_mname_mthr`) VALUES
('5ebff8cb235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_gradbg_tbl`
--

CREATE TABLE `user_gradbg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `gradbg_user_name` varchar(24) DEFAULT NULL,
  `gradbg_user_degre` varchar(224) DEFAULT NULL,
  `gradbg_user_pfrom` date DEFAULT NULL,
  `gradbg_user_pto` date DEFAULT NULL,
  `gradbg_user_earn` varchar(224) DEFAULT NULL,
  `gradbg_user_grad` varchar(224) DEFAULT NULL,
  `gradbg_user_reci` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_lnd_tbl`
--

CREATE TABLE `user_lnd_tbl` (
  `user_id` varchar(11) NOT NULL,
  `lnd_id` varchar(11) NOT NULL,
  `lnd_user_name` varchar(224) DEFAULT NULL,
  `lnd_user_from` date DEFAULT NULL,
  `lnd_user_to` date DEFAULT NULL,
  `lnd_user_hr` varchar(224) DEFAULT NULL,
  `lnd_user_type` varchar(224) DEFAULT NULL,
  `lnd_user_spon` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_main_tbl`
--

CREATE TABLE `user_main_tbl` (
  `user_uid` varchar(255) NOT NULL,
  `main_user_email` varchar(50) NOT NULL,
  `main_user_pass` varchar(24) NOT NULL,
  `main_created` datetime NOT NULL DEFAULT current_timestamp(),
  `main_modified` datetime DEFAULT NULL,
  `main_verify` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_main_tbl`
--

INSERT INTO `user_main_tbl` (`user_id`, `main_user_email`, `main_user_pass`, `main_created`, `main_modified`, `main_verify`) VALUES
('5ebff8cb235', 'sample@email.com', '12345', '2022-04-30 14:46:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_other1_tbl`
--

CREATE TABLE `user_other1_tbl` (
  `user_id` varchar(11) NOT NULL,
  `other1_id` varchar(11) NOT NULL,
  `other1_user_skills` varchar(224) DEFAULT NULL,
  `other1_user_recog` varchar(224) DEFAULT NULL,
  `other1_user_member` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_other2_tbl`
--

CREATE TABLE `user_other2_tbl` (
  `user_id` varchar(11) NOT NULL,
  `other2_34_ayn` varchar(24) DEFAULT NULL,
  `other2_34_byn` varchar(24) DEFAULT NULL,
  `other2_34_txt` varchar(24) DEFAULT NULL,
  `other2_35_ayn` varchar(24) DEFAULT NULL,
  `other2_35_atxt` varchar(24) DEFAULT NULL,
  `other2_35_byn` varchar(24) DEFAULT NULL,
  `other2_35_bdate` date DEFAULT NULL,
  `other2_35_btxt` varchar(24) DEFAULT NULL,
  `other2_36_yn` varchar(24) DEFAULT NULL,
  `other2_36_txt` varchar(24) DEFAULT NULL,
  `other2_37_yn` varchar(24) DEFAULT NULL,
  `other2_37_txt` varchar(24) DEFAULT NULL,
  `other2_38_ayn` varchar(24) DEFAULT NULL,
  `other2_38_atxt` varchar(24) DEFAULT NULL,
  `other2_38_byn` varchar(24) DEFAULT NULL,
  `other2_38_btxt` varchar(24) DEFAULT NULL,
  `other2_39_yn` varchar(24) DEFAULT NULL,
  `other2_39_txt` varchar(24) DEFAULT NULL,
  `other2_40_ayn` varchar(24) DEFAULT NULL,
  `other2_40_atxt` varchar(24) DEFAULT NULL,
  `other2_40_byn` varchar(24) DEFAULT NULL,
  `other2_40_btxt` varchar(24) DEFAULT NULL,
  `other2_40_cyn` varchar(24) DEFAULT NULL,
  `other2_40_ctxt` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_other2_tbl`
--

INSERT INTO `user_other2_tbl` (`user_id`, `other2_34_ayn`, `other2_34_byn`, `other2_34_txt`, `other2_35_ayn`, `other2_35_atxt`, `other2_35_byn`, `other2_35_bdate`, `other2_35_btxt`, `other2_36_yn`, `other2_36_txt`, `other2_37_yn`, `other2_37_txt`, `other2_38_ayn`, `other2_38_atxt`, `other2_38_byn`, `other2_38_btxt`, `other2_39_yn`, `other2_39_txt`, `other2_40_ayn`, `other2_40_atxt`, `other2_40_byn`, `other2_40_btxt`, `other2_40_cyn`, `other2_40_ctxt`) VALUES
('5ebff8cb235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_otherimg_tbl`
--

CREATE TABLE `user_otherimg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `otherimg_path_1` varchar(224) DEFAULT NULL,
  `otherimg_path_2` varchar(224) DEFAULT NULL,
  `otherimg_path_3` varchar(224) DEFAULT NULL,
  `otherimg_path_4` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_otherimg_tbl`
--

INSERT INTO `user_otherimg_tbl` (`user_id`, `otherimg_path_1`, `otherimg_path_2`, `otherimg_path_3`, `otherimg_path_4`) VALUES
('5ebff8cb235', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_otherprf_tbl`
--

CREATE TABLE `user_otherprf_tbl` (
  `user_id` varchar(11) NOT NULL,
  `prf_govid_num` varchar(24) DEFAULT NULL,
  `prf_licen_num` varchar(24) DEFAULT NULL,
  `prf_issuance` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_otherref_tbl`
--

CREATE TABLE `user_otherref_tbl` (
  `user_id` varchar(11) NOT NULL,
  `otherref_id` varchar(11) NOT NULL,
  `otherref_name` varchar(24) DEFAULT NULL,
  `otherref_address` varchar(24) DEFAULT NULL,
  `otherref_telno` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_psl_tbl`
--

CREATE TABLE `user_psl_tbl` (
  `user_id` varchar(11) NOT NULL,
  `psl_user_sname` varchar(12) DEFAULT NULL,
  `psl_user_fname` varchar(12) DEFAULT NULL,
  `psl_user_mname` varchar(12) DEFAULT NULL,
  `psl_user_bdate` date DEFAULT NULL,
  `psl_user_bplace` varchar(24) DEFAULT NULL,
  `psl_user_sex` varchar(6) DEFAULT NULL,
  `psl_user_civil` varchar(12) DEFAULT NULL,
  `psl_user_height` double DEFAULT NULL,
  `psl_user_weight` int(6) DEFAULT NULL,
  `psl_user_blood` varchar(6) DEFAULT NULL,
  `psl_user_ctzn` varchar(24) DEFAULT NULL,
  `psl_user_ctzn_other` varchar(24) DEFAULT NULL,
  `psl_user_tel` varchar(24) DEFAULT NULL,
  `psl_user_mobile` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_psl_tbl`
--

INSERT INTO `user_psl_tbl` (`user_id`, `psl_user_sname`, `psl_user_fname`, `psl_user_mname`, `psl_user_bdate`, `psl_user_bplace`, `psl_user_sex`, `psl_user_civil`, `psl_user_height`, `psl_user_weight`, `psl_user_blood`, `psl_user_ctzn`, `psl_user_ctzn_other`, `psl_user_tel`, `psl_user_mobile`) VALUES
('5ebff8cb235', 'Bed', 'Alg', 'Ser', '2000-02-24', '', 'male', NULL, 10.2, 5, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_secobg_tbl`
--

CREATE TABLE `user_secobg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `secobg_user_name` varchar(24) DEFAULT NULL,
  `secobg_user_degre` varchar(224) DEFAULT NULL,
  `secobg_user_pfrom` date DEFAULT NULL,
  `secobg_user_pto` date DEFAULT NULL,
  `secobg_user_earn` varchar(224) DEFAULT NULL,
  `secobg_user_grad` varchar(224) DEFAULT NULL,
  `secobg_user_reci` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_vocabg_tbl`
--

CREATE TABLE `user_vocabg_tbl` (
  `user_id` varchar(11) NOT NULL,
  `vocabg_user_name` varchar(24) DEFAULT NULL,
  `vocabg_user_degre` varchar(224) DEFAULT NULL,
  `vocabg_user_pfrom` date DEFAULT NULL,
  `vocabg_user_pto` date DEFAULT NULL,
  `vocabg_user_earn` varchar(224) DEFAULT NULL,
  `vocabg_user_grad` varchar(224) DEFAULT NULL,
  `vocabg_user_reci` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_volu_tbl`
--

CREATE TABLE `user_volu_tbl` (
  `user_id` varchar(11) NOT NULL,
  `volu_id` varchar(11) NOT NULL,
  `volu_user_name` varchar(224) DEFAULT NULL,
  `volu_user_from` date DEFAULT NULL,
  `volu_user_to` date DEFAULT NULL,
  `volu_user_hr` varchar(224) DEFAULT NULL,
  `volu_user_posi` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_work_tbl`
--

CREATE TABLE `user_work_tbl` (
  `user_id` varchar(11) NOT NULL,
  `work_id` varchar(11) NOT NULL,
  `work_user_from` date DEFAULT NULL,
  `work_user_to` date DEFAULT NULL,
  `work_user_title` varchar(224) DEFAULT NULL,
  `work_user_depart` varchar(224) DEFAULT NULL,
  `work_user_sal` varchar(224) DEFAULT NULL,
  `work_user_salgrad` varchar(224) DEFAULT NULL,
  `work_user_status` varchar(224) DEFAULT NULL,
  `work_user_gov` varchar(224) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD UNIQUE KEY `act_no` (`act_no`);

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `user_addr_tbl`
--
ALTER TABLE `user_addr_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_card_tbl`
--
ALTER TABLE `user_card_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_child_tbl`
--
ALTER TABLE `user_child_tbl`
  ADD UNIQUE KEY `child_id` (`child_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_civil_tbl`
--
ALTER TABLE `user_civil_tbl`
  ADD UNIQUE KEY `civil_id` (`civil_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_collbg_tbl`
--
ALTER TABLE `user_collbg_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_elembg_tbl`
--
ALTER TABLE `user_elembg_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_fmly_tbl`
--
ALTER TABLE `user_fmly_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_gradbg_tbl`
--
ALTER TABLE `user_gradbg_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_lnd_tbl`
--
ALTER TABLE `user_lnd_tbl`
  ADD UNIQUE KEY `lnd_id` (`lnd_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_main_tbl`
--
ALTER TABLE `user_main_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_other1_tbl`
--
ALTER TABLE `user_other1_tbl`
  ADD UNIQUE KEY `other1_id` (`other1_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_other2_tbl`
--
ALTER TABLE `user_other2_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_otherimg_tbl`
--
ALTER TABLE `user_otherimg_tbl`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_otherprf_tbl`
--
ALTER TABLE `user_otherprf_tbl`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_otherref_tbl`
--
ALTER TABLE `user_otherref_tbl`
  ADD UNIQUE KEY `otherref_id` (`otherref_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_psl_tbl`
--
ALTER TABLE `user_psl_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_secobg_tbl`
--
ALTER TABLE `user_secobg_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_vocabg_tbl`
--
ALTER TABLE `user_vocabg_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_volu_tbl`
--
ALTER TABLE `user_volu_tbl`
  ADD UNIQUE KEY `volu_id` (`volu_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_work_tbl`
--
ALTER TABLE `user_work_tbl`
  ADD UNIQUE KEY `work_id` (`work_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `act_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_addr_tbl`
--
ALTER TABLE `user_addr_tbl`
  ADD CONSTRAINT `user_addr_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_card_tbl`
--
ALTER TABLE `user_card_tbl`
  ADD CONSTRAINT `user_card_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_child_tbl`
--
ALTER TABLE `user_child_tbl`
  ADD CONSTRAINT `user_child_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_civil_tbl`
--
ALTER TABLE `user_civil_tbl`
  ADD CONSTRAINT `user_civil_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_collbg_tbl`
--
ALTER TABLE `user_collbg_tbl`
  ADD CONSTRAINT `user_collbg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_elembg_tbl`
--
ALTER TABLE `user_elembg_tbl`
  ADD CONSTRAINT `user_elembg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_fmly_tbl`
--
ALTER TABLE `user_fmly_tbl`
  ADD CONSTRAINT `user_fmly_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_gradbg_tbl`
--
ALTER TABLE `user_gradbg_tbl`
  ADD CONSTRAINT `user_gradbg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_lnd_tbl`
--
ALTER TABLE `user_lnd_tbl`
  ADD CONSTRAINT `user_lnd_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_other1_tbl`
--
ALTER TABLE `user_other1_tbl`
  ADD CONSTRAINT `user_other1_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_other2_tbl`
--
ALTER TABLE `user_other2_tbl`
  ADD CONSTRAINT `user_other2_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_otherimg_tbl`
--
ALTER TABLE `user_otherimg_tbl`
  ADD CONSTRAINT `user_otherimg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_otherprf_tbl`
--
ALTER TABLE `user_otherprf_tbl`
  ADD CONSTRAINT `user_otherprf_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_otherref_tbl`
--
ALTER TABLE `user_otherref_tbl`
  ADD CONSTRAINT `user_otherref_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_psl_tbl`
--
ALTER TABLE `user_psl_tbl`
  ADD CONSTRAINT `user_psl_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_secobg_tbl`
--
ALTER TABLE `user_secobg_tbl`
  ADD CONSTRAINT `user_secobg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_vocabg_tbl`
--
ALTER TABLE `user_vocabg_tbl`
  ADD CONSTRAINT `user_vocabg_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_volu_tbl`
--
ALTER TABLE `user_volu_tbl`
  ADD CONSTRAINT `user_volu_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_work_tbl`
--
ALTER TABLE `user_work_tbl`
  ADD CONSTRAINT `user_work_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main_tbl` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
