-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2018 at 07:33 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myflaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `author`, `body`, `create_date`) VALUES
(1, 'First article.', 'nahian', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat metus quis elit tincidunt accumsan. Morbi lacinia lectus eget felis pellentesque placerat. Morbi euismod egestas nulla, eu dignissim neque molestie non. Mauris in dui vehicula, lobortis sapien sodales, maximus est. Quisque pretium, urna sed commodo iaculis, arcu quam condimentum nulla, et posuere enim arcu ac ex. Sed dictum, est et pellentesque elementum, tellus ipsum vulputate tellus, et imperdiet quam lacus vel lectus. Mauris nunc leo, accumsan ut neque vel, elementum tincidunt mauris. Nullam porta sit amet nisi eu placerat. Cras tincidunt erat est, eu pretium massa consequat at. Vivamus feugiat varius elit ut aliquet. Fusce aliquet feugiat magna eu fermentum. Aenean vitae est nec nunc faucibus ornare.</p>', '2018-03-28 11:58:34'),
(3, 'Second article', 'nahian', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor pellentesque fermentum. Quisque vitae quam id risus tristique lacinia eu vel libero. Aenean venenatis suscipit metus sed faucibus. Duis laoreet tortor vel ullamcorper lacinia. Maecenas ac enim mattis leo feugiat interdum. Sed congue lacus ac cursus tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas sagittis felis non pulvinar bibendum. Vestibulum ipsum erat, luctus eu imperdiet non, luctus at augue. Vivamus id volutpat quam, ut semper eros. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>', '2018-03-28 13:22:16'),
(4, 'First article by Nafis', 'nafis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor pellentesque fermentum. Quisque vitae quam id risus tristique lacinia eu vel libero. Aenean venenatis suscipit metus sed faucibus. Duis laoreet tortor vel ullamcorper lacinia. Maecenas ac enim mattis leo feugiat interdum. Sed congue lacus ac cursus tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas sagittis felis non pulvinar bibendum. Vestibulum ipsum erat, luctus eu imperdiet non, luctus at augue. Vivamus id volutpat quam, ut semper eros. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>', '2018-03-28 13:23:07'),
(5, 'Second article by Nafis', 'nafis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor pellentesque fermentum. Quisque vitae quam id risus tristique lacinia eu vel libero. Aenean venenatis suscipit metus sed faucibus. Duis laoreet tortor vel ullamcorper lacinia. Maecenas ac enim mattis leo feugiat interdum. Sed congue lacus ac cursus tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas sagittis felis non pulvinar bibendum. Vestibulum ipsum erat, luctus eu imperdiet non, luctus at augue. Vivamus id volutpat quam, ut semper eros. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>', '2018-03-28 13:23:27'),
(6, 'First article by Niko', 'niko', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor pellentesque fermentum. Quisque vitae quam id risus tristique lacinia eu vel libero. Aenean venenatis suscipit metus sed faucibus. Duis laoreet tortor vel ullamcorper lacinia. Maecenas ac enim mattis leo feugiat interdum. Sed congue lacus ac cursus tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas sagittis felis non pulvinar bibendum. Vestibulum ipsum erat, luctus eu imperdiet non, luctus at augue. Vivamus id volutpat quam, ut semper eros. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>', '2018-03-28 13:23:52'),
(7, 'Second article by Niko', 'niko', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor pellentesque fermentum. Quisque vitae quam id risus tristique lacinia eu vel libero. Aenean venenatis suscipit metus sed faucibus. Duis laoreet tortor vel ullamcorper lacinia. Maecenas ac enim mattis leo feugiat interdum. Sed congue lacus ac cursus tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas sagittis felis non pulvinar bibendum. Vestibulum ipsum erat, luctus eu imperdiet non, luctus at augue. Vivamus id volutpat quam, ut semper eros. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>', '2018-03-28 13:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `username`, `password`, `register_date`) VALUES
(1000, 'nahian@gmail.com', 'Nahian', 'nahian', '$5$rounds=535000$dMJzRrkxkvntr4Ch$gs0VZ2vjld2SgrOu.q9y7EwW1a227N2oZcFt0QB68C1', '2018-03-27 11:55:59'),
(1001, 'john@gmail.com', 'John Doe', 'johnDoe', '$5$rounds=535000$9thkpiQsB0lthaRG$L.66OlSCplyDYoCwsnCHLUSU9ausbpSn9haBMIF6wy8', '2018-03-27 11:58:09'),
(1002, 'niko@gmail.com', 'Niko', 'niko', '$5$rounds=535000$RWvXHJF9jlnlMlI.$UnBmaGqmGPsTNspTbY0pYbrKUsjcCrAljrb0vyecN.0', '2018-03-27 18:16:51'),
(1003, 'viktor@gmail.com', 'Viktor', 'viktor', '$5$rounds=535000$EPYgsSCgzmRux6gu$UNfkmsnoVynOITEZB/YxLtwCM61ik64dOdkHPisUOhC', '2018-03-27 18:44:55'),
(1004, 'nafis@gmail.com', 'Nafis', 'nafis', '$5$rounds=535000$w/3AkM17SZctDMbX$ThAF3zSM2chUAxDjAV4cDhgwMn6rjHwuKVAqWdphRf1', '2018-03-28 09:46:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
