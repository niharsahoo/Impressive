-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2015 at 12:27 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `high_clean`
--
CREATE DATABASE IF NOT EXISTS `high_clean` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `high_clean`;

-- --------------------------------------------------------

--
-- Table structure for table `hc_buildings`
--

CREATE TABLE IF NOT EXISTS `hc_buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(255) DEFAULT NULL,
  `building_no` varchar(255) NOT NULL,
  `water_source_availability` enum('0','1') NOT NULL DEFAULT '0',
  `dist_from_office` varchar(255) DEFAULT NULL,
  `no_of_floors` int(11) NOT NULL,
  `size_of_building` varchar(255) DEFAULT NULL,
  `height_of_building` varchar(255) DEFAULT NULL,
  `job_notes` text,
  `site_id` int(11) DEFAULT NULL,
  `building_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `building_type_id` (`building_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hc_buildings`
--

INSERT INTO `hc_buildings` (`id`, `building_name`, `building_no`, `water_source_availability`, `dist_from_office`, `no_of_floors`, `size_of_building`, `height_of_building`, `job_notes`, `site_id`, `building_type_id`, `created_at`, `updated_at`) VALUES
(3, 'Wing ''A''', '123', '1', '45km', 7, '5000 sq feet', '500m', 'This is test Job Note.', 12, 1, '2014-12-02 20:55:35', '2014-12-02 15:25:35'),
(4, 'Wing ''B''', '789/456', '1', '12km', 11, '4574 squar feet', '78 feet', 'This is test job note.', 12, 1, '2014-12-03 12:40:23', '2014-12-03 07:10:23'),
(5, 'Phase I', '56/458', '0', '41km', 45, '6600 squar feet', '45 feet', 'This is job note. Testing....', 13, 1, '2014-12-03 12:48:15', '2014-12-03 07:18:15'),
(6, 'Test building', '45/78', '1', '12', 12, '12', '12', 'Test job note.', 11, 1, '2014-12-31 20:28:50', '2014-12-31 14:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `hc_company`
--

CREATE TABLE IF NOT EXISTS `hc_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `office_suburb` varchar(255) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `mailing_suburb` varchar(255) DEFAULT NULL,
  `abn` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `number_of_site` int(11) NOT NULL,
  `office_state` varchar(255) NOT NULL,
  `office_postcode` varchar(255) NOT NULL,
  `mailing_state` varchar(255) NOT NULL,
  `mailing_postcode` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hc_company`
--

INSERT INTO `hc_company` (`id`, `name`, `office_address`, `office_suburb`, `mailing_address`, `mailing_suburb`, `abn`, `phone`, `mobile`, `fax`, `email`, `website`, `number_of_site`, `office_state`, `office_postcode`, `mailing_state`, `mailing_postcode`, `created_at`, `updated_at`, `status`) VALUES
(5, 'eDreamz', 'ManikBaug', 'Singhagad Road', 'Test Mail Address', 'Test Mailing Superb', 'ABN', '123-456-7890', '9765-789-548', '343438', 'vinayak.n@edreamz.in', 'http://www.test.com', 45, 'Maharashtra', '411056', 'Maharashtra', '411056', '2014-12-02 19:25:14', '2014-12-02 13:55:14', '1'),
(6, 'ABC pvt. ltd.', 'Test office address', 'Test Office Suburb', 'Test Mailing Address', 'Test Mailing Suburb', 'Test Abn', '456-456-7890', '4765-789-548', '44449999', '', '', 34, 'Maharashtra', '411056', 'Maharashtra', '411056', '2014-12-02 19:27:53', '2014-12-02 13:57:53', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_contact`
--

CREATE TABLE IF NOT EXISTS `hc_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `address` text,
  `suburb` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `no_of_sites_managed` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hc_contact`
--

INSERT INTO `hc_contact` (`id`, `company_id`, `first_name`, `surname`, `address`, `suburb`, `state`, `postcode`, `phone`, `mobile`, `email`, `position`, `no_of_sites_managed`, `created_at`, `updated_at`, `status`) VALUES
(9, 5, 'Vinayak', 'N', '123 Main street', 'Test Superb', 'Test State', '444900', '0290485888', '9994567890', 'Vinayak.n@edreamz.in', 'manager', 11, '2014-12-02 19:30:25', '2014-12-02 14:00:25', '1'),
(10, 6, 'Sakharam', 'D', '456 Main street', 'Test Superb', 'Test State', '444900', '0555485888', '8884567890', 'sakharam.d@edreamz.in', 'manager', 44, '2014-12-02 19:31:46', '2014-12-02 14:01:46', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_countries`
--

CREATE TABLE IF NOT EXISTS `hc_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(50) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=243 ;

--
-- Dumping data for table `hc_countries`
--

INSERT INTO `hc_countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People''s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `hc_frequency_type`
--

CREATE TABLE IF NOT EXISTS `hc_frequency_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `hc_frequency_type`
--

INSERT INTO `hc_frequency_type` (`id`, `name`, `value`) VALUES
(1, 'One off', '+ 0 days'),
(2, 'One week', '+ 7 days'),
(3, 'Two weeks', '+ 14 days'),
(4, 'Three weeks', '+ 21 days'),
(5, 'Four weeks', '+ 28 days'),
(6, 'One month', '+ 1 months'),
(7, 'Two months', '+ 2 months'),
(8, 'Three months', '+ 3 months'),
(9, 'Four months', '+ 4 months'),
(10, 'Five months', '+ 5 months'),
(11, 'Six months', '+ 6 months'),
(12, 'Seven months', '+ 7 months'),
(13, 'Eight months', '+ 8 months'),
(14, 'Nine months', '+ 9 months'),
(15, 'Ten months', '+ 10 months'),
(16, 'Eleven months', '+ 11 months'),
(17, 'One year', '+ 1 years'),
(18, 'Two year', '+ 2 years');

-- --------------------------------------------------------

--
-- Table structure for table `hc_group`
--

CREATE TABLE IF NOT EXISTS `hc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `role_val` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hc_group`
--

INSERT INTO `hc_group` (`id`, `role`, `role_val`) VALUES
(1, 'Administrator', 'admin'),
(2, 'Manager', 'manager'),
(3, 'Staff', 'staff'),
(4, 'Service Client', 'service_client'),
(5, 'Supervisor', 'supervisor'),
(6, 'Site Supervisor', 'site_supervisor'),
(7, 'Contractor', 'contractor');

-- --------------------------------------------------------

--
-- Table structure for table `hc_job_multiple_images`
--

CREATE TABLE IF NOT EXISTS `hc_job_multiple_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `added` enum('before','after') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_job_site_supervisor`
--

CREATE TABLE IF NOT EXISTS `hc_job_site_supervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hc_job_site_supervisor`
--

INSERT INTO `hc_job_site_supervisor` (`id`, `job_id`, `user_id`, `name`, `email`, `phone`, `mobile`) VALUES
(3, 788, 11, 'Anna Patil', 'anna@edreamz.in', '020784512', '3256895623'),
(4, 788, 9, 'Dhanashri Desai', 'dhanashri.d@edreamz.in', '020454545', '68576867568'),
(6, 787, 9, 'Dhanashri Desai', 'dhanashri.d@edreamz.in', '020454545', '68576867568');

-- --------------------------------------------------------

--
-- Table structure for table `hc_job_staff`
--

CREATE TABLE IF NOT EXISTS `hc_job_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `pick_up_van` varchar(255) DEFAULT NULL,
  `get_to_job_site` varchar(255) DEFAULT NULL,
  `return_to_office` varchar(255) DEFAULT NULL,
  `job_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `hc_job_staff`
--

INSERT INTO `hc_job_staff` (`id`, `job_id`, `user_id`, `name`, `email`, `phone`, `mobile`, `pick_up_van`, `get_to_job_site`, `return_to_office`, `job_date`) VALUES
(8, 787, 11, 'Anna Patil', 'anna@edreamz.in', '020784512', '3256895623', '07:00 PM', '07:00 PM', '07:00 PM', '2015-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `hc_job_supervisor`
--

CREATE TABLE IF NOT EXISTS `hc_job_supervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hc_job_supervisor`
--

INSERT INTO `hc_job_supervisor` (`id`, `job_id`, `user_id`, `name`, `email`, `phone`, `mobile`) VALUES
(6, 788, 8, 'Rohit Singraul', 'rohit.ss@edreamz.in', '1234567890', '9876543210'),
(7, 787, 8, 'Rohit Singraul', 'rohit.ss@edreamz.in', '1234567890', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_access_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_access_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `list_item_id` int(11) NOT NULL,
  `time_per_quantity` varchar(255) NOT NULL,
  `setup_time` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_building_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_building_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hc_list_building_type`
--

INSERT INTO `hc_list_building_type` (`id`, `name`, `list_item_id`, `status`) VALUES
(1, 'Apartment block', 1, '1'),
(5, 'furniture Block', 1, '1'),
(6, 'Test Block', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_display_for_client`
--

CREATE TABLE IF NOT EXISTS `hc_list_display_for_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_equipment_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_equipment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_item_id` int(11) NOT NULL,
  `cost_per_day` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_glass_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_glass_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_item`
--

CREATE TABLE IF NOT EXISTS `hc_list_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hc_list_item`
--

INSERT INTO `hc_list_item` (`id`, `list_name`, `status`) VALUES
(1, 'Building type', '1'),
(2, 'Glass type', '1'),
(3, 'Quality type', '1'),
(4, 'Access type', '1'),
(5, 'Display for client', '1'),
(6, 'Equipment type', '1'),
(7, 'Pane size type', '1'),
(8, 'Service type', '1'),
(9, 'Side type', '1'),
(10, 'Tools type', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_pane_size_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_pane_size_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_item_id` int(11) NOT NULL,
  `time_per_quantity` varchar(255) NOT NULL,
  `setup_time` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_quality_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_quality_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_service_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `list_item_id` int(11) NOT NULL,
  `cost_per_hour` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hc_list_service_type`
--

INSERT INTO `hc_list_service_type` (`id`, `name`, `list_item_id`, `cost_per_hour`, `status`) VALUES
(1, 'test', 8, '45', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_side_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_side_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hc_list_tools_type`
--

CREATE TABLE IF NOT EXISTS `hc_list_tools_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `list_item_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hc_list_tools_type`
--

INSERT INTO `hc_list_tools_type` (`id`, `name`, `list_item_id`, `status`) VALUES
(1, 'WFP Kit', 10, '1'),
(2, 'Dusting Kit', 10, '1'),
(3, 'Internal WC Kit', 10, '1'),
(4, 'Pressure Washing Kit', 10, '1'),
(5, 'Facade Washing Kit', 10, '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_quotes`
--

CREATE TABLE IF NOT EXISTS `hc_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quote_date` date NOT NULL,
  `status` enum('Completed','Incomplete','Approved','Declined','Pending') NOT NULL DEFAULT 'Incomplete',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `contact_id` (`contact_id`),
  KEY `site_id` (`site_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `hc_quotes`
--

INSERT INTO `hc_quotes` (`id`, `company_id`, `contact_id`, `site_id`, `service_id`, `quote_date`, `status`, `created_at`, `updated_at`) VALUES
(17, 5, 9, 12, 1, '2015-01-06', 'Approved', '2015-01-01 19:15:03', '2015-01-01 13:45:03'),
(19, 5, 9, 12, 1, '2015-01-06', 'Approved', '2015-01-01 00:00:00', '2015-01-01 13:45:03'),
(20, 5, 9, 12, 1, '2015-01-13', 'Pending', '2015-01-01 00:00:00', '2015-01-01 13:45:03'),
(21, 5, 9, 11, 1, '2015-01-28', 'Incomplete', '2015-01-01 20:57:57', '2015-01-01 15:27:57'),
(22, 6, 10, 11, 1, '2015-01-28', 'Incomplete', '2015-01-02 00:29:37', '2015-01-01 18:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `hc_quote_jobs`
--

CREATE TABLE IF NOT EXISTS `hc_quote_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00',
  `final_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `si_staff_contractor` text,
  `si_client` text,
  `swms_ids` varchar(255) DEFAULT NULL,
  `tool_types_ids` varchar(255) DEFAULT NULL,
  `job_note` text,
  `approval_status` enum('Approved By Admin','Pending Admin Approval','Cancelled','Declined') NOT NULL DEFAULT 'Pending Admin Approval',
  `booked_status` enum('Not Booked','Booked') NOT NULL DEFAULT 'Not Booked',
  `job_status` enum('NotStarted','Started','Paused','Restarted','Completed','Cancelled','Declined') NOT NULL DEFAULT 'NotStarted',
  `paid` enum('No','Paid') NOT NULL DEFAULT 'No',
  `signed_off` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` date NOT NULL,
  `job_started_date` date NOT NULL DEFAULT '0000-00-00',
  `job_end_date` date NOT NULL DEFAULT '0000-00-00',
  `staff_required` int(11) DEFAULT '0',
  `frequency_type` int(11) DEFAULT '1',
  `original_record` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=794 ;

--
-- Dumping data for table `hc_quote_jobs`
--

INSERT INTO `hc_quote_jobs` (`id`, `quote_id`, `building_id`, `discount`, `final_total`, `si_staff_contractor`, `si_client`, `swms_ids`, `tool_types_ids`, `job_note`, `approval_status`, `booked_status`, `job_status`, `paid`, `signed_off`, `created_at`, `job_started_date`, `job_end_date`, `staff_required`, `frequency_type`, `original_record`) VALUES
(787, 17, 4, '10.00', '90.00', 'Special Instruction for STAFF / CONTRACTOR', 'Special Instruction for CLIENT', '1,3', '1,3,5', 'This is test job note.', 'Approved By Admin', 'Booked', 'NotStarted', 'No', 'No', '2015-01-01', '2015-01-07', '2015-01-07', 3, 1, '1'),
(788, 19, 4, '10.00', '90.00', 'Special Instruction for STAFF / CONTRACTOR', 'Special Instruction for CLIENT', '1,3', '1,3,5', 'This is test job note.', 'Approved By Admin', 'Booked', 'Paused', 'No', 'No', '2015-01-01', '2015-01-06', '2015-01-07', 4, 3, '1'),
(789, 19, 4, '10.00', '90.00', 'Special Instruction for STAFF / CONTRACTOR', 'Special Instruction for CLIENT', '1,3', '1,3,5', 'This is test job note.', 'Pending Admin Approval', 'Booked', 'NotStarted', 'No', 'No', '2015-01-01', '2015-01-20', '2015-01-21', 0, 1, '0'),
(790, 19, 4, '10.00', '90.00', 'Special Instruction for STAFF / CONTRACTOR', 'Special Instruction for CLIENT', '1,3', '1,3,5', 'This is test job note.', 'Pending Admin Approval', 'Booked', 'NotStarted', 'No', 'No', '2015-01-01', '2015-02-03', '2015-02-04', 0, 1, '0'),
(791, 20, 4, '10.00', '1181.70', 'Special Instruction for STAFF / CONTRACTOR', 'Special Instruction for CLIENT', '1,3', '1,3,5', 'This is test job note.', 'Pending Admin Approval', 'Not Booked', 'NotStarted', 'No', 'No', '2015-01-01', '0000-00-00', '0000-00-00', 4, 3, '1'),
(792, 21, 6, '0.00', '0.00', NULL, NULL, NULL, NULL, 'Test job note.', 'Pending Admin Approval', 'Not Booked', 'NotStarted', 'No', 'No', '2015-01-01', '0000-00-00', '0000-00-00', 0, 1, '1'),
(793, 22, 6, '0.00', '0.00', NULL, NULL, NULL, NULL, 'Test job note.', 'Pending Admin Approval', 'Not Booked', 'NotStarted', 'No', 'No', '2015-01-02', '0000-00-00', '0000-00-00', 0, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_quote_job_services`
--

CREATE TABLE IF NOT EXISTS `hc_quote_job_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `service_description` text,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unit_price_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `image` varchar(255) DEFAULT NULL,
  `notes` text,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `hc_quote_job_services`
--

INSERT INTO `hc_quote_job_services` (`id`, `job_id`, `service_description`, `quantity`, `unit_price_rate`, `total`, `image`, `notes`, `created_at`) VALUES
(140, 787, 'Description', 1, '100.00', '100.00', NULL, 'Notes', '2015-01-01'),
(141, 788, 'Description', 1, '100.00', '100.00', '', 'Notes', '2015-01-01'),
(142, 789, 'Description', 1, '100.00', '100.00', NULL, 'Notes', '2015-01-01'),
(143, 790, 'Description', 1, '100.00', '100.00', NULL, 'Notes', '2015-01-01'),
(146, 792, 'test', 1, '100.00', '100.00', NULL, 'test', '2015-01-01'),
(149, 791, 'test123', 1, '100.00', '100.00', NULL, 'test', '2015-01-01'),
(151, 792, 'test6', 1, '50.00', '50.00', NULL, 'tesaf', '2015-01-01'),
(152, 791, 'test123', 1, '1213.00', '1213.00', NULL, '1313', '2015-01-01'),
(153, 793, 'Test', 5, '600000.00', '3000000.00', NULL, 'Test', '2015-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `hc_services`
--

CREATE TABLE IF NOT EXISTS `hc_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `hc_services`
--

INSERT INTO `hc_services` (`id`, `service_name`, `status`) VALUES
(1, 'Window Cleaning', '1'),
(2, 'High Level Dusting', '1'),
(3, 'Pressure Washing', '1'),
(4, 'Facade Washing', '1'),
(5, 'Deep Clean', '1'),
(6, 'Gutter Cleaning', '1'),
(7, 'High Clean', '1'),
(8, 'Maintenance Clean', '1'),
(9, 'General Clean', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_site`
--

CREATE TABLE IF NOT EXISTS `hc_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL,
  `site_id` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `site_contact` varchar(255) NOT NULL,
  `site_comments` varchar(255) NOT NULL,
  `how_many_buildings` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `need_induction` enum('0','1') NOT NULL DEFAULT '1',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hc_site`
--

INSERT INTO `hc_site` (`id`, `site_name`, `site_id`, `address`, `suburb`, `state`, `postcode`, `phone`, `mobile`, `email`, `site_contact`, `site_comments`, `how_many_buildings`, `created_at`, `updated_at`, `need_induction`, `status`) VALUES
(11, 'Test Site', 'Test Site ID', 'Test Address', 'Test Superb', 'Test State', '555990', '76448784858', '87767676677', 'vinayak.n@edreamz.in', 'Site Contact', 'Test comment', 56, '2014-12-02 20:24:20', '2014-12-30 20:03:47', '1', '1'),
(12, 'My Site', 'My Site ID', 'My Address', 'My Superb', 'My State', '777899', '558784858', '6667676677', 'sakharam.d@edreamz.in', 'Site Contact', 'Test comment', 56, '2014-12-02 20:48:47', '2014-12-30 20:03:43', '0', '1'),
(13, 'Shiv Sagar Sociaty', '45/890', 'Swarget', 'Pune', 'Maharashtra', '43390', '435678900', '98765432345', 'rohit.ss@edreamz.in', 'Site Contact', 'Test comment', 33, NULL, '2014-12-30 20:03:37', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hc_site_contact_relation`
--

CREATE TABLE IF NOT EXISTS `hc_site_contact_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `hc_site_contact_relation`
--

INSERT INTO `hc_site_contact_relation` (`id`, `site_id`, `contact_id`) VALUES
(13, 13, 9),
(14, 12, 9),
(15, 11, 10),
(16, 11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `hc_swms`
--

CREATE TABLE IF NOT EXISTS `hc_swms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `task` text,
  `consequences` text,
  `risk` enum('LOW','MEDIUM','HIGH') NOT NULL DEFAULT 'LOW',
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `hc_swms`
--

INSERT INTO `hc_swms` (`id`, `name`, `task`, `consequences`, `risk`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Ladder', 'Ladders usage', 'Hazards: Falling from height   Consequences: head/ back injuries', 'HIGH', '<p>Minimise use of ladders. Use all other means possible prior to considering the use of ladders. Inspect ladder for damage prior to use. Report damage and replace/ repair as necessary. Always ensure three points of contact when using ladder.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Extension ladders: use only for accessing areas, not from working from. When using extension ladders: Level with adjustable feet, ensure properly footed with footing tool or other staff member, tie off at top when using to access roof areas and ensure recommended angle is followed. Use ladder access points where present.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Step Ladders: ensure stable and on even ground prior to using. Level as necessary. Do not stand above the manufacturer&rsquo;s recommended maximum step.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Enclosed Platform Ladder: ensure floor clean from debris and ladder sitting flat on stops. Close arm behind as supplied to prevent falls from ladder. To not over extend past hand rails to unbalance ladder.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:00:38', '2014-11-30 08:17:48'),
(2, 'Water Fed Pole', 'Water fed pole (Reach and Wash) Cleaning of various surfaces Including: solar panels, glass, painted surfaces', 'Hazards: Electrocution, trip/ slip/ falling poles & equipment/ improper use of equipment  Consequences: burns/ death, head/ back injuries/ general muscle injury or RSI', 'HIGH', '<p>Overhead obstacles to be noted and avoided. Keep two meters away from power or telephone lines at all times unless it is confirmed they are insulated.</p>\r\n\r\n<p>Work around or through trees and bushes.</p>\r\n\r\n<p>Ensure work zone will cover pedestrians if the pole is dropped from its maximum extension used on site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>High winds can be a hazard when operating WFP. Test in a safe area to see if winds are too strong. If pole is not fully controllable, cease work until winds drop or work on another area of job until conditions are suitable. If pole is not in 100% control of operator, do not use.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ensure correct usage of WFP as per training to prevent personal muscle injury or RSI. Take appropriate breaks to stretch and rest muscles. If soreness persists, inform manager.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ensure hoses are out of the way of the general public. Keep them close to the kerb/gutter, to the side of a footpath, in a garden bed or inside the work zone. If running hoses in a public place, ensure signs clearly indicate trip hazard or work zone at either side of work area.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:23:26', '2014-11-30 08:18:57'),
(3, 'Working at height', 'Working At Heights (on a roof)', 'Hazards: Falling from height   Consequences: serious injury or death', 'HIGH', '<p>Only staff who have completed the working at heights safety course or are working with staff member with certificate under instruction may work on roof areas. If in doubt or have concerns with the site, do not work. Note issues and present to manager or client.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Roof Anchor Points:</p>\r\n\r\n<p>Ensure anchor points have been tested within the required time frame. Request information or check stamping on test plate.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When using Roof Harness Kits:</p>\r\n\r\n<p>Keep the rope as short and tight as possible Do not have slack in the rope. Use the closest possible roof anchor. Keep in mind where the anchor is placed and the potential for swinging. Test if necessary by walking to edge of roof line. If there is slack in the rope, use another anchor point.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>A sling can be used to attached to existing structure or vehicle if 1500kgs.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>A load rated harness with shock absorbing lanyard and attached to an anchor with appropriate rated rope. This rope is to be attached with a fall arrest device.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>All employees must work within 120 degrees of their respective anchor points.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Temporary anchor points: Follow the manufactures instructions. With the T-Bar, typically install on opposing side of a corrugated roof or use installed diverters on working side of roof.</p>\r\n', '2014-11-29 20:23:57', '2014-11-30 08:27:00'),
(4, 'EWP', 'Elevated Work Platform- All work', 'Hazards: Falling from height   Consequences: head/ back injuries ', 'HIGH', '<p>Only trained and license staff should use EWP equipment. This includes scissor lifts, man lifts and booms (cherry picker). Competent operator to conduct pre-start inspection &amp; sign off EWP in logbook at the start of each and every day. If any issues found, mark on inspection book attached to machine and report to equipment supplier immediately.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>EWP operator in conjunction with equipment supplier is to ensure EWP is capable of operating on site as per manufacturer&rsquo;s specifications.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Suspended floors: Ensure slab floor can support weight. Get authorisation from relevant person prior to arriving onsite.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Power lines: observe distances as per AS2550.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Wear a harness as supplied with boom at all times. Ensure it is in suitable condition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When natural lighting is fading, provide artificial lighting to aid in work and safety.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>DO NOT STAND ON HANDRAILS OR CLIMB FROM EWP AT ANY TIME.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In the event of EWP malfunction, worker collapse or restrained fall from height, call emergency services. Operate machine from ground controls to retrieve worker. Site emergency procedures must be followed. Call the (MFB) Melbourne Fire Brigade HIGH ANGLE RESCUE TEAM on PH 000.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ensure work with EWP is within a controlled work zone. As for all work, create a work zone with bollards, signage and safety tape where members of the public cannot enter. Ensure enough space around work zone exists so equipment falling will not enter the non- work zone.</p>\r\n', '2014-11-29 20:24:16', '2014-11-30 08:28:02'),
(5, 'High Level Dusting', 'High Level Dusting', 'Hazards: dust falling   Consequences:  Breathing difficulties and irritation  Hazards: Falling poles & equipment  Consequences: head/ back injuries', 'LOW', '<p>To prevent breathing irritation, wear dust mask. Use a fresh mask each shift or as required.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ensure work zone will cover pedestrians if the pole is dropped from its maximum extension used on site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:24:33', '2014-11-30 08:31:01'),
(6, 'Gutter  Cleaning', 'Gutter Cleaning -using Upkeeper or similar suction machine', 'Hazards: Dropping of high level extension wand   Consequences:  Head injuries to passes-by  Hazards: loading machine into vehicle   Consequences:  Back injury  Hazards: Emptying waste from machine   Consequences:  Back injury', 'MEDIUM', '<p>Ensure work zone will cover pedestrians if the wand is dropped from its maximum extension used on site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Use ramp supplied to push machine into van. Ensure the unit is empties of waste before loading.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Do not fill machine beyond 50% capacity. Drain water out of loading hopper before removing waste bag. Replace with new bag or reuse empty bag. If too full, seek assistance from another staff member.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:24:49', '2014-11-30 12:59:52'),
(7, 'Internal Window Cleaning', 'Internal Window Cleaning: Glass cleaning internally with high level pole (carbon or aluminium poles, Dragon Fly type internal WFP)', 'Hazards: Trip/ slip/ falling poles & equipment/ electric shock  Consequences: head/ back injuries, electrocution Hazards: restricted access around furniture,  Consequences: Muscle injury', 'LOW', '<p>Ensure excess water is within the work zone and fully dried prior to removing barricades or relocating. Mop floors and dry surfaces as required.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Do not use where electrical devices are present. Cover or make inoperable. Examples Electric doors, switch boards, power switches, lighting.</p>\r\n\r\n<p>Do not move furniture. Use of extension poles to clean restricted access areas (ie. Behind desks, furniture, filing cabinets). Minimise the use of step ladders- use only as a last resort.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Where possible, use aluminium poles to recover glass microfibers from sills. Only if necessary bend down using knees and recover cloth or wipe sills.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Use cloth towels to cover papers, computers and furniture to prevent drips from transferring onto work area from tooling.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Prevent excessive bending- use the Sorbo QuatroPods. This tool enables dipping of mop into the bucket at hip height to prevent bending to the ground. Tools and cloths can be stored on this unit to prevent bending also.</p>\r\n', '2014-11-29 20:25:08', '2014-11-30 08:29:30'),
(8, 'Government Site', 'All Activities', '', 'LOW', '<p>Government and military sites will have their own specific requirements. As a priority, follow these instructions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Do not access restricted areas unless authorised or have appropriate clearance.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Determine requirements prior to entering government and military sites.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:25:26', '2014-11-30 08:30:09'),
(9, 'Pressure Washing', 'Pressure Washing', '', 'LOW', '<p>Never point or aim the gun/wand at yourself or anyone else.</p>\r\n\r\n<p>Never put your hand, fingers or body directly in front of the spray nozzle.</p>\r\n\r\n<p>Devote your individual attention to the work being performed.</p>\r\n\r\n<p>Do not overreach. Keep proper footing and balance at all times.</p>\r\n\r\n<p>If the pressure cleaner is not working properly shut off the power and notify your supervisor.</p>\r\n\r\n<p>Do not operate the pressure cleaner when under the influence of medications or other mind-altering substances.</p>\r\n\r\n<p>Avoid distractions such as ear phones.</p>\r\n\r\n<p>Do not spray directly at glass or fragile objects.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2014-11-29 20:25:41', '2014-11-30 13:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `hc_user`
--

CREATE TABLE IF NOT EXISTS `hc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Avatar` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `last_logined` datetime DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `gender` enum('Male','Female','UnKnown') NOT NULL DEFAULT 'Male',
  `date_of_birth` date DEFAULT NULL,
  `view_jobs` enum('0','1') NOT NULL DEFAULT '1',
  `home_phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `interested_in` enum('Product Sales','Cleaning Services') NOT NULL DEFAULT 'Cleaning Services',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `country_id` (`country_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hc_user`
--

INSERT INTO `hc_user` (`id`, `Avatar`, `first_name`, `last_name`, `username`, `password`, `email`, `role_id`, `last_logined`, `salt`, `ip_address`, `gender`, `date_of_birth`, `view_jobs`, `home_phone`, `mobile_phone`, `street`, `city`, `state_province`, `country_id`, `zip_code`, `interested_in`, `created_at`, `updated_at`, `status`) VALUES
(4, '24917-9823_630321047032389_1685381627_n.jpg', 'Edreamz', 'Tech', 'admin', '5f0ea67c69d80df13ad9793ffa23da24', 'vinayak.n@edreamz.in', 1, NULL, NULL, NULL, 'Male', '1988-05-20', '1', '020-3434938', '748-544-4545', '123 main street', 'pune', 'maaharashtra', 1, '411051', 'Product Sales', '2014-11-14 00:00:00', '2014-12-07 08:31:17', '1'),
(8, '89733-Lighthouse.jpg', 'Rohit', 'Singraul', 'rohit.ss', 'cc03e747a6afbbcbf8be7668acfebee5', 'rohit.ss@edreamz.in', 5, NULL, NULL, NULL, 'Male', '1980-10-02', '1', '1234567890', '9876543210', 'Test Street', 'Test City', 'Test State', 15, '90001', 'Product Sales', '2014-11-17 04:51:31', '2014-12-07 08:30:44', '1'),
(9, '8380-Hydrangeas.jpg', 'Dhanashri', 'Desai', 'dhanashri', 'ceb6c970658f31504a901b89dcd3e461', 'dhanashri.d@edreamz.in', 6, NULL, NULL, NULL, 'Female', '1968-05-16', '0', '020454545', '68576867568', '2323 street', 'mumbai', 'maharashtra', 150, '5744857', 'Cleaning Services', '2014-12-07 14:04:07', '2014-12-07 08:37:13', '1'),
(10, '85482', 'Sadanand', 'Lomte', 'sadanand', 'ceb6c970658f31504a901b89dcd3e461', 'sadanand.l@edreamz.in', 3, NULL, NULL, NULL, 'Male', '1997-12-03', '1', '020454545', '68576867568', '2323 street', 'mumbai', 'maharashtra', 3, '5744857', 'Product Sales', '2014-12-07 14:30:12', '2014-12-07 09:00:12', '1'),
(11, '53433-Desert.jpg', 'Anna', 'Patil', 'anna', 'ceb6c970658f31504a901b89dcd3e461', 'anna@edreamz.in', 6, NULL, NULL, NULL, 'Male', '1995-12-03', '1', '020784512', '3256895623', '123 main street', 'Jabalpur', 'MH', 99, '411055', 'Product Sales', '2014-12-10 12:00:35', '2014-12-12 12:39:56', '1'),
(12, '87799', 'test', 'test', 'test', '202cb962ac59075b964b07152d234b70', 'test@test.com', 1, NULL, NULL, NULL, 'Female', '1986-03-24', '1', '9874563215', '6541239874', 'gove ', 'pune', 'mah', 99, '411051', 'Cleaning Services', '2014-12-16 17:33:13', '2014-12-16 12:03:13', '1'),
(13, '860', 'Nihar', 'N', 'nnihar', '73d51ecdd096538794c2da0dcce82e8b', 'nihar.n@edreamz.in', 3, NULL, NULL, NULL, 'Male', '1987-12-16', '1', '020784512', '3256895623', '123 main street', 'Jabalpur', 'State/Province', 1, '411055', 'Product Sales', '2014-12-23 18:58:39', '2014-12-23 13:28:57', '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hc_contact`
--
ALTER TABLE `hc_contact`
  ADD CONSTRAINT `hc_contact_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `hc_company` (`id`);

--
-- Constraints for table `hc_job_site_supervisor`
--
ALTER TABLE `hc_job_site_supervisor`
  ADD CONSTRAINT `hc_job_site_supervisor_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `hc_quote_jobs` (`id`);

--
-- Constraints for table `hc_job_staff`
--
ALTER TABLE `hc_job_staff`
  ADD CONSTRAINT `hc_job_staff_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `hc_quote_jobs` (`id`);

--
-- Constraints for table `hc_job_supervisor`
--
ALTER TABLE `hc_job_supervisor`
  ADD CONSTRAINT `hc_job_supervisor_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `hc_quote_jobs` (`id`);

--
-- Constraints for table `hc_quotes`
--
ALTER TABLE `hc_quotes`
  ADD CONSTRAINT `hc_quotes_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `hc_company` (`id`),
  ADD CONSTRAINT `hc_quotes_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `hc_contact` (`id`),
  ADD CONSTRAINT `hc_quotes_ibfk_3` FOREIGN KEY (`site_id`) REFERENCES `hc_site` (`id`),
  ADD CONSTRAINT `hc_quotes_ibfk_5` FOREIGN KEY (`service_id`) REFERENCES `hc_services` (`id`);

--
-- Constraints for table `hc_quote_job_services`
--
ALTER TABLE `hc_quote_job_services`
  ADD CONSTRAINT `hc_quote_job_services_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `hc_quote_jobs` (`id`);

--
-- Constraints for table `hc_user`
--
ALTER TABLE `hc_user`
  ADD CONSTRAINT `hc_user_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `hc_countries` (`id`),
  ADD CONSTRAINT `hc_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `hc_group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
