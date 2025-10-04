-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2025 at 08:57 AM
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
-- Database: `mydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllRecipes` ()   BEGIN 
 SELECT * FROM recipe_item
 INNER JOIN recipes ON recipe_item.recipe_id = recipes.id 
 INNER JOIN items ON recipe_item.item_id = items.id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` enum('Ingredient','Packaging','Syrup') NOT NULL,
  `unit` enum('ml','grams','pcs') NOT NULL,
  `stock_quantity` double NOT NULL,
  `reorder_level` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `unit`, `stock_quantity`, `reorder_level`) VALUES
(1, 'Coffee Beans', 'Ingredient', 'grams', 6000, 1000),
(2, 'Milk', 'Ingredient', 'ml', 20000, 3000),
(3, 'Paper Cups', 'Packaging', 'pcs', 200, 30),
(4, 'Milk Foam', 'Ingredient', 'ml', 5000, 1000),
(5, 'Hot Water', 'Ingredient', 'ml', 10000, 4000),
(6, 'Espresso Cup', 'Packaging', 'pcs', 200, 60);

-- --------------------------------------------------------

--
-- Table structure for table `log_user_update`
--

CREATE TABLE `log_user_update` (
  `id` int(11) NOT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `old_first_name` varchar(100) DEFAULT NULL,
  `new_first_name` varchar(100) DEFAULT NULL,
  `old_last_name` varchar(100) DEFAULT NULL,
  `new_last_name` varchar(100) DEFAULT NULL,
  `old_email` varchar(100) DEFAULT NULL,
  `new_email` varchar(100) DEFAULT NULL,
  `old_age` varchar(100) DEFAULT NULL,
  `new_age` varchar(100) DEFAULT NULL,
  `old_course` varchar(50) DEFAULT NULL,
  `new_course` varchar(50) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_user_update`
--

INSERT INTO `log_user_update` (`id`, `action_type`, `old_first_name`, `new_first_name`, `old_last_name`, `new_last_name`, `old_email`, `new_email`, `old_age`, `new_age`, `old_course`, `new_course`, `update_date`) VALUES
(1, 'UPDATE', 'Myka', 'piya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-29 14:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `base_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `product_name`, `base_price`) VALUES
(1, 'Latte', 100),
(2, 'Cappuccino', 89),
(3, 'Americano', 95),
(4, 'Espresso', 110);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_item`
--

CREATE TABLE `recipe_item` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_item`
--

INSERT INTO `recipe_item` (`id`, `recipe_id`, `item_id`, `quantity`) VALUES
(1, 1, 1, 18),
(2, 1, 2, 200),
(3, 1, 3, 1),
(4, 3, 1, 18),
(5, 3, 5, 200),
(7, 3, 3, 1),
(8, 2, 1, 18),
(9, 2, 2, 150),
(10, 2, 4, 50),
(11, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `total_amount`) VALUES
(1, '2025-09-19 00:15:00', 180),
(2, '2025-09-20 07:14:03', 95),
(3, '2025-09-20 07:14:16', 275);

-- --------------------------------------------------------

--
-- Table structure for table `sale_item`
--

CREATE TABLE `sale_item` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_each` double NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_item`
--

INSERT INTO `sale_item` (`id`, `sale_id`, `recipe_id`, `quantity`, `price_each`, `subtotal`) VALUES
(6, 1, 1, 2, 90, 180);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `course` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `age`, `course`) VALUES
(1, 'Jhonwell', 'Espanola', 'ryuzaki@gmail.com', 21, 'BSCS'),
(2, 'Ahron', 'Gainsan', 'ahron@gmail.com', 20, 'BSCS'),
(3, 'Marwin', 'Batis', 'marwin@gmail.com', 19, 'BSIT'),
(4, 'Kingpaul', 'Salonga', 'kingpaul@gmail.com', 20, 'BSCS'),
(5, 'piya', 'Espanola', 'myka@gmail.com', 21, 'BSEMC'),
(7, 'Kenzo', 'Vidal', 'vidal@gmail.com', 19, 'BSIT'),
(8, 'Ferkeem', 'Mamayson', 'ferkeem@gmail.com', 20, 'BSCS'),
(9, 'Angelo', 'Flores', 'flores@gmail.com', 21, 'BSIS'),
(10, 'Jella', 'Gonzales', 'gonzales@gmail.com', 20, 'BSEMC');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `log_update_fName` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
 IF OLD.first_name <> NEW.first_name THEN
  INSERT INTO log_user_update(action_type, old_first_name, new_first_name) 
  VALUES ('UPDATE', OLD.first_name, NEW.first_name);
 END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_user_update`
--
ALTER TABLE `log_user_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_item`
--
ALTER TABLE `recipe_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_user_update`
--
ALTER TABLE `log_user_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipe_item`
--
ALTER TABLE `recipe_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_item`
--
ALTER TABLE `sale_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe_item`
--
ALTER TABLE `recipe_item`
  ADD CONSTRAINT `recipe_item_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recipe_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_item_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
