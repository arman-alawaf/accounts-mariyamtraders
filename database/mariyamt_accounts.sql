-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2025 at 08:08 AM
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
-- Database: `mariyamt_accounts`
--

-- --------------------------------------------------------

--
-- Table structure for table `buys`
--

CREATE TABLE `buys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buys`
--

INSERT INTO `buys` (`id`, `supplier_id`, `created_at`, `updated_at`, `payment_id`, `total_amount`, `paid_amount`, `due_amount`, `date`) VALUES
(7, 102, '2025-10-16 23:56:04', '2025-10-16 23:56:04', 10, 0.00, 0.00, 0.00, NULL),
(8, 103, '2025-10-16 23:56:04', '2025-10-16 23:56:04', 11, 0.00, 0.00, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buy_items`
--

CREATE TABLE `buy_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buy_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buy_items`
--

INSERT INTO `buy_items` (`id`, `buy_id`, `product_id`, `note`, `unit_id`, `amount`, `quantity`, `created_at`, `updated_at`) VALUES
(16, 7, 106, 'Bulk purchase', 3, 10.00, 50, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(17, 7, 107, 'Fresh stock', 1, 5.00, 20, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(18, 8, 108, 'Special order', 5, 8.00, 30, '2025-10-16 23:56:04', '2025-10-16 23:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-emon@gmail.com|127.0.0.1', 'i:1;', 1759417580),
('laravel-cache-emon@gmail.com|127.0.0.1:timer', 'i:1759417580;', 1759417580),
('mariyam-enterprise-cache-hospital@gmail.com|127.0.0.1', 'i:1;', 1760676511),
('mariyam-enterprise-cache-hospital@gmail.com|127.0.0.1:timer', 'i:1760676511;', 1760676511);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`, `company_name`) VALUES
(1, 'Customer1', '2', 'customer1@gmail.com', 'aaa', '2025-10-02 05:52:15', '2025-10-02 05:52:15', NULL),
(2, 'Prof. Reagan Goyette', '+1-308-647-1558', 'mmraz@example.net', '783 Blaze Tunnel Apt. 091\nSchmittstad, AZ 98472-8267', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Champlin-Dach'),
(3, 'Naomi Von', '+1.605.479.9001', 'gcartwright@example.org', '542 Deonte Isle\nNew Ardithstad, SC 64182-0329', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hill and Sons'),
(4, 'Gisselle Schimmel', '+1-256-676-5344', 'mitchell.shemar@example.org', '2374 Stracke Bridge Suite 763\nMedhurststad, WY 82206-5264', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Konopelski-Schuster'),
(5, 'Dr. Kaci Wiegand IV', '364.562.0350', 'aparker@example.com', '5773 Cassin Knoll\nDomenickport, MI 39432-1405', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Feil Ltd'),
(6, 'Emilio Hagenes', '+1-607-579-9657', 'sylvia38@example.org', '22265 Jerrod Plain Apt. 386\nEast Aishastad, WV 68726-3791', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Gottlieb-Bashirian'),
(7, 'Kevon Breitenberg', '817.990.1141', 'hipolito81@example.com', '768 Boris Burgs Suite 621\nHelenaburgh, OK 75260-4352', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Von, Emard and Labadie'),
(8, 'Ms. Katherine Altenwerth II', '+19042643670', 'kellen.bernier@example.org', '30162 Moises Haven Suite 425\nRolfsonview, ME 64340', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rodriguez, Breitenberg and Fisher'),
(9, 'Wilhelmine Keebler', '1-731-333-1002', 'rosenbaum.arvid@example.com', '4043 Anderson Mountain\nKrystinatown, UT 55426-9318', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kassulke, Wilkinson and Hammes'),
(10, 'Anastasia Metz', '(678) 587-5955', 'erna.ohara@example.com', '395 Smitham Plains Apt. 728\nGrimesbury, WI 50759', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Tromp LLC'),
(11, 'Letitia Kautzer', '1-361-371-4226', 'fay29@example.com', '1966 Ratke Falls Apt. 593\nPort Amirburgh, ME 01873', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Schaden Inc'),
(12, 'Ms. Aryanna Goodwin', '+1-802-441-6305', 'miracle80@example.org', '9991 Sibyl Turnpike\nWeissnatborough, NC 01412-2492', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'O\'Keefe LLC'),
(13, 'Esteban DuBuque III', '(979) 985-9255', 'chelsey.cruickshank@example.com', '603 Kulas Drives\nEast Easton, SD 29848-0795', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Skiles, Kilback and Turner'),
(14, 'Aiyana Ebert', '+18506462119', 'lorena.smith@example.net', '501 Harvey Mountain\nDeonteview, NY 03782', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Okuneva, Bauch and Bradtke'),
(15, 'Jakayla Lang', '1-216-673-1474', 'avery.mann@example.net', '9760 Von Camp\nPurdyhaven, FL 49560', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Feest-Gleichner'),
(16, 'Prof. Demario Nikolaus', '(302) 822-2763', 'cnikolaus@example.org', '5083 Gerhold Forge\nLake Althea, PA 68747-2499', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Harber Group'),
(17, 'River Aufderhar I', '918-962-8016', 'albin45@example.org', '141 Dicki Course\nJoanneside, MO 37736-0289', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Olson, Hammes and Hilpert'),
(18, 'Danial Senger', '1-931-359-8571', 'ernestina.lindgren@example.net', '199 Schamberger Terrace Suite 138\nClevestad, ID 54018', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Borer-Heidenreich'),
(19, 'Prof. London Klocko IV', '909-390-7054', 'pkub@example.com', '8242 Letha View Suite 127\nWest Mckayla, KY 00068', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Aufderhar-Beahan'),
(20, 'Dashawn Olson DDS', '+1.631.597.7820', 'kiley44@example.com', '69076 Lind Parkway\nPaigeport, OH 77286-2409', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Borer, Tromp and Ondricka'),
(21, 'Joanny Quigley', '+14583767450', 'mollie.hand@example.org', '541 Chase Cliffs\nReingerburgh, AR 82492', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Gusikowski-O\'Connell'),
(22, 'Monroe Cummings MD', '574.785.9270', 'ashly66@example.com', '1703 Bailey Flat Apt. 135\nHeaneyfort, ME 94139', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Brakus, Kshlerin and Bergnaum'),
(23, 'Guido McKenzie I', '309-968-2255', 'mzemlak@example.org', '246 Shanel Wall\nEast Allene, HI 23204-3587', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Lubowitz-D\'Amore'),
(24, 'Ophelia Dicki', '+1-940-263-4044', 'patience23@example.org', '60563 Feest Pass\nSchultzhaven, IL 44146-3963', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Nicolas Ltd'),
(25, 'Prof. Lucy Mosciski', '(930) 716-4077', 'dkassulke@example.org', '684 Presley Summit\nCormierview, VA 91301-1757', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Keeling-Torp'),
(26, 'Romaine Reinger', '+1 (341) 466-1393', 'jamal.hessel@example.net', '777 Koepp Orchard\nSouth Garrettview, MN 80312-2161', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Gutkowski LLC'),
(27, 'Nico Gislason', '+1-626-823-0837', 'santiago59@example.org', '70436 Sipes Coves\nCasperland, HI 81641-2961', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Parker PLC'),
(28, 'Jordyn Armstrong Jr.', '1-781-936-5159', 'effertz.callie@example.com', '403 Denesik Club Apt. 909\nSchambergerfurt, NJ 16648-5281', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Raynor Group'),
(29, 'Lincoln Borer', '512.414.7364', 'hcasper@example.org', '7947 Nathanael Avenue Suite 049\nWest Carsonborough, ND 31211', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Connelly, Konopelski and Morissette'),
(30, 'Prof. Deion Hane I', '283-862-0999', 'holden28@example.org', '5678 Amani Road Apt. 215\nRomaguerabury, MI 57829', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Schuppe, Little and Von'),
(31, 'Desmond Walker', '+1 (820) 305-4168', 'sherwood05@example.org', '67407 Alanis Glens Suite 270\nPort Roma, WV 92055-5959', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Murazik, Kerluke and Klein'),
(32, 'Norwood Welch', '+17249365476', 'zcummerata@example.org', '2346 Floyd Trail\nLake Kamron, UT 42659', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Kemmer-Schiller'),
(33, 'Eula Stark', '+1 (318) 597-1294', 'charley49@example.net', '3775 Rodrick Tunnel\nEast Elsie, ME 66748', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Cole-Christiansen'),
(34, 'Kasandra Kunze', '434.429.4223', 'lkozey@example.org', '7394 Stokes Common\nEast Maegan, HI 23494', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Goldner, Murazik and Dach'),
(35, 'Isai Jones', '708-982-0269', 'kconnelly@example.net', '3501 Jeanette Mountains Suite 993\nHackettmouth, RI 27532', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'McGlynn, Quitzon and Kunze'),
(36, 'Samir Rau', '+1.562.923.4570', 'urau@example.org', '49758 O\'Keefe Locks\nBednartown, IL 35450', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Mitchell-McDermott'),
(37, 'Zola Welch III', '+1-864-457-6816', 'ivah70@example.net', '11659 Beer Turnpike\nAyanashire, NM 91584', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Wolf, Kessler and Schulist'),
(38, 'Judy Satterfield', '978.255.9807', 'priscilla78@example.com', '8674 Wuckert Branch\nBridgetshire, CO 54514', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Jones PLC'),
(39, 'Alene Wisozk', '1-830-500-6905', 'brad52@example.org', '6706 Christiansen Overpass Suite 310\nNew Chyna, ME 29702', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Ernser-Halvorson'),
(40, 'Sammy Conroy', '+1-223-651-5326', 'aryanna.kirlin@example.net', '2991 Spinka Union Apt. 234\nEast Geovanni, IL 96928', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Tillman PLC'),
(41, 'Alexzander Robel', '+1 (352) 254-1638', 'nicholaus.erdman@example.com', '13468 Queenie Rapid Suite 572\nLittleborough, OR 08144', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Welch, Hettinger and Hodkiewicz'),
(42, 'Jayda Becker', '1-848-337-7167', 'haley.kaci@example.com', '72999 Marquise Station\nEast Isidroville, IN 30338', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Pfannerstill Inc'),
(43, 'Ashly Nicolas', '+1-276-376-1147', 'cameron11@example.net', '961 Kohler Freeway\nNorth Kariside, NJ 05239-2522', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Reinger-Howell'),
(44, 'Dock Hintz', '+1-564-714-8552', 'ernesto.turner@example.org', '74902 Lew Wall\nSouth Santafurt, NJ 73048-3393', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Borer, Sipes and Hudson'),
(45, 'Nelda O\'Keefe', '(435) 872-0646', 'kaley17@example.com', '924 Heathcote Islands Apt. 315\nSelinaview, ME 71236', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Erdman, Thompson and Wolff'),
(46, 'Sedrick Russel', '+1 (951) 898-9632', 'jovanny93@example.org', '6116 Batz Squares\nSouth Vinniemouth, MD 80191-8091', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Dickinson, Pacocha and Hyatt'),
(47, 'Laurianne Leuschke', '+1.463.345.2011', 'sterling.cole@example.net', '1770 Williamson Ways Suite 684\nWest Tomasa, SC 94799-8235', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Harber, Wilderman and Hintz'),
(48, 'Prof. Anastasia Osinski', '1-715-549-2866', 'amya.breitenberg@example.com', '772 Beer Underpass Apt. 679\nJohnathonmouth, FL 57897-6612', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Dicki-Bartoletti'),
(49, 'Berenice Mueller', '+1-703-798-1801', 'travon69@example.com', '610 Kiehn View Suite 528\nBernierborough, MD 66478', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Kilback, Lowe and Simonis'),
(50, 'Prof. Meagan Schamberger II', '1-830-980-4224', 'sandra.boyle@example.org', '18450 Smith Valleys\nRoobchester, WY 29480', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Wyman-Marks'),
(51, 'Esperanza Keeling', '1-910-279-3399', 'gkris@example.net', '8083 Cora Islands\nMayertberg, MD 23637-1613', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Connelly PLC'),
(52, 'Parker White III', '+1 (971) 990-3747', 'reanna50@example.org', '82322 Sydni Ports Apt. 394\nBaileyville, SD 30507-2381', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Reichel, Morissette and Howell'),
(53, 'Elena Weimann II', '252-923-1734', 'khalil36@example.com', '602 Hauck Vista\nLake Einarmouth, NH 00056', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Schamberger-Tremblay'),
(54, 'Mrs. Hortense Kihn MD', '+1 (269) 439-5998', 'annette46@example.org', '337 Justine Crossing Suite 263\nAdamfurt, NY 82140', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Johnson Inc'),
(55, 'Hermann Ullrich Jr.', '1-567-742-9079', 'kamron71@example.org', '21514 Hill Mill\nEast Zelma, NV 92659', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Ward, Casper and Johns'),
(56, 'Mr. Javonte Green Jr.', '+15592561281', 'kailee48@example.org', '38942 Ephraim Parks Apt. 547\nHesselview, CT 73732-0417', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Cormier Group'),
(57, 'Mohammad Tromp I', '202.677.5906', 'dibbert.trevor@example.com', '4853 Baby Pass Apt. 435\nKohlerport, NE 28858', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Wiegand-Rohan'),
(58, 'Kaci Baumbach PhD', '(352) 651-7707', 'wyman.kathleen@example.org', '46586 Hills Shoal\nWest Rosemaryhaven, OR 23849-9141', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Nicolas-Feeney'),
(59, 'Nellie Mitchell', '1-775-945-4865', 'tiana.kuhic@example.com', '7208 Abbott Lane\nPort Larryport, SD 54728', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Wolf-Orn'),
(60, 'Prof. Richie Littel', '1-458-924-7076', 'padberg.angelica@example.org', '2691 Will Fall\nWest Brendenville, OR 42994-6236', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Corkery-Kohler'),
(61, 'Estell Reichel', '925-729-4044', 'ben19@example.org', '3574 Robel Shore Apt. 370\nKertzmannshire, NE 35995-7644', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Kessler-Lubowitz'),
(62, 'Columbus Spinka', '279.407.4782', 'jwilkinson@example.com', '7708 Braulio Crossroad Suite 685\nSouth Oceanemouth, CT 71909-8303', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Medhurst, Flatley and Simonis'),
(63, 'Dr. Fleta Rau', '(458) 519-5680', 'grant06@example.org', '8766 Hardy Rapids Apt. 298\nStrackeberg, IA 50599', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Kiehn Ltd'),
(64, 'Douglas Kassulke MD', '1-507-463-7404', 'huel.fabiola@example.org', '4739 Brown Loop\nMyraborough, ID 62275', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Pacocha-Erdman'),
(65, 'Cassandra Zieme', '1-717-843-2109', 'isabell.bednar@example.org', '5438 Amos Pines\nEast Lesliefurt, WI 08866-7043', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Langworth-Sauer'),
(66, 'Euna Ortiz DVM', '+1-717-378-7687', 'casey.lueilwitz@example.org', '9314 Brown Mountains\nGrahamburgh, VA 22496-9584', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Harris-Koelpin'),
(67, 'Sherwood Nicolas', '947.576.4150', 'marianne99@example.net', '51643 Haven Streets\nReynoldside, NY 47851-2659', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Watsica and Sons'),
(68, 'Hillary Jenkins', '(586) 844-4672', 'baron.stroman@example.net', '11931 Mertz Street\nWest Albertha, TN 93030', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Cassin-Feest'),
(69, 'Miss Georgette Gusikowski Jr.', '+1 (417) 636-1506', 'gwen31@example.net', '85894 Kovacek Camp\nKatrineberg, GA 91870-2227', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Walter, Farrell and Stark'),
(70, 'Ellie O\'Conner', '609-838-5976', 'dereck.johnston@example.net', '7518 Barrows Glens\nWeimannberg, AK 52303', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Stoltenberg-Little'),
(71, 'Orlando Veum', '1-220-784-9365', 'helena.hayes@example.org', '307 Hagenes Flats Apt. 784\nWest Arch, WV 27040-7171', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'McDermott PLC'),
(72, 'Dr. Jonathan Kshlerin MD', '+1 (720) 781-3308', 'jaycee10@example.com', '7995 Zackery Light Apt. 412\nGislasonland, FL 19399-4390', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Price-Gerhold'),
(73, 'Emmet Von', '+1-405-336-3646', 'rosendo34@example.com', '484 Prosacco Forges\nNew Jessika, UT 67854', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Ondricka-Cruickshank'),
(74, 'Dr. Colby Gerlach', '1-516-343-6572', 'kaylee.howe@example.com', '8567 Hirthe Village\nKrajcikview, IL 17490', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Spinka-Lynch'),
(75, 'Peggie Goldner', '+16025525913', 'ffarrell@example.net', '726 Zboncak Drive Suite 027\nNorth Joana, AZ 14981', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Hansen, Schuppe and Stark'),
(76, 'Mrs. Alana Eichmann DDS', '479-765-9783', 'kane47@example.com', '497 Malvina Forks\nNorth Celestineland, MI 09019-7356', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'McCullough, O\'Keefe and Harber'),
(77, 'Ila Considine', '540-216-9619', 'sister72@example.com', '570 Muller Court Apt. 504\nDachhaven, CT 11528-0421', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Hirthe-Shanahan'),
(78, 'Loren Haley', '918.382.3072', 'raymundo.stiedemann@example.com', '1521 Ziemann Forks\nLake Friedaport, IL 09209-7692', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Senger, Tillman and Kub'),
(79, 'Miss Melba Runolfsson', '838-572-7944', 'thompson.shirley@example.net', '9338 Schmitt Trafficway Apt. 868\nWest Jayland, NY 90441', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'King-Dach'),
(80, 'Janice Macejkovic', '+1.458.745.4186', 'yhagenes@example.org', '96866 Treutel Circle Apt. 042\nSouth Hannahstad, AK 18968', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Dietrich LLC'),
(81, 'Abbey Wisozk DDS', '+1.828.438.8655', 'reynolds.jalyn@example.org', '4526 Sage Trail\nJettport, OR 71291', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Rutherford, O\'Keefe and Lehner'),
(82, 'Selina Kovacek PhD', '+13525285561', 'roselyn81@example.net', '375 Freddie Squares Apt. 264\nScarlettbury, AK 28439-5053', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Koss-Brown'),
(83, 'Carolyne Collier', '570-874-8475', 'xhaag@example.net', '8927 Cassidy Extensions Apt. 209\nCummeratamouth, UT 07037', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Murazik and Sons'),
(84, 'Dr. Jovany Ullrich MD', '+1-308-255-1602', 'dtorp@example.com', '978 Pfeffer Ville Apt. 302\nSpencerland, WV 93637-5352', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Smith-Herman'),
(85, 'Bessie Will', '+1 (419) 746-6464', 'carole54@example.com', '9282 Kertzmann Haven\nAdonisstad, MD 38136-5014', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Jerde Group'),
(86, 'Mr. Eliseo Lehner DDS', '(804) 242-1939', 'streich.vada@example.net', '320 Ibrahim Squares\nPort Orentown, WI 58419', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Gerlach-Klein'),
(87, 'Leda Jast', '+1 (731) 903-1102', 'idicki@example.org', '9869 Nicolette Inlet Suite 062\nNew Gia, HI 44203', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Ullrich, Barrows and Luettgen'),
(88, 'Abigale Grimes', '(283) 581-0233', 'fjohns@example.com', '7519 Seth Cliffs Suite 951\nWalkerport, FL 06474', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Heidenreich, Jenkins and Rodriguez'),
(89, 'Paxton Cartwright', '(828) 990-7772', 'larkin.chaz@example.com', '30102 Samantha Burg\nSouth Raphaelle, MN 62236', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Lehner, Ebert and Roob'),
(90, 'Dion Dach', '+1-657-539-4478', 'rmayer@example.org', '84344 Kenton Parks Suite 578\nVestaburgh, MA 31262', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Langworth Group'),
(91, 'Berenice Rippin III', '+1-646-414-5151', 'lazaro86@example.net', '7038 Lebsack Ports\nLabadiefort, FL 26438', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Lueilwitz, Mohr and Tromp'),
(92, 'Larry Conn', '+1-847-926-6913', 'carson27@example.com', '931 Cormier Street Apt. 618\nNorth Ceciliafort, ID 19094', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Cummings, Bode and Zieme'),
(93, 'Nelson Hilpert', '(385) 276-7265', 'bwill@example.net', '32636 Muller Junction\nNew Meaghanchester, HI 93737', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Brown, Feil and Halvorson'),
(94, 'Dr. Adalberto Bode', '+1-458-913-0430', 'ezekiel.thompson@example.com', '1704 Marshall Corner Apt. 459\nNew Casimir, RI 28317', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Kessler, Hyatt and Frami'),
(95, 'Prof. Garnett Goldner', '+1 (458) 750-6653', 'qschaden@example.com', '550 Altenwerth Drives Suite 195\nDaleside, VA 87260-0850', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Little-Denesik'),
(96, 'Kody Orn I', '443-719-7760', 'ward.soledad@example.org', '5830 Eichmann Ports\nErdmanmouth, MS 77041-3098', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Gleason PLC'),
(97, 'Marc Johnson', '269-658-6074', 'ada.leannon@example.com', '45537 Gregory Cove Suite 887\nNew Delaney, PA 75458', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Conroy-Ernser'),
(98, 'Kylie O\'Keefe', '(971) 486-0031', 'plemke@example.org', '9346 Joanny Tunnel\nMertzport, TN 16560-5642', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Walker, Bogisich and Veum'),
(99, 'Kelsie Kemmer', '(520) 972-2183', 'zbraun@example.org', '5463 Spinka Ramp Suite 363\nSawaynstad, MO 45721', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Quigley, Price and Kemmer'),
(100, 'Jayde Lesch', '779.660.4501', 'raleigh04@example.org', '939 Kaitlyn Highway Apt. 709\nChristinestad, MS 28874-3525', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Jenkins Ltd'),
(101, 'Lulu Hartmann', '+1-251-659-8228', 'sgerlach@example.com', '174 Ledner Pass\nKunzebury, SD 13539', '2025-10-16 23:11:33', '2025-10-16 23:11:33', 'Okuneva, Kuhn and Dickens'),
(102, 'Customer A', '1111111111', 'customerA@example.com', 'Address C', '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(103, 'Customer B', '2222222222', 'customerB@example.com', 'Address D', '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(104, 'Zoe Reichert', '808.901.3979', 'naomie.schowalter@example.net', '1679 Elmira Fall\nBryanaport, AL 79577', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Torphy Group'),
(105, 'Miss Corrine Mitchell', '+1.817.868.1777', 'marilou95@example.com', '6276 Jarvis Station Suite 919\nAvaport, WA 32542-0915', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kautzer LLC'),
(106, 'Connie Hilpert', '(559) 879-7438', 'heloise.langworth@example.org', '628 Caleigh Ports\nRitchieside, IN 59937', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hessel, Jerde and Bruen'),
(107, 'Fae Kreiger', '1-636-977-8422', 'xebert@example.org', '904 Schuppe Falls\nKerlukefurt, NY 83474-1115', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Barrows, O\'Reilly and Kirlin'),
(108, 'Ms. Retha Nikolaus', '+1-415-520-5930', 'kody.wunsch@example.org', '3997 Grant Junction Apt. 029\nGutkowskihaven, ND 42343-3396', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Auer-Reilly'),
(109, 'Lafayette Beier', '+1-760-772-4667', 'price.jaden@example.com', '90905 Aleen Isle Apt. 740\nWest Rogeliofort, GA 85371-0587', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Breitenberg LLC'),
(110, 'Colt Kulas', '1-281-649-9449', 'veronica04@example.org', '174 Brielle Squares\nRoychester, NV 29169-3575', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'O\'Kon and Sons'),
(111, 'Maverick Schultz', '757.359.1054', 'kling.cordia@example.org', '1509 Dereck Coves\nNew Ari, VA 85311-3300', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bernier Group'),
(112, 'Robb Hoeger', '+1-737-476-6335', 'orlando.vonrueden@example.com', '19697 Boehm Overpass Suite 342\nAnkundinghaven, CT 35658-4282', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bogisich Ltd'),
(113, 'Gussie Simonis', '+1-667-901-8457', 'ssauer@example.org', '44103 Leannon Radial\nNorth Chesley, ME 21240-7632', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hill, Anderson and Lockman'),
(114, 'Dr. Jalon Upton Jr.', '+1.520.973.2042', 'kuphal.kory@example.org', '82598 Shanahan View Suite 839\nEast Darleneberg, CT 82695-9720', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Thompson PLC'),
(115, 'Telly Beahan', '1-915-946-2525', 'crist.scot@example.net', '34573 Adonis Summit\nAlexzanderfort, IN 63286-0139', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Rohan-Hamill'),
(116, 'Florine Abshire', '+1-713-718-5289', 'weldon02@example.com', '1207 Turner Circle Apt. 959\nAdellemouth, AL 74873', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bauch, Gaylord and Blanda'),
(117, 'Keenan Funk', '585.451.1401', 'leonel02@example.net', '2934 Feeney Mountains\nEmmetborough, MT 68292-7088', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Von and Sons'),
(118, 'Glennie Mosciski', '+1.240.567.9192', 'eldridge.prosacco@example.com', '23035 O\'Reilly Greens Apt. 845\nWest Malvina, KS 40282-4109', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Stracke Inc'),
(119, 'Guiseppe Nienow', '740.645.7807', 'idooley@example.com', '2829 O\'Reilly Haven\nJastmouth, CT 18550', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hackett Inc'),
(120, 'Lorine Hamill', '+1.872.462.2931', 'ywalker@example.org', '272 Maymie Throughway Suite 521\nNorth Georgetteview, SC 17824', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kessler, Heller and Rath'),
(121, 'Nash Lind', '+1-564-770-2399', 'britney78@example.net', '4252 Renner Forge Apt. 805\nAmericomouth, TN 04981-6453', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Corkery, Crona and Labadie'),
(122, 'Shea Ondricka', '(725) 531-6778', 'maye16@example.net', '804 Lubowitz Hill Suite 164\nBeierport, FL 47239', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Miller-Thiel'),
(123, 'Miss Bernita Gottlieb', '(863) 808-3310', 'tkilback@example.com', '3859 Hans Brook\nJonathanmouth, OK 98100', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hegmann LLC'),
(124, 'Wilfrid Larkin DDS', '985-387-4642', 'schulist.mallie@example.com', '520 Aurelie Squares Apt. 610\nHeathcotefort, AK 72200-5729', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Balistreri, Russel and Muller'),
(125, 'Dr. Drew Hoeger', '830.527.9539', 'lenore.kirlin@example.net', '967 Willms Ridges Apt. 632\nDonatoland, WA 01591-7360', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Towne-Koch'),
(126, 'Dr. Velma Moore MD', '+17047038076', 'rrau@example.org', '29431 Paucek Meadows\nLafayettemouth, WV 85121-5549', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Connelly, Will and Lebsack'),
(127, 'Dr. Emmie Hodkiewicz DDS', '959.619.5140', 'rhintz@example.net', '1453 Bayer Plaza\nLake Modesta, UT 27493-3246', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Franecki, Rutherford and Yundt'),
(128, 'Jevon Buckridge', '915.273.2914', 'ibernhard@example.com', '284 Brent Shores\nRohanfurt, AZ 37195-2438', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Beer and Sons'),
(129, 'Brenden Nader', '714-401-1987', 'hbayer@example.net', '768 Reagan Ridge\nDeangelofort, SD 40607-7224', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Moore-Gottlieb'),
(130, 'Jessy Hill', '727-839-9938', 'keenan.schuppe@example.org', '41037 Dicki Squares\nNorth Betsyton, ID 36286', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Pagac PLC'),
(131, 'Prof. Paula Ebert', '279.387.5205', 'jarod.kuphal@example.org', '21708 Roel Oval\nSouth Amirberg, WA 98887', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Batz-Kuhlman'),
(132, 'Floy Kessler', '(347) 450-0945', 'steuber.oren@example.com', '44714 Providenci Junction\nCliffordmouth, MO 20842-8720', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hyatt, Corkery and Stark'),
(133, 'Seamus McClure', '831-949-0386', 'gino47@example.net', '483 Marvin Harbors Suite 628\nNorth Coyborough, SC 14009', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Welch LLC'),
(134, 'Mr. Curtis Cormier I', '+1-512-290-2095', 'claudia14@example.com', '42148 Osborne Springs\nLake Aishatown, ME 40330', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Stehr-Rath'),
(135, 'Henriette Kemmer', '662.288.7590', 'cristopher.hagenes@example.com', '928 Kylee Land\nNorth Lenora, AL 24176-0221', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Carroll PLC'),
(136, 'Charlie Brakus', '678-264-0492', 'carter.alexandrine@example.org', '18447 Wilkinson Grove\nRicardobury, DE 56706', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Vandervort, Halvorson and Ullrich'),
(137, 'Lonzo Sawayn', '502-868-8694', 'adicki@example.org', '477 Ellen Pike\nElisefort, ID 74230-7593', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Douglas, Graham and Herzog'),
(138, 'Lelah Herzog', '+1 (559) 717-8853', 'reva.fay@example.org', '287 Daniella Fork Suite 344\nEast Lafayette, DC 31397-7520', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Fisher-Johns'),
(139, 'Orin Ritchie', '806-812-6255', 'zmitchell@example.net', '836 Jaron Gateway\nKemmerton, CT 08910', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bruen PLC'),
(140, 'Dr. Clint Stamm DVM', '(845) 886-4724', 'gorczany.tessie@example.com', '1063 Celia Fords\nKadentown, SD 89518-1771', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Haley-Ankunding'),
(141, 'Miss Daisy Kiehn', '+1.408.733.6028', 'heaney.malvina@example.com', '158 Jovan Mews Apt. 189\nNonamouth, NC 50580-4530', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Abbott, Kautzer and Koch'),
(142, 'Hellen Hauck I', '+1-469-577-6638', 'braun.mathilde@example.net', '6646 Laila Highway Apt. 084\nDuBuqueview, KY 06840', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Witting-Mayer'),
(143, 'Lorna Jacobs', '+1-281-426-3812', 'volkman.brielle@example.org', '86358 Myron Trafficway\nPort Kaela, FL 83454-9805', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Langworth, Mante and Schneider'),
(144, 'Floy Schmeler', '562-772-6145', 'stracke.claire@example.net', '8990 Kasandra Run\nSouth Juana, CO 79608-4311', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Stroman Group'),
(145, 'Dr. Elouise Windler', '+1-234-561-3346', 'charles66@example.com', '4805 Rubye Shoals Apt. 872\nSouth Lexiport, OK 87867-7842', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kessler, Hahn and Nienow'),
(146, 'Brooks Klocko', '+1-562-466-5171', 'matilde87@example.org', '1355 Jaskolski Center Apt. 563\nWest Geofort, ME 02708-3206', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Turner LLC'),
(147, 'Caroline Jerde DDS', '+1-737-582-9808', 'cassin.caitlyn@example.org', '35309 Emard Ranch Apt. 631\nThielhaven, IL 04502-0746', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Moen, Morissette and Gulgowski'),
(148, 'Prof. Kaycee Johnston', '+1 (907) 789-4396', 'cathrine61@example.net', '395 Lind Springs\nSouth Nils, VA 35498-2164', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Anderson LLC'),
(149, 'Freeda Jast', '480-761-9911', 'boyer.eleonore@example.com', '1963 Watsica Forks\nEast Ismael, NJ 75188-2290', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Sipes Ltd'),
(150, 'Alycia Rolfson', '+1-843-213-6291', 'hailie28@example.org', '413 Terry Grove Suite 298\nAbelstad, NJ 45031', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Gleichner, Hintz and DuBuque'),
(151, 'Cayla Grimes', '1-979-568-4768', 'nikolaus.don@example.org', '6158 Morissette Meadow Suite 703\nNew Braxton, WI 20093-9464', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Cartwright-Schulist'),
(152, 'Miss Leonora Witting V', '(617) 475-3555', 'talia06@example.org', '87260 Blick Keys\nAshleestad, PA 34924', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Quigley Group'),
(153, 'Prof. Milo Bahringer', '+1.725.593.3540', 'mharris@example.com', '5518 Julien Wells Apt. 586\nEast Robertaside, CT 50824', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Crona-Graham'),
(154, 'Jace Kuphal', '(281) 373-0991', 'koss.germaine@example.net', '834 Kianna Estate Suite 901\nHaskellberg, GA 60894', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Schinner Ltd'),
(155, 'Ms. Ludie Conn V', '1-458-818-4377', 'sydni.schamberger@example.com', '6425 Sauer Vista Suite 274\nNorth Albertton, ME 45025-6475', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Schinner-Cormier'),
(156, 'Alexandre Nikolaus', '+1-562-490-0647', 'homenick.gennaro@example.com', '2649 Edward Creek Suite 771\nSouth Bernicefurt, KS 57412', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Grant, Mayer and Lehner'),
(157, 'Mr. Deonte Hoppe', '(318) 464-2713', 'herta.balistreri@example.com', '3705 Bud Shore\nCharityburgh, NJ 64132', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Runolfsdottir, Pollich and Auer'),
(158, 'Danielle Aufderhar', '534.612.1437', 'nikko.auer@example.net', '5281 Raphael Place\nNorth Bethland, SD 20770-5070', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Raynor, Mills and Kris'),
(159, 'German Gutkowski', '606.307.0199', 'isom.nader@example.net', '93178 Alden Drives Suite 660\nSouth Emmanuel, MS 29104-9367', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bogisich-Feil'),
(160, 'Justus Herzog DDS', '559-350-1737', 'chelsea32@example.com', '4530 Avis Center\nSmithammouth, MA 56570-5849', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'VonRueden, Kihn and Becker'),
(161, 'Mr. Ford Veum I', '(540) 885-0881', 'marvin98@example.net', '8256 Anibal Junction\nMaximetown, KY 51892-0929', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Beier, Veum and Greenfelder'),
(162, 'Judah Cummings', '760.292.9089', 'eleonore.hill@example.com', '4551 Gregg Green Apt. 973\nSouth Sabrynabury, MT 03022-6232', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lindgren Group'),
(163, 'Ms. Amalia Kirlin III', '1-832-952-5018', 'rmckenzie@example.org', '59901 Greta Green\nNew Shannonport, CO 35895', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Berge, Wuckert and Schuster'),
(164, 'Mrs. Lillian Medhurst Jr.', '914-542-1635', 'keegan30@example.org', '664 Collins Crossroad Suite 227\nHegmannfurt, OR 19484', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Thompson Group'),
(165, 'Dr. Jaylen Haag V', '+1-774-239-0379', 'bergstrom.judy@example.net', '9333 Breitenberg Ports\nMireillefurt, HI 88252', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Konopelski-Herman'),
(166, 'Dorcas Daniel', '+1-207-312-8863', 'adams.sienna@example.net', '6103 Kautzer Keys\nThompsonhaven, MS 99222-4051', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Brown, Lockman and Nikolaus'),
(167, 'Darryl Schiller Sr.', '+1.332.476.9925', 'kirsten.nikolaus@example.com', '4364 Bins Plains Suite 732\nNorth Avisville, ND 71337', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Gibson, White and Wunsch'),
(168, 'Gerardo Goyette', '205-210-3297', 'barton.macie@example.org', '8216 Hermann Manors Suite 268\nEast Elsie, AL 57040-1810', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Swift PLC'),
(169, 'Loma Rath', '737.670.0004', 'jasen46@example.net', '403 Wisozk Square\nNorth Kirk, FL 72349', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Walter Inc'),
(170, 'Kiley Champlin', '(407) 381-5170', 'harvey.zane@example.org', '69409 Chelsea Bridge\nPort Paxtonshire, MA 96197', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Rempel-Corkery'),
(171, 'Dr. Katlynn Schuppe', '+19794633513', 'graciela.homenick@example.org', '81595 Balistreri Estate Apt. 859\nWest Blakeshire, PA 01995', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Welch and Sons'),
(172, 'Katlynn Krajcik', '(785) 375-2974', 'angie07@example.com', '5020 Misty Views\nPort Ethanfort, CA 43707-7169', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Gleichner, Kassulke and Grimes'),
(173, 'Benny Jerde', '1-662-290-2660', 'adelia.turner@example.org', '86798 Krista Plaza\nDovieborough, WY 01774', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Purdy-Boyer'),
(174, 'Dr. Maybell Hyatt', '475-917-4149', 'ciara.connelly@example.org', '90438 Lempi Hills\nLake Santa, NM 27099-5860', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Sauer and Sons'),
(175, 'Pearlie Collins', '1-551-346-9584', 'zmertz@example.org', '37353 Amina Roads Apt. 939\nSouth Fausto, KY 37571-9695', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Stanton, Deckow and Gusikowski'),
(176, 'Dr. Bill Toy Sr.', '828-858-1289', 'gerry17@example.org', '4244 Gabriel Spring Apt. 160\nHannahfort, AL 95509', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kutch-Crona'),
(177, 'Tierra Reinger DVM', '+19206254767', 'zkling@example.net', '131 Douglas Viaduct\nGutkowskimouth, GA 87135-8928', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Ondricka-Wiegand'),
(178, 'Minerva Funk IV', '+1.458.896.6432', 'kub.willis@example.org', '647 Denesik Ferry\nCorwinton, IL 58429-3753', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Rempel Inc'),
(179, 'Nelda Conn', '+19515366919', 'lebsack.sidney@example.com', '439 Block Drive\nLegrostown, AK 89057-9389', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Torphy-Bauch'),
(180, 'Ike Grady III', '+1.272.893.5036', 'murray.whitney@example.com', '38621 Grady Cliff Apt. 720\nEddburgh, MS 37195-1063', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Yundt, Monahan and Schowalter'),
(181, 'Reginald Moen', '806-894-3745', 'mdaniel@example.net', '919 Abbigail Terrace\nNorth Laverne, KY 91294-2688', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Ratke, Labadie and Cronin'),
(182, 'Carol Marvin', '(424) 401-7903', 'ztromp@example.com', '18784 Williamson Landing\nPort Brandyn, NJ 33348-3010', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hermiston, Wiegand and Bergnaum'),
(183, 'Ms. Lexi Parisian I', '814-934-6705', 'sierra21@example.com', '369 Blanda Ramp\nPowlowskiberg, CA 46976', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Langworth-Kreiger'),
(184, 'Ms. Luna Roberts IV', '915-787-0314', 'dulce.hansen@example.org', '67576 Murray Fork\nPort Gonzalo, AL 06517-9849', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Schultz-Hamill'),
(185, 'Mr. Diego King III', '954.662.4643', 'scot60@example.com', '940 Kuvalis Crescent Apt. 589\nSouth Owen, MI 34917', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Olson, Skiles and Wuckert'),
(186, 'Dolly Keeling', '+1-838-665-7503', 'antonina.balistreri@example.net', '72580 Dayana Stream Suite 866\nNorth Mary, CT 49968-6932', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'McClure-Shanahan'),
(187, 'Jessie Swift DDS', '(276) 388-9443', 'bernier.reta@example.net', '8658 Schmidt Lodge Apt. 922\nO\'Keefechester, WV 02018-3587', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kunze, Parisian and Little'),
(188, 'Miss Audreanne Tillman Jr.', '+1 (531) 459-4695', 'ayana.cassin@example.org', '6201 Korey Trafficway Suite 569\nUllrichhaven, KS 86821-1440', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Rogahn Inc'),
(189, 'Scottie Wiza', '1-936-644-0122', 'zkuhic@example.org', '520 Brain Rue Apt. 775\nWest Kaelynshire, NE 84680', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kling-Sporer'),
(190, 'Marvin Harvey', '+1-351-996-8334', 'tkulas@example.net', '78108 Aditya Haven Apt. 980\nTesshaven, ME 33899', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Miller-Graham'),
(191, 'Prof. Tyshawn Schoen DVM', '(585) 321-9507', 'lennie.anderson@example.com', '5862 Brown Vista Apt. 908\nQueenland, SD 12625', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Orn-Beer'),
(192, 'Ms. Abagail Legros', '+17404361470', 'mathew63@example.org', '59144 Hill Summit\nLake Romanborough, NC 67889-3626', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Wolff, Baumbach and Ledner'),
(193, 'Prof. Eliseo Kerluke', '+17139633194', 'catharine.farrell@example.com', '743 Buckridge Prairie\nEudoraborough, MA 39126-8142', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Borer Inc'),
(194, 'Dr. Kamryn Heathcote DDS', '385.904.8616', 'agorczany@example.com', '9650 Graham Locks Suite 450\nAntoniettafort, WV 82340', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lebsack, Steuber and Baumbach'),
(195, 'Mr. Davion Halvorson I', '480-264-3176', 'vheathcote@example.org', '46639 O\'Kon Courts\nPort David, MI 13193-0625', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Wolf PLC'),
(196, 'Haylee Hirthe', '+1-320-476-3303', 'keon78@example.net', '8869 Mac Fields Suite 038\nWindlerstad, AL 59349-6461', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hauck, Frami and Schuster'),
(197, 'Raphael Hodkiewicz', '443.802.7879', 'tgislason@example.net', '488 Icie Center\nWest Will, UT 35172', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Jones, Wiegand and Schamberger'),
(198, 'Mary Bahringer', '+1 (931) 544-8394', 'kody11@example.org', '7413 Bechtelar Spur\nMitchellmouth, WY 12753-1921', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kreiger Inc'),
(199, 'Gay Fahey', '(986) 701-2932', 'carey.oconner@example.org', '3169 Merl Field Suite 046\nZoeside, NE 53595-3295', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Conn, Langosh and O\'Connell'),
(200, 'Augustine Davis', '734.308.9079', 'tledner@example.org', '617 Quigley Ways Suite 236\nFredaview, DC 62741', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lang PLC'),
(201, 'Christina Pagac', '+12195447310', 'karolann.ryan@example.com', '58152 Troy Garden\nNew Sofia, IL 44412', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Brown-Ankunding'),
(202, 'Oda Bartell', '(458) 410-8820', 'flittel@example.net', '32211 Crist Street Suite 982\nLake Gaston, CA 70359-6841', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Heathcote PLC'),
(203, 'Chadd Little', '+1-586-376-2811', 'dasia79@example.net', '349 Carole Junctions\nEast Jody, MS 04747-9504', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Luettgen and Sons'),
(204, 'Customer A', '1111111111', 'customerA@example.com', 'Address C', '2025-10-16 23:56:03', '2025-10-16 23:56:03', NULL),
(205, 'Customer B', '2222222222', 'customerB@example.com', 'Address D', '2025-10-16 23:56:03', '2025-10-16 23:56:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_02_075322_add_role_to_users_table', 1),
(5, '2025_10_02_083510_create_products_table', 1),
(6, '2025_10_02_084432_create_units_table', 1),
(7, '2025_10_02_085055_create_customers_table', 1),
(8, '2025_10_02_085712_create_suppliers_table', 1),
(9, '2025_10_02_090359_create_pay_types_table', 1),
(10, '2025_10_02_100637_create_sells_table', 1),
(11, '2025_10_02_100735_create_sell_items_table', 1),
(12, '2025_10_02_100839_create_payments_table', 1),
(13, '2025_10_02_100938_create_payment_items_table', 1),
(14, '2025_10_02_104602_create_buys_table', 1),
(15, '2025_10_02_104659_create_buy_items_table', 1),
(16, '2025_10_02_104700_add_buy_id_to_payments_table', 1),
(17, '2025_10_02_111512_make_sell_id_nullable_in_payments_table', 1),
(18, '2025_10_02_111928_add_payment_id_to_sells_table', 1),
(19, '2025_10_02_112010_add_payment_id_to_buys_table', 1),
(20, '2025_10_02_151435_add_foreign_key_buy_id_to_payments_table', 2),
(21, '2025_10_02_152002_add_amount_fields_to_sells_table', 3),
(22, '2025_10_02_152021_add_amount_fields_to_buys_table', 3),
(23, '2025_10_12_142600_add_date_to_buys_table', 4),
(24, '2025_10_12_143309_update_buys_date_from_created_at', 5),
(25, '2025_10_17_050025_add_company_name_to_suppliers_table', 6),
(26, '2025_10_17_050050_add_company_name_to_customers_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buy_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sell_id`, `created_at`, `updated_at`, `buy_id`) VALUES
(1, NULL, '2025-10-02 05:51:34', '2025-10-02 05:51:34', NULL),
(2, NULL, '2025-10-02 05:52:46', '2025-10-02 05:52:46', NULL),
(3, NULL, '2025-10-12 08:19:54', '2025-10-12 08:19:54', NULL),
(4, NULL, '2025-10-12 08:29:42', '2025-10-12 08:29:42', NULL),
(5, NULL, '2025-10-12 08:31:08', '2025-10-12 08:31:08', NULL),
(6, NULL, '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(7, NULL, '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(8, NULL, '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(9, NULL, '2025-10-16 23:11:33', '2025-10-16 23:11:33', NULL),
(10, NULL, '2025-10-16 23:56:04', '2025-10-16 23:56:04', NULL),
(11, NULL, '2025-10-16 23:56:04', '2025-10-16 23:56:04', NULL),
(12, NULL, '2025-10-16 23:56:04', '2025-10-16 23:56:04', NULL),
(13, NULL, '2025-10-16 23:56:04', '2025-10-16 23:56:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_items`
--

CREATE TABLE `payment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `paytype_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_items`
--

INSERT INTO `payment_items` (`id`, `payment_id`, `paytype_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1500.00, '2025-10-02 05:51:34', '2025-10-02 05:51:34'),
(2, 2, 2, 2000.00, '2025-10-02 05:52:46', '2025-10-02 05:52:46'),
(3, 3, 2, 58.00, '2025-10-12 08:19:54', '2025-10-12 08:19:54'),
(4, 3, 1, 61.00, '2025-10-12 08:19:54', '2025-10-12 08:19:54'),
(5, 4, 2, 56.00, '2025-10-12 08:29:42', '2025-10-12 08:29:42'),
(6, 4, 2, 38.00, '2025-10-12 08:29:42', '2025-10-12 08:29:42'),
(7, 5, 2, 42.00, '2025-10-12 08:31:08', '2025-10-12 08:31:08'),
(8, 5, 2, 64.00, '2025-10-12 08:31:08', '2025-10-12 08:31:08'),
(9, 5, 1, 23.00, '2025-10-12 08:31:08', '2025-10-12 08:31:08'),
(10, 6, 2, 350.00, '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(11, 7, 4, 240.00, '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(12, 8, 2, 190.00, '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(13, 9, 4, 96.00, '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(14, 10, 2, 350.00, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(15, 11, 4, 240.00, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(16, 12, 2, 190.00, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(17, 13, 4, 96.00, '2025-10-16 23:56:04', '2025-10-16 23:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `pay_types`
--

CREATE TABLE `pay_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pay_types`
--

INSERT INTO `pay_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bank', '2025-10-02 05:49:27', '2025-10-02 05:49:27'),
(2, 'Cash', '2025-10-02 05:49:34', '2025-10-02 05:49:34'),
(3, 'Cash', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(4, 'Credit Card', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(5, 'Bank Transfer', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(6, 'Cash', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(7, 'Credit Card', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(8, 'Bank Transfer', '2025-10-16 23:56:03', '2025-10-16 23:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(6, 'ex dicta', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(7, 'eius est', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(8, 'sunt impedit', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(9, 'quisquam inventore', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(10, 'libero rerum', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(11, 'perspiciatis quaerat', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(12, 'veniam ratione', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(13, 'sunt autem', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(14, 'hic et', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(15, 'doloremque ea', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(16, 'nobis ea', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(17, 'vel ipsam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(18, 'aut nihil', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(19, 'est repudiandae', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(20, 'voluptatem itaque', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(21, 'illo aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(22, 'sit sed', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(23, 'quo consectetur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(24, 'et ut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(25, 'saepe modi', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(26, 'nam eum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(27, 'quia et', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(28, 'tempora repellendus', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(29, 'et eaque', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(30, 'quod consequatur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(31, 'quae veniam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(32, 'qui aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(33, 'et totam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(34, 'tempora consequatur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(35, 'placeat a', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(36, 'esse ut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(37, 'maxime neque', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(38, 'voluptatibus eos', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(39, 'ex dolorem', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(40, 'suscipit sunt', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(41, 'illo commodi', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(42, 'laboriosam quia', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(43, 'et tenetur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(44, 'similique qui', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(45, 'occaecati nostrum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(46, 'blanditiis voluptas', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(47, 'dolorem nam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(48, 'omnis ut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(49, 'necessitatibus iste', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(50, 'rerum commodi', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(51, 'velit atque', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(52, 'incidunt unde', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(53, 'ea earum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(54, 'doloremque aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(55, 'accusantium excepturi', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(56, 'ea dolorum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(57, 'et aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(58, 'optio consequatur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(59, 'consequatur doloribus', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(60, 'distinctio officia', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(61, 'praesentium quia', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(62, 'eveniet itaque', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(63, 'alias quia', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(64, 'et ab', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(65, 'ut cum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(66, 'reprehenderit qui', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(67, 'optio molestias', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(68, 'et est', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(69, 'temporibus dolorem', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(70, 'quae ducimus', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(71, 'ad pariatur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(72, 'asperiores distinctio', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(73, 'voluptatibus numquam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(74, 'sapiente sapiente', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(75, 'veniam et', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(76, 'id aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(77, 'voluptas praesentium', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(78, 'autem qui', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(79, 'velit natus', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(80, 'similique harum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(81, 'quia iure', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(82, 'ullam aspernatur', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(83, 'nisi voluptatum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(84, 'ullam quaerat', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(85, 'aut quo', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(86, 'voluptas et', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(87, 'debitis earum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(88, 'eius sit', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(89, 'voluptatem laudantium', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(90, 'provident distinctio', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(91, 'nobis fugit', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(92, 'aperiam et', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(93, 'incidunt officiis', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(94, 'alias voluptas', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(95, 'dolore quaerat', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(96, 'qui perferendis', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(97, 'placeat rerum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(98, 'minima perspiciatis', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(99, 'vel est', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(100, 'quo aliquam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(101, 'sit rerum', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(102, 'quis qui', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(103, 'quo vel', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(104, 'ullam quam', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(105, 'aut aut', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(106, 'Product 1', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(107, 'Product 2', '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(108, 'Product 3', '2025-10-16 23:56:04', '2025-10-16 23:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `customer_id`, `created_at`, `updated_at`, `payment_id`, `total_amount`, `paid_amount`, `due_amount`) VALUES
(4, 102, '2025-10-16 23:56:04', '2025-10-16 23:56:04', 12, 0.00, 0.00, 0.00),
(5, 103, '2025-10-16 23:56:04', '2025-10-16 23:56:04', 13, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `sell_items`
--

CREATE TABLE `sell_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_items`
--

INSERT INTO `sell_items` (`id`, `sell_id`, `product_id`, `note`, `unit_id`, `amount`, `quantity`, `created_at`, `updated_at`) VALUES
(5, 4, 106, 'Retail sale', 3, 15.00, 10, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(6, 4, 107, 'Discounted', 1, 8.00, 5, '2025-10-16 23:56:04', '2025-10-16 23:56:04'),
(7, 5, 108, 'Wholesale', 5, 12.00, 8, '2025-10-16 23:56:04', '2025-10-16 23:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6nPgqEBZIUTjg75HvXcuN6tCFt2CR32Xqs1E5mZS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiajJuNFVxWFA4VTZGYU1nSEt0M2JqVDZnNllhSUdzOTcxdUs0UGFtSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzYwNjc2NDU2O319', 1760680961);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`, `company_name`) VALUES
(2, 'Hilma Frami', '1-516-308-4184', 'blaise14@example.com', '5720 Rubie Estate\nTerrencehaven, LA 34263-9076', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Dickens-Oberbrunner'),
(3, 'Mrs. Patricia Upton', '(432) 235-8150', 'gaylord.irwin@example.com', '23527 Buckridge Stravenue\nPort Ines, TN 14171', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Powlowski Group'),
(4, 'Mrs. Megane Stanton', '1-847-944-7482', 'ystoltenberg@example.net', '24093 Eleonore Cape\nLake Abigayle, MN 56406', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Mayert-Nolan'),
(5, 'Miss Katheryn Aufderhar', '414.279.4837', 'camryn.pacocha@example.net', '163 Kobe Path\nNew Kaya, PA 48401-0705', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'O\'Kon, Bergstrom and Larson'),
(6, 'Brown Block V', '+1-385-365-7348', 'mohammad.donnelly@example.org', '9577 King Roads Suite 920\nJanaborough, WI 37102', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rau, Nitzsche and Cormier'),
(7, 'Dr. Hiram Keebler', '+1-802-867-2408', 'lavon.klocko@example.org', '53844 Wendell Fall\nSouth Enid, OH 91632-8007', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Schaefer-Konopelski'),
(8, 'Prof. Tierra Nitzsche V', '680.231.3276', 'okerluke@example.org', '32632 Terrence Parkway\nDeckowfort, CA 73968-0659', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Jacobi, Hirthe and Schaefer'),
(9, 'Janie Auer', '949-654-6600', 'torp.cody@example.net', '24965 O\'Hara Drive Apt. 599\nLake Leola, WY 49697', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Homenick, Okuneva and Lockman'),
(10, 'Nikko Walker', '+18175982174', 'dillon94@example.org', '54919 Candice Extension Suite 095\nNorth Nicolettehaven, WI 00210-0691', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kertzmann-Spencer'),
(11, 'Constance Quitzon', '339-726-5414', 'kirsten.blanda@example.com', '3196 Jenkins Ridge\nNorth Stewartville, UT 74829', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Wunsch-Mills'),
(12, 'Prof. Billie Jerde', '661.571.0958', 'senger.richmond@example.net', '37475 Toy Valley\nNorth Jensenfurt, ID 90817-0681', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rogahn LLC'),
(13, 'Kiana Dickens', '+1 (434) 614-3663', 'feil.edythe@example.org', '287 Mckayla Shoal\nNorth Guadalupeview, MD 26369-2931', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Littel, McLaughlin and D\'Amore'),
(14, 'Ephraim Gerlach', '(281) 392-2863', 'reva.donnelly@example.net', '511 Caleigh Island Apt. 835\nPort Margueriteberg, CT 11660', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Walter, Homenick and Macejkovic'),
(15, 'Annabelle Olson', '425.720.4898', 'janiya70@example.org', '2024 Arnoldo Corners Suite 960\nLake Tobin, NJ 79441', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Stiedemann-Heller'),
(16, 'Dylan Medhurst PhD', '316-854-2751', 'mtorp@example.com', '1142 Kendall Alley Apt. 962\nCathyfort, CA 97125-8888', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Swift, Gislason and Nicolas'),
(17, 'Hortense Hoppe', '+15136587912', 'hgulgowski@example.com', '507 Rowena Lights Apt. 430\nSouth Marlin, NH 00980-3879', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuphal and Sons'),
(18, 'Vena Roob', '1-706-843-7663', 'tania31@example.com', '9935 Stefanie Plaza\nBretmouth, NE 18278', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Herzog-Bayer'),
(19, 'Prof. Hallie O\'Reilly', '828-688-2578', 'fermin.kessler@example.com', '48051 Macey Forks Suite 505\nHerminiachester, OK 50766-1572', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hansen PLC'),
(20, 'Floyd Stanton DVM', '970.783.7501', 'kayleigh.reichert@example.org', '342 Kathryne Squares\nDarenton, NY 49145-7726', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Prohaska, Dickinson and McClure'),
(21, 'Nasir Ryan Sr.', '+1-860-307-9927', 'gmohr@example.org', '3830 Christelle Throughway Suite 166\nSouth Curtis, RI 98751-8022', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Harvey-Treutel'),
(22, 'Titus Rutherford', '(323) 563-3680', 'inolan@example.org', '351 Otho Island Suite 884\nNorth Lonie, NM 34844-3742', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Miller-Wilderman'),
(23, 'Miss Drew Kessler', '+1 (559) 996-3842', 'shields.friedrich@example.org', '697 Erdman Station\nHollytown, NC 01593', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hoppe PLC'),
(24, 'Elisabeth Emmerich', '949-817-5211', 'rrosenbaum@example.org', '75594 Sipes Ridges Apt. 888\nNorth Ruth, CO 40734', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Padberg, Rutherford and Gibson'),
(25, 'Casandra Harvey', '+17702514281', 'anderson.angelica@example.com', '936 Ardella Lights\nFramiburgh, LA 58478-0326', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'King, Schowalter and Mann'),
(26, 'Maritza Douglas V', '936-742-9251', 'ansel.larkin@example.com', '82075 Funk Branch\nLake Destiney, NE 07290-8510', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Brown, Beahan and Block'),
(27, 'Dalton Eichmann', '401-342-5762', 'laney24@example.com', '5869 Hansen Dale\nSouth Alessandroborough, NC 77823-3140', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Willms Ltd'),
(28, 'Ora Zieme DDS', '830-482-2802', 'stiedemann.brisa@example.com', '28926 Moore Grove Suite 816\nDeckowville, TN 10236', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Ernser Inc'),
(29, 'Ms. Alvina Erdman', '321.602.0517', 'cberge@example.com', '128 Angeline Groves Apt. 423\nLake Verna, HI 50935', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rolfson, Kiehn and Parisian'),
(30, 'Ivory Kunde', '+1-818-254-0850', 'kemmer.narciso@example.net', '61448 Bailey Stream\nDantown, OH 65870', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Dach and Sons'),
(31, 'Lucinda Schmidt', '510.635.8723', 'gerardo.hauck@example.com', '503 Hauck Harbors\nElveraside, NE 20164-3227', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Gulgowski-Luettgen'),
(32, 'Taya Dietrich DDS', '754.942.1484', 'sauer.rosemary@example.org', '748 Kutch Forks Apt. 150\nMayertfurt, RI 02695-1980', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rippin, Blanda and Boehm'),
(33, 'Miss Audreanne Bernhard PhD', '+1 (786) 996-3918', 'sgleichner@example.net', '18729 Lesch Spur\nKonopelskiland, CO 04559', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Mosciski-Feil'),
(34, 'Aliyah Treutel', '+14234254519', 'nigel62@example.com', '9681 Hane Extensions Suite 313\nWolfville, SD 46013', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Langworth-Kerluke'),
(35, 'Makenna Hegmann', '334-276-6927', 'jevon.koepp@example.net', '3310 Mueller Cliff Apt. 900\nLake Destinyland, AR 71798', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Olson-Spinka'),
(36, 'Dr. Holly Bernier', '1-657-508-9704', 'valerie99@example.org', '1580 Lakin Spur\nCoyport, MD 37568-1147', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kunde-Schuster'),
(37, 'Samara Lesch', '1-661-543-0010', 'lori09@example.org', '57102 Larkin Junctions\nWest Leonardo, MT 41415-7959', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rohan Inc'),
(38, 'Prof. Jayde Dibbert III', '806.542.9307', 'hayden36@example.org', '85367 Pouros Mountain\nOndrickaland, MO 06386-6978', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Brakus Group'),
(39, 'Prof. Hoyt Buckridge II', '+1-863-238-3384', 'maverick62@example.net', '70176 Ethyl Spurs Suite 437\nSouth Cynthiamouth, WI 83238-4674', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Jakubowski-Runte'),
(40, 'Percy Lang I', '+18304682504', 'hahn.alexandria@example.net', '941 Feest Rest Apt. 213\nNorth Oscar, NE 48527-2197', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Predovic-Koepp'),
(41, 'Prof. Ervin Franecki', '+1 (815) 372-0733', 'lubowitz.mossie@example.net', '68314 Ankunding Street\nSouth Myleneshire, MN 65408-7906', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Prosacco Group'),
(42, 'Beaulah Hettinger', '1-283-640-0874', 'armstrong.americo@example.org', '81084 Lindgren Courts\nEast Shawnborough, DC 66037-0378', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Sanford-Stroman'),
(43, 'Alysa Lubowitz', '562.592.4151', 'freynolds@example.com', '72643 Yost Rue Suite 831\nRobbiemouth, VA 04729', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Olson-Quigley'),
(44, 'Elmira Russel DVM', '913.260.3648', 'cummerata.cecelia@example.net', '1183 Denesik Key\nNew Henryborough, SC 10214', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Jakubowski, Kerluke and Reynolds'),
(45, 'Adella Marvin', '808-396-8570', 'runte.uriah@example.net', '9288 Lionel Manor Apt. 132\nFaheymouth, MS 98850', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hintz, Graham and Kuphal'),
(46, 'Amani Rippin', '+1 (765) 504-5024', 'lgoldner@example.net', '4715 Linda Drive Suite 720\nRebecachester, IA 71321', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hermann PLC'),
(47, 'Delilah Beer', '+12677008178', 'zsanford@example.net', '261 Delpha Creek\nBryanafurt, GA 58810', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Flatley, Stark and Sawayn'),
(48, 'Dr. Dan Reinger V', '+1.302.205.2647', 'isobel85@example.net', '46568 Dominic Lake\nDianabury, LA 34471-2839', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Feil-Sipes'),
(49, 'Mr. Jeramie Zemlak PhD', '+19899613649', 'lframi@example.net', '312 Barton Summit\nAsiafurt, WY 39562-4150', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Stokes Inc'),
(50, 'Lucy Leffler', '1-614-803-7858', 'kirlin.timothy@example.com', '59019 Kelli Camp\nLillianburgh, IL 16778-6030', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Berge-Hermann'),
(51, 'Keven Powlowski Sr.', '+1 (731) 239-8595', 'willis.will@example.org', '5899 Doyle Locks\nStehrbury, IN 23708-1007', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kohler, O\'Kon and McClure'),
(52, 'Mrs. Eleanora Hamill PhD', '+1 (718) 960-7905', 'juliana.kreiger@example.com', '2974 Jeff Circles Suite 258\nPort Ashley, DE 45562-8847', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'O\'Reilly LLC'),
(53, 'Julianne Schumm', '+1-269-876-8057', 'kreiger.aubree@example.net', '979 Lang Ways\nWest Aiden, TX 80065', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Schroeder Ltd'),
(54, 'Garrick Schuppe', '(331) 682-5012', 'lubowitz.lera@example.net', '667 Maggio Glen\nLake Winston, FL 40160', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'McKenzie, Little and Bogisich'),
(55, 'Mrs. Hilma Kerluke Sr.', '+1 (612) 928-6113', 'kody25@example.net', '130 Jakubowski River\nKaleighshire, HI 82935', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Roob-Jacobson'),
(56, 'Evert McDermott', '+19415240872', 'jarod.kerluke@example.com', '3890 Johnny Cliff Suite 089\nJaskolskiton, TX 17991', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuphal-Howe'),
(57, 'Jaquan Cormier', '1-862-792-9937', 'nick.mcdermott@example.org', '204 Rosemary Groves Suite 460\nSouth Hubert, ID 90966', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hermann-Skiles'),
(58, 'Fae Leffler', '+18289797772', 'padberg.nora@example.net', '4785 Felix Knolls Suite 008\nPort Margie, NY 49624-4862', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rice-Botsford'),
(59, 'Dora Kessler II', '+16318972182', 'hand.delilah@example.org', '9175 Sidney Junction\nLake Flaviemouth, WV 00719-3685', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuhlman, Kautzer and Muller'),
(60, 'Dr. Juwan Goyette', '1-707-855-4929', 'bechtelar.sylvan@example.com', '1128 Parker Lock Apt. 960\nMcKenzieside, IL 36184-2379', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Wiegand, Friesen and Batz'),
(61, 'Ivah Kautzer', '484-820-2751', 'kshlerin.eryn@example.net', '512 Bo Spur Suite 262\nDaniellefort, AR 34569-4245', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuhlman, Heathcote and Balistreri'),
(62, 'Zander Abbott', '667-649-6533', 'wolff.emmanuelle@example.com', '7513 Jacobi Causeway\nSouth Bernadinetown, MA 36028', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Okuneva Inc'),
(63, 'Dena Gerlach', '(321) 525-0777', 'gust85@example.com', '60120 Daugherty Highway Apt. 554\nLake Julianne, OR 07813', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Cronin Ltd'),
(64, 'Dr. Gideon Schneider', '+1.689.624.0957', 'von.ayden@example.net', '1859 Annie Fords Suite 907\nWalkerchester, TN 46049', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuhic PLC'),
(65, 'Easter Paucek', '762.356.1667', 'kaitlin.kling@example.com', '96828 Alta Unions Apt. 061\nLake Mary, FL 02950', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Watsica-Strosin'),
(66, 'Dr. Dayne Swaniawski II', '+1 (854) 594-9835', 'allen05@example.com', '55557 Schoen Radial\nSouth Ricky, VA 46916', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Bogisich, Weissnat and Gaylord'),
(67, 'Garett McClure', '+17629263694', 'jaquan.hansen@example.com', '3080 Kyla Bypass\nBartolettiland, UT 82179-3953', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hayes LLC'),
(68, 'Bryana Ernser', '+1-315-678-5476', 'marlene59@example.org', '4191 Kub Circles Apt. 118\nNorth Jolie, HI 86473', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hermiston PLC'),
(69, 'Prof. Aimee Shields PhD', '(757) 794-8679', 'maudie.heidenreich@example.net', '1126 Ned Brooks Suite 064\nEast Dillon, ND 75429', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Windler, Buckridge and Beier'),
(70, 'Raul Ebert', '+12037262273', 'ycollier@example.org', '9645 Brown Mission Apt. 438\nNorth Herminia, AL 57681-2609', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Reichert, Hermann and Eichmann'),
(71, 'Mrs. Trinity Daniel V', '650-231-9700', 'ostiedemann@example.net', '52606 Mante Underpass\nMarquardtside, MS 57547', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Fay-Steuber'),
(72, 'Dr. Cordia Streich', '+1-763-907-5008', 'joesph.gleason@example.net', '3639 Kulas Mission\nHillhaven, IN 70706-0925', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Klein, Dooley and Dickens'),
(73, 'Prof. Andrew Gislason Jr.', '413.558.3979', 'rogahn.casandra@example.com', '450 Judd Island\nUbaldotown, DC 17756', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Harber, Trantow and Krajcik'),
(74, 'Alexandro Green', '(763) 943-8795', 'oschamberger@example.org', '1679 Myrtis Cliff\nLake Darrel, MA 48439-9375', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'McKenzie-Bernhard'),
(75, 'Dr. Alexanne Ledner', '929.266.4954', 'dare.esteban@example.org', '7007 Graham Shoal Suite 882\nMacejkovicburgh, OR 86184-2874', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Renner, Kuhic and Dibbert'),
(76, 'Darby Harris', '+1-985-324-4964', 'chesley.mraz@example.net', '54917 Murphy Corner Suite 224\nBauchfurt, HI 84428-3609', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Schmitt Inc'),
(77, 'Diamond Beatty', '951.278.5407', 'weichmann@example.org', '60699 Adams Stravenue Apt. 438\nSouth Tianna, MO 83611-6691', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Greenholt-Kozey'),
(78, 'Ebba Kovacek', '412.601.3404', 'howard94@example.com', '45907 Larson Overpass\nWiltonmouth, PA 53797-9784', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Simonis, Dietrich and Gutmann'),
(79, 'Caesar Thompson', '985.712.1601', 'riley54@example.com', '483 Eudora Plains\nMcCluretown, MT 88397', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Lebsack PLC'),
(80, 'Claire Eichmann', '1-913-217-3008', 'zelda.haley@example.net', '61388 Hamill Dam\nWiegandtown, MO 11277-5488', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Mosciski, Treutel and Russel'),
(81, 'Aniyah Steuber II', '+19547919288', 'gdubuque@example.net', '4837 Mitchel Landing\nLuisaborough, FL 96363-7392', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Herzog-Luettgen'),
(82, 'Gisselle Powlowski', '+19388533698', 'therese.mante@example.org', '61213 Andreane Club\nWest Evertport, ID 26316-7490', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Koch-Collier'),
(83, 'Kendall Bogan', '307.348.7340', 'celestino63@example.org', '143 Floyd Expressway Apt. 972\nLake Mackenzie, MO 04594-5724', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Flatley PLC'),
(84, 'Dereck Simonis', '+1.870.372.4987', 'gorczany.kenny@example.org', '9978 Feil Greens Suite 607\nPort Filomena, IL 17124-4122', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Borer, Zulauf and Hudson'),
(85, 'Sheila Gusikowski PhD', '(919) 309-7011', 'abernathy.hassie@example.net', '9294 Padberg Lakes Suite 370\nNorth Nicolasberg, WY 67264', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'O\'Conner LLC'),
(86, 'Phoebe Langworth', '220.843.1693', 'davis.alan@example.com', '14763 Champlin Route\nGibsonbury, WA 64137-2755', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Strosin-Lockman'),
(87, 'Miss June Herman', '530-592-0439', 'rashawn.terry@example.net', '454 Crist Circle Suite 287\nLake Stevieville, DE 20404', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Flatley-Grady'),
(88, 'Miss Sandy Koss Sr.', '458-609-9064', 'feest.trystan@example.net', '3852 Elenora Pike\nWest Billie, LA 69707-9773', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Kuhn-Lesch'),
(89, 'Mr. Enos McDermott', '661-606-7879', 'maxime52@example.org', '97170 Dicki Lock Apt. 842\nPacochabury, MD 03559', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Rohan, Ledner and Goldner'),
(90, 'Prof. Noe Okuneva', '430.913.8880', 'karmstrong@example.net', '318 Rae Ridge Apt. 277\nBrownmouth, SC 40572-3147', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Nitzsche and Sons'),
(91, 'Liam Abbott', '+1.814.361.9468', 'thea.mclaughlin@example.net', '70594 Zander Lakes\nHeathcotefort, ID 20119-2913', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Christiansen Ltd'),
(92, 'Elmo Gerhold', '(952) 697-6439', 'shyann.johnston@example.net', '91865 Barry Ports\nKerlukemouth, SC 91333-0887', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Leannon Group'),
(93, 'Prof. Mazie Leuschke', '+18019232079', 'erika.okuneva@example.com', '8992 Hegmann Corner Suite 835\nMadelynton, WY 29067-7349', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Gibson-Halvorson'),
(94, 'Allen Bins', '+1-872-403-0257', 'kara36@example.net', '347 Milo Mountains Suite 633\nStammfurt, CT 46626', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Bernhard Inc'),
(95, 'Ryan Walter', '+1-252-453-1113', 'mikel.huels@example.com', '23801 Hermiston Squares Suite 258\nFriesenport, KS 69350-6385', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Tremblay-Hilpert'),
(96, 'Myrl Hoeger', '+12834452509', 'cicero99@example.org', '17937 Conor Crossroad\nWest Selmerchester, WA 82078-1047', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Heaney and Sons'),
(97, 'Prof. Chandler Jenkins Sr.', '+1.575.913.7428', 'kerluke.tyra@example.org', '4868 Mayer Lights Suite 603\nEast Melvina, AR 95713', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Schmidt, Larson and Dach'),
(98, 'Prof. Audrey Tremblay', '858.451.2054', 'bechtelar.hertha@example.org', '96016 Dariana Islands\nKristofferfort, NC 58283', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Lesch Ltd'),
(99, 'Dr. Nickolas Gorczany', '870-346-4766', 'zhegmann@example.org', '310 Stracke Glen\nWest Hailey, OK 17838-5132', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Hettinger-Wuckert'),
(100, 'Dr. Justice Hill V', '(415) 225-3020', 'lehner.velda@example.net', '7517 Isobel Port Suite 460\nNew Aliamouth, KY 13473', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Littel Group'),
(101, 'Erling Corkery', '(509) 330-4856', 'jordon.gerlach@example.com', '469 Marks Trace Apt. 961\nEllenchester, UT 78701-7440', '2025-10-16 23:11:32', '2025-10-16 23:11:32', 'Zulauf, Bradtke and Marquardt'),
(102, 'Supplier A', '1234567890', 'supplierA@example.com', 'Address A', '2025-10-16 23:11:32', '2025-10-16 23:11:32', NULL),
(103, 'Supplier B', '0987654321', 'supplierB@example.com', 'Address B', '2025-10-16 23:11:32', '2025-10-16 23:11:32', NULL),
(104, 'Madaline Davis', '+1 (526) 962-3686', 'wynu@mailinator.com', 'Aliquid sit earum e', '2025-10-16 23:19:29', '2025-10-16 23:19:29', 'Holder and Meyers Plc'),
(105, 'Manuel Stamm', '254.620.1047', 'lia.robel@example.net', '7927 Denesik Island\nCletaborough, IA 70200', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Corkery, Gulgowski and Schimmel'),
(106, 'Dr. Hilario Murray', '216-546-1874', 'herman.ebert@example.net', '850 Stanley Flats\nEast Louie, VA 98291-8802', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Bergstrom-Jaskolski'),
(107, 'Green Leannon', '+18658990992', 'little.josefina@example.com', '8446 Bins Groves Apt. 460\nMadalineview, CA 49272-7182', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Spinka-Goodwin'),
(108, 'Prof. Donavon Schmidt', '971.574.6915', 'mayer.dallin@example.net', '363 Lon Courts\nEast Sylvesterton, MS 88629', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Zemlak Group'),
(109, 'Ray Dooley', '270.444.5592', 'ecorkery@example.org', '483 Stroman Divide Suite 723\nHalvorsonhaven, SC 09165', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Schultz-Konopelski'),
(110, 'Valerie Morissette', '+1 (314) 720-8869', 'harvey.shanelle@example.net', '42161 Mohr Squares\nWest Ronaldo, IN 57434', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Cole and Sons'),
(111, 'Jacquelyn Tremblay PhD', '+1-352-479-4318', 'miguel90@example.com', '34120 Schinner Knolls\nZelmaberg, WI 39121-4800', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Stokes Ltd'),
(112, 'Era Waelchi', '+1.551.525.8586', 'ledner.isadore@example.org', '21835 Pfeffer Tunnel\nNorth Jeremy, PA 57993-6526', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Lynch Group'),
(113, 'Kurtis Leuschke', '+1-681-792-1285', 'patsy.spinka@example.com', '9393 Linda Junction Suite 538\nMadietown, SC 22809', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Hills-Maggio'),
(114, 'Deja Swift', '(551) 957-6877', 'mozelle.langworth@example.com', '37827 Presley Divide Suite 219\nPort Hyman, DC 90765-8842', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Murray, Williamson and Senger'),
(115, 'Dixie Wyman DVM', '+1.510.732.8747', 'nheller@example.com', '888 Osvaldo Courts\nAbshirefort, TN 69784-4915', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Bradtke-Lesch'),
(116, 'Mr. Madison Lesch IV', '754-510-4324', 'timmy93@example.net', '691 Georgianna Village\nMarvinstad, NJ 34173-6451', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Miller-Turner'),
(117, 'Gunnar Strosin', '865.891.0679', 'csmith@example.net', '402 Denesik Lodge\nWest Berenice, KS 90763-7408', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Kiehn LLC'),
(118, 'Dr. Larry Rosenbaum', '(256) 514-4388', 'lorna.mosciski@example.net', '7594 Hank Lakes\nLake Melyssa, ND 93452', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Grimes-Schumm'),
(119, 'Mr. Antonio Hills PhD', '+1-480-415-3120', 'wellington.beier@example.net', '6085 Wolff Extension\nRogahnfort, OH 36312-5078', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Fay and Sons'),
(120, 'Kennedi Hessel', '351.741.2824', 'zschumm@example.com', '613 Vickie Forks Apt. 450\nNoratown, NC 11715-8587', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Auer and Sons'),
(121, 'Ciara Spencer', '(458) 899-8956', 'bstreich@example.com', '459 Devin Locks Suite 699\nKylestad, VA 06109', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Eichmann, Abernathy and Gulgowski'),
(122, 'Emely Lindgren', '260-205-0750', 'abahringer@example.com', '629 Grant Mall\nStokesbury, CA 87895', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Daugherty, Bins and Abbott'),
(123, 'Prof. Jerrod Hyatt DDS', '559.615.7337', 'greta62@example.org', '673 Lauriane Road Apt. 095\nMaciside, UT 96965-6815', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Johnston, Miller and Bode'),
(124, 'Malcolm Roberts V', '442-822-9228', 'harley38@example.org', '91802 Terry Harbors\nWest Nickstad, AZ 42993', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Wolff-Greenholt'),
(125, 'Reymundo Witting', '+1.704.585.9342', 'marlen06@example.org', '9360 Wolf Island Suite 965\nSouth Joanie, UT 39425-7168', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Rolfson, Langosh and Bartell'),
(126, 'Jaunita Friesen', '(620) 461-6917', 'mkulas@example.org', '6778 Trey Locks\nGulgowskifort, PA 97501-7657', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Klocko LLC'),
(127, 'Robbie Adams', '+1-747-959-7255', 'jace46@example.net', '418 Smitham Lodge Apt. 523\nPort Howellburgh, WI 32942', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Boyer, Waelchi and McLaughlin'),
(128, 'Dr. Birdie Eichmann IV', '864-558-7198', 'bblanda@example.org', '19103 Heidenreich Trace Apt. 041\nWest Viva, NC 80055-3762', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Hoeger-Funk'),
(129, 'Jakob Schuppe', '332.759.0087', 'kavon08@example.com', '464 Glover Ports\nSouth Sophie, OR 85052', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Daniel-Graham'),
(130, 'Mr. Jerald Moore DVM', '1-785-884-8786', 'twatsica@example.net', '113 Cristobal Plaza Suite 016\nSouth Peggie, DC 36774-5202', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'VonRueden Inc'),
(131, 'Lucie Roberts II', '501.380.5445', 'hziemann@example.org', '36473 Abel Points Suite 964\nLake Wilburn, AK 92053', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Bins, McClure and West'),
(132, 'Ms. Dolores Lakin IV', '(781) 338-0526', 'crist.kathryn@example.com', '5699 Valentina Crossing\nMaeveview, MS 39269', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Wiegand and Sons'),
(133, 'Immanuel Padberg', '(248) 483-4204', 'mcclure.roscoe@example.org', '18164 Quigley Walk Suite 885\nBeerfurt, AR 47317-9782', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Lang Group'),
(134, 'Parker Zieme Jr.', '1-269-538-4887', 'hodkiewicz.stephanie@example.net', '694 Reilly Row\nLake Rexville, MO 84428', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Glover and Sons'),
(135, 'Adriana VonRueden', '1-503-250-7997', 'lempi23@example.net', '584 Justina Junctions Suite 499\nAlexieshire, MO 27581', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Denesik Ltd'),
(136, 'Hobart Braun', '+1-458-754-3550', 'pacocha.dominic@example.net', '100 Douglas Squares Apt. 422\nSunnystad, IA 96637', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Hyatt-Berge'),
(137, 'Brando Daugherty', '+1-352-614-0166', 'kallie.mills@example.net', '407 Jacobson Meadows\nNew Omari, AR 26194-4699', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Ruecker PLC'),
(138, 'Prof. Rod Maggio', '1-269-362-8529', 'marc17@example.com', '6222 Effie Wall Apt. 208\nTamialand, MA 16148-0337', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'King-Kirlin'),
(139, 'Curt Ferry', '+1-725-648-5674', 'chadrick.blick@example.org', '3066 Rau Manors Apt. 101\nMiloland, DC 89850-7668', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Oberbrunner PLC'),
(140, 'Paolo Schroeder', '(740) 777-4645', 'lsenger@example.org', '36810 Jerde Mill\nNorth Kailynberg, ME 04896', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Mertz, Effertz and Runolfsdottir'),
(141, 'Prof. Lemuel West', '1-207-510-1868', 'hansen.waylon@example.com', '103 Greyson Crossroad\nJazlynburgh, CO 18989', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Willms Ltd'),
(142, 'Asha Emmerich', '423-826-9220', 'xvon@example.com', '652 Timothy Flats Apt. 379\nJanyburgh, ID 89158-0464', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Kohler, Hegmann and Jast'),
(143, 'Natalia Littel', '850-993-5086', 'gonzalo.harber@example.net', '342 Effertz Lodge Suite 773\nNew Adityaberg, UT 05400', '2025-10-16 23:56:02', '2025-10-16 23:56:02', 'Mertz LLC'),
(144, 'Raphael Hahn', '(520) 418-8521', 'dariana.gottlieb@example.com', '3691 Littel Passage\nConstantinton, FL 10108', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kuhn LLC'),
(145, 'Prof. Jamison Kirlin IV', '+1.928.207.5090', 'august.damore@example.net', '37645 Myra Hollow Suite 768\nWest Tito, WA 04757', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Cole, Mante and Marquardt'),
(146, 'Violet McDermott', '1-308-907-0980', 'mohr.marcel@example.com', '582 Vandervort Port\nGleasontown, ID 06563', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kling, Zemlak and Senger'),
(147, 'Brooks Blick', '+1.475.810.0978', 'lubowitz.jazmyne@example.org', '825 Reanna Port\nBartellburgh, PA 97565', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Quitzon, Stoltenberg and Blanda'),
(148, 'Mr. Ewald Skiles', '628-431-8132', 'iva19@example.org', '1906 Hill Squares\nMaximilliaberg, MS 74088', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Nicolas-Wisozk'),
(149, 'Conner Wilderman', '1-616-515-0957', 'qvolkman@example.com', '5990 Feil Turnpike\nPort Monty, NM 87054-7539', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Russel Ltd'),
(150, 'Jadon Stracke Sr.', '1-720-797-6719', 'hane.garrick@example.com', '493 Alysson Lights\nNew Mohammad, VT 16213-8077', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Heller-Hayes'),
(151, 'Roy Christiansen', '(479) 826-8354', 'jtorp@example.com', '536 Raheem Alley\nFrancesshire, DE 55029-3462', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Okuneva, Miller and Nicolas'),
(152, 'Dr. Wilfred Armstrong', '520.639.0185', 'fwolff@example.org', '218 Deckow Summit Suite 441\nEast Monserratfurt, SD 30983', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Schamberger-Feil'),
(153, 'Dr. Rhiannon Zemlak', '+1.814.402.2257', 'vivienne.dubuque@example.org', '50422 Darby Prairie Suite 321\nOrinchester, HI 42082', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Walsh, Herzog and Osinski'),
(154, 'Nikita Lueilwitz', '+1-351-512-9259', 'fritsch.chesley@example.com', '978 Kilback Mission\nFlochester, NC 15965', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kerluke, Donnelly and Schaefer'),
(155, 'Miss Laurianne Franecki', '+1-320-378-6002', 'dhammes@example.com', '7547 Runolfsson Circles Suite 522\nTorpport, KY 13876-1198', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hayes-Gutmann'),
(156, 'Daphney Hermiston', '1-405-658-4455', 'arlie86@example.net', '6123 Goyette Track\nNorth Matilde, RI 68247-5952', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Predovic-Harvey'),
(157, 'Malinda Sawayn', '+18022349921', 'johanna.runolfsdottir@example.com', '726 Tevin Hill Apt. 410\nRiceland, WI 78566-1632', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lang-Gerhold'),
(158, 'Jamal Hand', '859-884-7451', 'garret34@example.org', '43890 Johnson Garden Suite 151\nGiashire, FL 21220', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Toy-Stanton'),
(159, 'Tierra Considine', '747-399-9717', 'nschmitt@example.net', '146 Cummings Ways\nSouth Sheilaberg, ND 64916-9704', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Jacobs-Oberbrunner'),
(160, 'Nya Schultz DVM', '+1 (956) 492-9032', 'wkiehn@example.org', '23438 Macejkovic Light\nLake Kristin, WV 29153', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hessel, Fisher and Ullrich'),
(161, 'Prof. Euna Weber PhD', '1-678-218-0547', 'kris.lamar@example.net', '70369 Kenneth Overpass Apt. 440\nKunzestad, FL 17038', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hamill-Denesik'),
(162, 'Joannie Graham', '385.715.4420', 'schultz.pearline@example.net', '8292 Helga Tunnel\nKirlinshire, ID 51438-5538', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Baumbach, Cummerata and Moen'),
(163, 'Dr. Ariel Herman', '332-601-9021', 'alexys11@example.com', '1470 Kuhic Springs\nHoegerton, NV 09848-0535', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Tillman and Sons'),
(164, 'Dr. Pablo Raynor Sr.', '629-703-2583', 'stracke.finn@example.com', '94375 Nathanael Prairie Apt. 894\nAbbottchester, TX 40629-9315', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kris, Hegmann and Shanahan'),
(165, 'Vilma Runte PhD', '361.227.9513', 'fletcher.bogan@example.com', '9917 Skiles Plains Apt. 023\nEast Daniella, UT 86844', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Satterfield, Gorczany and Kiehn'),
(166, 'Prof. Verda Schamberger', '1-952-457-2830', 'kailey.macejkovic@example.net', '760 Narciso Mountains Suite 865\nStromanchester, IN 33394-9539', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Yost, Boyer and Hintz'),
(167, 'Conor Ritchie', '+15317379235', 'cmohr@example.org', '364 Murphy Mountain Apt. 337\nUrielbury, FL 47609-3769', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Gerlach-Bednar'),
(168, 'Mr. Fletcher Moore', '646-738-1225', 'austin72@example.com', '34903 Turner Groves\nSouth Garry, OR 09132', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Mann, Gibson and Greenfelder'),
(169, 'Miss Emmy Price III', '272-917-9525', 'vboyer@example.net', '6026 Kris Views\nPort Gardnerfurt, DC 53309-3679', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Wehner LLC'),
(170, 'Alexandra Deckow', '+1-425-334-8525', 'xrosenbaum@example.net', '1291 Jon Plains\nLake Raphaelleside, NV 22553', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Grimes LLC'),
(171, 'Lura Okuneva', '906-964-0887', 'klocko.cristobal@example.net', '43523 Electa Causeway\nLake Jeramieshire, SD 55171', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Raynor-Bernier'),
(172, 'Zoey Friesen', '815.562.3344', 'hkutch@example.com', '668 Ida Roads Apt. 687\nPort Oma, MD 15323-4541', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kautzer-Waters'),
(173, 'Mrs. Anissa Lehner', '352-376-1492', 'forrest.upton@example.org', '36882 Vincenzo Flats Suite 389\nLangoshburgh, WA 53463', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Shanahan Ltd'),
(174, 'Prof. Imelda Armstrong', '+1 (385) 400-1734', 'doris65@example.org', '2149 Iva Harbor\nRoobfurt, IN 54102', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Metz-Bogisich'),
(175, 'Lorena Blanda', '+1-423-459-5200', 'alysson75@example.com', '99424 Alexa Isle\nSouth Ulicesland, ND 96303-0530', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Maggio, Bode and Daniel'),
(176, 'Prof. Darius Rau', '336-991-0719', 'kunde.jameson@example.org', '2062 Strosin Drive Apt. 655\nKihnberg, MS 68527', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Barton, Hessel and Murazik'),
(177, 'Eladio Collins', '+1-680-716-7022', 'leif85@example.net', '5413 Halvorson Route Suite 397\nHackettmouth, MT 38588', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Murray Group'),
(178, 'Aaliyah Wuckert', '+1.541.610.6861', 'rempel.kayley@example.net', '215 Rodriguez Prairie Suite 561\nO\'Konstad, LA 67390-9528', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Mante-Stanton'),
(179, 'Ahmed Schaefer', '+1.341.762.7530', 'shields.johnnie@example.net', '581 Malachi Plains Apt. 754\nSouth Brielle, MS 90550', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Greenfelder Ltd'),
(180, 'Brandt Herzog', '281.587.1704', 'tanner.schaefer@example.org', '6272 Agustin Parks\nSouth Jevontown, NV 73553', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Heathcote LLC'),
(181, 'Kelli Cummings', '+1.401.753.2316', 'bquitzon@example.org', '1978 Donnelly Flat Suite 167\nLake Henriette, CO 50241', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'O\'Hara and Sons'),
(182, 'Ariel Volkman', '+19594198468', 'nikolaus.ayana@example.net', '1007 Elfrieda Brooks\nEast Makenna, WY 52909', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Pagac Ltd'),
(183, 'Prof. Kevin McGlynn', '218.929.5500', 'chadd25@example.net', '56621 Valentina Heights Suite 183\nEast Consuelo, ME 33361-1430', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Corkery LLC'),
(184, 'Ms. Lauriane Hintz II', '1-820-790-7609', 'gloria22@example.net', '3170 Heidenreich Summit Suite 536\nLake Hardyland, VA 55051', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bergnaum-Aufderhar'),
(185, 'Alva Bailey IV', '551.900.6330', 'kari.bernier@example.com', '6093 Von Drive\nReynabury, MI 16418', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Bruen and Sons'),
(186, 'Dr. Angel Toy', '564-840-1771', 'rodrigo.donnelly@example.net', '4388 Estel Vista Apt. 610\nKaelynfurt, MN 71457-2813', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Block-Emard'),
(187, 'Newell Baumbach', '(626) 941-7836', 'julianne.armstrong@example.org', '633 Jarrell Ford\nRathfurt, CA 13358-5674', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Hettinger, Grimes and Reynolds'),
(188, 'Joaquin Stamm Sr.', '361.569.2756', 'egutkowski@example.net', '4113 Myrna Shore Suite 976\nChamplinberg, DC 40352', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Corwin, Reichert and Senger'),
(189, 'Gino Dare', '+12566439449', 'abergstrom@example.org', '439 Kunze Locks\nEast Ignacio, NM 92725', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Schowalter, White and Bartell'),
(190, 'Prof. Shannon Reichert', '276-283-6120', 'mckenzie.mabel@example.org', '703 Kozey Trafficway\nKevinton, ME 34701', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Greenholt Inc'),
(191, 'Candace Howell V', '(425) 272-1055', 'zhickle@example.org', '540 Dudley Trail Apt. 474\nPort Jeremieville, MT 79462', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Boehm, O\'Hara and Champlin'),
(192, 'Dariana Friesen', '+1-458-977-6261', 'yfunk@example.org', '7925 Brice Key\nKshlerinstad, NV 70285', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Jerde-Friesen'),
(193, 'Mrs. Bernita Champlin', '689-264-9201', 'zelda.huel@example.org', '57435 Streich Expressway Suite 507\nLorenzstad, NJ 54542-3589', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Kuvalis Inc'),
(194, 'Karelle Eichmann', '646-845-0254', 'clara.douglas@example.org', '24813 Omari Circle\nSouth Ignatiusburgh, HI 75328-1278', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Rippin, Will and Grady'),
(195, 'Virgil Jacobs', '+1-724-422-7094', 'neil86@example.com', '84399 Bauch Prairie Suite 508\nWunschport, NE 31016-1420', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Aufderhar-Koelpin'),
(196, 'Genoveva Cronin', '(860) 699-0853', 'huels.marielle@example.com', '4636 Sporer Lake Apt. 421\nRathburgh, IL 68685', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Conroy-Koss'),
(197, 'Dr. Shanna Murray', '1-360-852-2652', 'monica19@example.com', '1420 Goyette Pines\nLorainehaven, NM 48390-8633', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lueilwitz Ltd'),
(198, 'Ana Rippin', '+16787759616', 'gleuschke@example.org', '993 Kuphal Track\nRohanfurt, UT 30897', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lang Ltd'),
(199, 'Lila Brakus I', '(938) 641-4671', 'connelly.davin@example.org', '230 Farrell Orchard Apt. 704\nLake Kadenside, AZ 09485-6752', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Leffler, Langworth and Dietrich'),
(200, 'Scottie Schinner PhD', '+1-831-485-1720', 'valentine.friesen@example.com', '6500 Turner Ramp Suite 414\nNew Uriah, MA 66073', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Erdman, Corkery and Gislason'),
(201, 'Ms. Tracy Emard MD', '763.375.6281', 'axel.parker@example.com', '7412 Dane Inlet Apt. 219\nLake Kurtisfort, AZ 32561', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Smith-Dietrich'),
(202, 'Miss Emmalee Monahan DDS', '1-724-430-5292', 'lakin.justice@example.org', '199 Koepp Pike\nEast Gayborough, AR 44172', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Lowe-Jacobson'),
(203, 'Jovan Yundt', '+1-323-812-5006', 'meredith.koch@example.org', '4673 Toy Forest\nLake Aliviafort, CO 86340-5220', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Brown, Bosco and Lehner'),
(204, 'Ernesto Kozey', '+1-631-604-8773', 'jimmy60@example.net', '697 Nienow Loaf\nDuaneville, NY 45987-2559', '2025-10-16 23:56:03', '2025-10-16 23:56:03', 'Moore LLC'),
(205, 'Supplier A', '1234567890', 'supplierA@example.com', 'Address A', '2025-10-16 23:56:03', '2025-10-16 23:56:03', NULL),
(206, 'Supplier B', '0987654321', 'supplierB@example.com', 'Address B', '2025-10-16 23:56:03', '2025-10-16 23:56:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'KG', '2025-10-02 05:49:43', '2025-10-02 05:49:43'),
(2, 'Ton', '2025-10-02 05:49:51', '2025-10-02 05:49:51'),
(3, 'Piece', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(4, 'Kg', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(5, 'Liter', '2025-10-16 23:11:33', '2025-10-16 23:11:33'),
(6, 'Piece', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(7, 'Kg', '2025-10-16 23:56:03', '2025-10-16 23:56:03'),
(8, 'Liter', '2025-10-16 23:56:03', '2025-10-16 23:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$AkamAgmkXzCaeb0P4RHNDOGmOTIgRIivL1wfqkIbDn6GJrQZwB7xm', NULL, '2025-10-02 05:48:16', '2025-10-02 05:48:16', 'admin'),
(2, 'Admin User', 'admin@example.com', NULL, '$2y$12$DlkqBR2xLwHMn7hRmpcVQOdzahLzEWd4zbu99XKR75pfgum4Pe9X.', NULL, '2025-10-16 23:09:35', '2025-10-16 23:09:35', 'admin'),
(3, 'Manager User', 'manager@example.com', NULL, '$2y$12$sWyErZDi4s.BU/U8jEVqN.rkkV/UuoMa5Lcf4g6wOa13mW8dB/NUK', NULL, '2025-10-16 23:09:35', '2025-10-16 23:09:35', 'manager'),
(4, 'Regular User', 'user@example.com', NULL, '$2y$12$XpXCWDyAMGzybtDx0wBz3eS8Dw3YK/b79TnC8GGsemQD9joUOKO4e', NULL, '2025-10-16 23:09:36', '2025-10-16 23:09:36', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buys`
--
ALTER TABLE `buys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buys_supplier_id_foreign` (`supplier_id`),
  ADD KEY `buys_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `buy_items`
--
ALTER TABLE `buy_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_items_buy_id_foreign` (`buy_id`),
  ADD KEY `buy_items_product_id_foreign` (`product_id`),
  ADD KEY `buy_items_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_sell_id_foreign` (`sell_id`),
  ADD KEY `payments_buy_id_foreign` (`buy_id`);

--
-- Indexes for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_items_payment_id_foreign` (`payment_id`),
  ADD KEY `payment_items_paytype_id_foreign` (`paytype_id`);

--
-- Indexes for table `pay_types`
--
ALTER TABLE `pay_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sells_customer_id_foreign` (`customer_id`),
  ADD KEY `sells_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_items_sell_id_foreign` (`sell_id`),
  ADD KEY `sell_items_product_id_foreign` (`product_id`),
  ADD KEY `sell_items_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buys`
--
ALTER TABLE `buys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `buy_items`
--
ALTER TABLE `buy_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment_items`
--
ALTER TABLE `payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pay_types`
--
ALTER TABLE `pay_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sell_items`
--
ALTER TABLE `sell_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buys`
--
ALTER TABLE `buys`
  ADD CONSTRAINT `buys_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buys_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_items`
--
ALTER TABLE `buy_items`
  ADD CONSTRAINT `buy_items_buy_id_foreign` FOREIGN KEY (`buy_id`) REFERENCES `buys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_buy_id_foreign` FOREIGN KEY (`buy_id`) REFERENCES `buys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD CONSTRAINT `payment_items_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_items_paytype_id_foreign` FOREIGN KEY (`paytype_id`) REFERENCES `pay_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sells_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD CONSTRAINT `sell_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_items_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
