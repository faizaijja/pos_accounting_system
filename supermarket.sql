-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 10:52 AM
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
-- Database: `supermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` enum('sale','purchase','expense','refund') NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','credit_card','debit_card','bank_transfer','paypal','check') NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('paid','pending','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `price_per_unit` decimal(10,2) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `card_last_four` varchar(4) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `restock_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `image_path` varchar(200) NOT NULL,
  `reorder_level` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `prod_name`, `category`, `quantity`, `unit_price`, `restock_date`, `expiry_date`, `image_path`, `reorder_level`) VALUES
(1, 'Milk 1L', 'Dairy', 49, 1.20, NULL, '2025-07-15', '', 0),
(2, 'Brown Bread', 'Bakery', 35, 0.85, NULL, '2025-04-20', '', 0),
(3, 'Sugar 5kg', 'Grocery', 100, 1.00, NULL, '2026-01-01', '', 0),
(4, 'Toilet Paper (4 rolls)', 'Household', 75, 2.30, NULL, '2027-12-31', '', 0),
(5, 'Cooking Oil 2L', 'Grocery', 60, 3.80, NULL, '2026-06-10', '', 0),
(6, 'Tomato Sauce 500ml', 'Condiments', 30, 1.10, NULL, '2025-10-05', '', 0),
(7, 'Salt 500g', 'Grocery', 90, 0.40, NULL, '2027-01-01', '', 0),
(8, 'Soap Bar', 'Personal Care', 100, 0.75, NULL, '2026-05-12', '', 0),
(9, 'Toothpaste 100ml', 'Personal Care', 85, 1.00, NULL, '2026-03-03', '', 0),
(10, 'Cornflakes 500g', 'Cereals', 60, 2.00, NULL, '2025-12-15', '', 0),
(11, 'Yogurt 150ml', 'Dairy', 70, 0.90, NULL, '2025-04-30', '', 0),
(12, 'Butter 250g', 'Dairy', 55, 2.50, NULL, '2025-08-10', '', 0),
(13, 'Cheddar Cheese 200g', 'Dairy', 35, 2.75, NULL, '2025-07-25', '', 0),
(14, 'Whole Wheat Bread', 'Bakery', 40, 1.10, NULL, '2025-04-21', '', 0),
(15, 'White Bread', 'Bakery', 45, 1.00, NULL, '2025-04-22', '', 0),
(16, 'Shampoo 250ml', 'Personal Care', 50, 3.40, NULL, '2026-04-01', '', 0),
(17, 'Conditioner 250ml', 'Personal Care', 32, 3.60, NULL, '2026-04-01', '', 0),
(18, 'Handwash 500ml', 'Personal Care', 55, 2.20, NULL, '2026-05-10', '', 0),
(19, 'Dish Soap 750ml', 'Household', 80, 1.90, NULL, '2027-08-12', '', 0),
(20, 'Floor Cleaner 1L', 'Household', 38, 2.80, NULL, '2027-09-20', '', 0),
(21, 'Detergent Powder 1kg', 'Household', 90, 3.10, NULL, '2027-06-15', '', 0),
(22, 'Toilet Cleaner 500ml', 'Household', 50, 1.70, NULL, '2026-11-30', '', 0),
(23, 'Biscuits 200g', 'Snacks', 100, 0.95, NULL, '2025-09-01', '', 0),
(24, 'Chips 150g', 'Snacks', 90, 1.20, NULL, '2025-07-01', '', 0),
(25, 'Chocolate Bar', 'Snacks', 120, 0.85, NULL, '2025-12-12', '', 0),
(26, 'Candy Bag 100g', 'Snacks', 100, 0.50, NULL, '2026-01-01', '', 0),
(27, 'Apple Juice 1L', 'Beverages', 70, 1.80, NULL, '2025-08-01', '', 0),
(28, 'Orange Juice 1L', 'Beverages', 65, 1.85, NULL, '2025-08-01', '', 0),
(29, 'Soda Can 330ml', 'Beverages', 150, 0.70, NULL, '2025-11-11', '', 0),
(30, 'Energy Drink 250ml', 'Beverages', 80, 1.50, NULL, '2025-10-10', '', 0),
(31, 'Mineral Water 1L', 'Beverages', 200, 0.60, NULL, '2027-01-01', '', 0),
(32, 'Bananas (1kg)', 'Fruits', 100, 1.00, NULL, '2025-04-10', '', 0),
(33, 'Apples (1kg)', 'Fruits', 90, 1.80, NULL, '2025-04-12', '', 0),
(34, 'Oranges (1kg)', 'Fruits', 80, 1.60, NULL, '2025-04-15', '', 0),
(35, 'Carrots (1kg)', 'Vegetables', 70, 0.90, NULL, '2025-04-13', '', 0),
(36, 'Tomatoes (1kg)', 'Vegetables', 85, 1.20, NULL, '2025-04-11', '', 0),
(37, 'Onions (1kg)', 'Vegetables', 100, 0.70, NULL, '2025-04-18', '', 0),
(38, 'Potatoes (2kg)', 'Vegetables', 60, 1.50, NULL, '2025-04-14', '', 0),
(39, 'Rice 5kg', 'Grocery', 40, 6.50, NULL, '2026-01-01', '', 0),
(40, 'Spaghetti 500g', 'Grocery', 70, 1.20, NULL, '2026-02-15', '', 0),
(41, 'Macaroni 500g', 'Grocery', 60, 1.10, NULL, '2026-03-01', '', 0),
(42, 'Cooking Cream 200ml', 'Dairy', 35, 1.30, NULL, '2025-07-30', '', 0),
(43, 'Baked Beans 400g', 'Canned Goods', 55, 1.00, NULL, '2027-06-01', '', 0),
(44, 'Tuna Can 185g', 'Canned Goods', 40, 1.60, NULL, '2027-08-10', '', 0),
(45, 'Sweet Corn Can', 'Canned Goods', 45, 1.10, NULL, '2027-09-15', '', 0),
(46, 'Green Peas Can', 'Canned Goods', 30, 1.15, NULL, '2027-07-20', '', 0),
(47, 'Margarine 250g', 'Dairy', 45, 1.40, NULL, '2025-09-01', '', 0),
(48, 'Eggs (tray of 30)', 'Dairy', 30, 3.00, NULL, '2025-04-15', '', 0),
(49, 'Instant Coffee 100g', 'Beverages', 40, 2.90, NULL, '2026-12-01', '', 0),
(50, 'Tea Bags (25)', 'Beverages', 60, 1.70, NULL, '2026-10-15', '', 0),
(51, 'Noodles Pack', 'Grocery', 100, 0.45, NULL, '2026-05-20', '', 0),
(52, 'Peanut Butter 500g', 'Grocery', 50, 2.50, NULL, '2026-08-01', '', 0),
(53, 'Jam Jar 300g', 'Grocery', 45, 1.95, NULL, '2026-07-15', '', 0),
(54, 'Ketchup 750ml', 'Condiments', 55, 1.60, NULL, '2026-02-28', '', 0),
(55, 'Mayonnaise 500ml', 'Condiments', 31, 2.20, NULL, '2026-04-04', '', 0),
(56, 'Vinegar 500ml', 'Condiments', 60, 0.90, NULL, '2027-01-01', '', 0),
(57, 'Soy Sauce 250ml', 'Condiments', 40, 1.10, NULL, '2026-06-06', '', 0),
(58, 'Garlic Powder 100g', 'Spices', 30, 0.75, NULL, '2027-01-01', '', 0),
(59, 'Black Pepper 100g', 'Spices', 25, 0.80, NULL, '2027-01-01', '', 0),
(60, 'Chili Flakes 100g', 'Spices', 20, 0.85, NULL, '2027-01-01', '', 0),
(61, 'Turmeric Powder 100g', 'Spices', 30, 0.90, NULL, '2027-01-01', '', 0),
(62, 'Curry Powder 100g', 'Spices', 35, 1.00, NULL, '2027-01-01', '', 0),
(63, 'Bleach 1L', 'Household', 50, 1.30, NULL, '2027-09-01', '', 0),
(64, 'Air Freshener Spray', 'Household', 45, 2.10, NULL, '2026-11-01', '', 0),
(65, 'Trash Bags (roll)', 'Household', 60, 1.20, NULL, '2027-02-01', '', 0),
(66, 'Mop Refill', 'Household', 30, 1.80, NULL, '2027-03-01', '', 0),
(67, 'Laundry Basket', 'Household', 20, 5.00, NULL, '2027-01-01', '', 0),
(68, 'Face Mask (pack of 10)', 'Personal Care', 90, 1.50, NULL, '2027-12-01', '', 0),
(69, 'Hand Sanitizer 100ml', 'Personal Care', 100, 0.95, NULL, '2026-06-01', '', 0),
(70, 'Cotton Buds (pack)', 'Personal Care', 80, 0.70, NULL, '2027-03-01', '', 0),
(71, 'Diapers (pack of 20)', 'Personal Care', 40, 6.50, NULL, '2026-12-15', '', 0),
(72, 'Baby Wipes (pack)', 'Personal Care', 50, 2.00, NULL, '2026-09-01', '', 0),
(73, 'Shaving Cream 200ml', 'Personal Care', 35, 2.40, NULL, '2026-07-10', '', 0),
(74, 'Razor Pack', 'Personal Care', 40, 1.90, NULL, '2026-08-20', '', 0),
(75, 'Hair Gel 150ml', 'Personal Care', 30, 2.30, NULL, '2026-07-01', '', 0),
(76, 'Deodorant Spray', 'Personal Care', 60, 2.60, NULL, '2026-06-20', '', 0),
(77, 'Body Lotion 400ml', 'Personal Care', 50, 3.20, NULL, '2026-05-01', '', 0),
(78, 'Face Cream 50ml', 'Personal Care', 45, 2.80, NULL, '2026-04-25', '', 0),
(79, 'Lip Balm', 'Personal Care', 70, 1.00, NULL, '2026-05-15', '', 0),
(80, 'Tissue Box', 'Household', 80, 1.10, NULL, '2027-12-31', '', 0),
(81, 'Nail Cutter', 'Personal Care', 35, 1.20, NULL, '2027-01-01', '', 0),
(82, 'Bath Towel', 'Household', 25, 4.50, NULL, '2027-01-01', '', 0),
(83, 'Laundry Soap Bar', 'Household', 90, 0.60, NULL, '2027-05-01', '', 0),
(84, 'Steel Scrubber', 'Household', 50, 0.90, NULL, '2027-06-01', '', 0),
(85, 'Plastic Wrap', 'Household', 40, 1.10, NULL, '2027-04-01', '', 0),
(86, 'Aluminum Foil Roll', 'Household', 30, 2.30, NULL, '2027-04-01', '', 0),
(87, 'Egg Noodles 500g', 'Grocery', 60, 1.25, NULL, '2026-04-01', '', 0),
(88, 'Popcorn Pack', 'Snacks', 75, 0.85, NULL, '2026-01-01', '', 0),
(89, 'Frozen Peas 1kg', 'Frozen', 40, 2.00, NULL, '2026-12-01', '', 0),
(90, 'Frozen Chicken 1kg', 'Frozen', 30, 4.80, NULL, '2026-11-15', '', 0),
(91, 'Ice Cream Tub 1L', 'Frozen', 33, 3.50, NULL, '2025-09-01', '', 0),
(92, 'Frozen Pizza', 'Frozen', 25, 5.20, NULL, '2025-12-01', '', 0),
(93, 'Chewing gum', 'Snacks', 20, 1200.00, NULL, NULL, '', 0),
(94, 'Sun screen 1L', 'Personal Care', 4, 200.00, NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int(12) NOT NULL,
  `purchase_type` enum('purchase','restock','','') NOT NULL DEFAULT 'purchase',
  `purchase_date` date NOT NULL,
  `item` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `payment_method` enum('cash','momo','bank transfer','') NOT NULL DEFAULT 'momo',
  `payment_status` enum('paid','pending','','') NOT NULL DEFAULT 'paid',
  `unit_price` int(30) NOT NULL,
  `total_amount` int(30) NOT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `purchase_type`, `purchase_date`, `item`, `category`, `quantity`, `payment_method`, `payment_status`, `unit_price`, `total_amount`, `expiry_date`) VALUES
(5, 'purchase', '2025-04-15', 'Sun screen 1L', 'Personal Care', 4, '', 'paid', 30000, 120000, NULL),
(6, 'purchase', '2025-04-15', 'Sun screen 5L', 'Personal Care', 10, '', 'paid', 30, 300, NULL),
(7, 'restock', '2025-04-15', 'Sun screen 1L', 'Personal Care', 4, '', 'paid', 200, 800, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(255) NOT NULL,
  `transaction_type` enum('sale','refund','','') NOT NULL DEFAULT 'sale',
  `sales_date` date NOT NULL,
  `prod_name` varchar(200) NOT NULL,
  `quantity` int(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` int(150) NOT NULL,
  `payment_mode` enum('cash','momo','card','') NOT NULL DEFAULT 'cash',
  `payment_status` enum('paid','pending','','') NOT NULL DEFAULT 'paid',
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `transaction_type`, `sales_date`, `prod_name`, `quantity`, `price`, `total`, `payment_mode`, `payment_status`, `created_by`) VALUES
(18, 'sale', '2025-04-14', 'Conditioner 250ml', 6, 3.60, 22, 'cash', 'paid', '7'),
(19, 'sale', '2025-04-14', 'Conditioner 250ml', 6, 3.60, 22, 'momo', 'paid', '7'),
(20, 'sale', '2025-04-14', 'Mayonnaise 500ml', 4, 2.20, 9, 'momo', 'paid', 'admin'),
(21, 'sale', '2025-04-14', 'Conditioner 250ml', 6, 3.60, 22, 'cash', 'paid', 'admin'),
(22, 'sale', '2025-04-14', 'Margarine 250g', 5, 1.40, 7, 'cash', 'paid', 'admin'),
(23, 'sale', '2025-04-15', 'Ice Cream Tub 1L', 2, 3.50, 7, 'momo', 'paid', 'admin'),
(24, 'sale', '2025-04-16', 'Floor Cleaner 1L', 2, 2.80, 6, 'momo', 'paid', 'admin'),
(25, 'sale', '2025-04-17', 'Handwash 500ml', 5, 2.20, 11, 'cash', 'paid', 'admin'),
(26, 'sale', '2026-02-03', 'Brown Bread', 5, 0.85, 4, 'cash', 'paid', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE `tracker` (
  `tracker_id` int(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `in_time` varchar(200) DEFAULT NULL,
  `out_time` varchar(150) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(255) NOT NULL,
  `sales_id` int(255) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` enum('sale','purchase','refund') NOT NULL DEFAULT 'sale',
  `prod_name` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('cash','momo','card') NOT NULL DEFAULT 'cash',
  `payment_status` enum('paid','pending') NOT NULL DEFAULT 'paid',
  `created_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `sales_id`, `transaction_date`, `transaction_type`, `prod_name`, `quantity`, `total`, `payment_mode`, `payment_status`, `created_by`) VALUES
(18, NULL, '2025-04-14', 'sale', '0', 6, 21.60, 'cash', 'paid', '0'),
(19, NULL, '2025-04-14', 'sale', '0', 6, 21.60, 'momo', 'paid', '0'),
(20, NULL, '2025-04-14', 'sale', '0', 4, 8.80, 'momo', 'paid', ''),
(21, NULL, '2025-04-14', 'sale', '0', 6, 21.60, 'cash', 'paid', ''),
(22, NULL, '2025-04-14', 'sale', 'Margarine 250g', 5, 7.00, 'cash', 'paid', ''),
(23, NULL, '2025-04-15', 'sale', 'Ice Cream Tub 1L', 2, 7.00, 'momo', 'paid', ''),
(24, NULL, '2025-04-16', 'sale', 'Floor Cleaner 1L', 2, 5.60, 'momo', 'paid', ''),
(25, NULL, '2025-04-17', 'sale', 'Handwash 500ml', 5, 11.00, 'cash', 'paid', ''),
(26, NULL, '2026-02-03', 'sale', 'Brown Bread', 5, 4.25, 'cash', 'paid', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_item_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `quantity_sold` int(11) DEFAULT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `temp_password` tinyint(1) NOT NULL,
  `password_expiration` datetime(6) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `role` enum('admin','user','manager','') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `temp_password`, `password_expiration`, `created_at`, `role`) VALUES
(7, 'admin@gmail.com', '$2y$10$9MfIqCUcSsfkUUkFu1yIrOUFlXmuxThdm6qZd1Urag4TqVQaBQP9.', 0, NULL, '2025-04-14 09:01:07.796506', 'admin'),
(8, 'manager@gmail.com', '$2y$10$UTGfqS5mgrCNGXBRk.42G.1smud96EuECedRC0xnL/ZO3OKrsbKh.', 0, NULL, '2025-04-15 13:38:02.947756', 'manager'),
(9, 'cashier@gmail.com', '$2y$10$qzoEEAHzWKkcibUAPGFJcusSuJBIBZ9WkEZRpwfB.qeWjzHEGw6Na', 0, NULL, '2025-04-15 13:38:33.060125', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`tracker_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `sales_id` (`sales_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`transaction_item_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tracker`
--
ALTER TABLE `tracker`
  MODIFY `tracker_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `transaction_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
