-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for book_management
DROP DATABASE IF EXISTS `book_management`;
CREATE DATABASE IF NOT EXISTS `book_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `book_management`;

-- Dumping structure for table book_management.book
DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_book_categories` (`category_id`),
  CONSTRAINT `FK_book_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table book_management.book: ~15 rows (approximately)
DELETE FROM `book`;
INSERT INTO `book` (`id`, `name`, `status`, `category_id`) VALUES
	(1, 'Learn Python the Hard Way', 1, 1),
	(2, 'JavaScript: The Good Parts', 1, 2),
	(3, 'Clean Code: A Handbook of Agile Software Craftsmanship', 1, 3),
	(4, 'The Pragmatic Programmer', 0, 4),
	(5, 'You Don’t Know JS', 1, 5),
	(6, 'Eloquent JavaScript', 1, 6),
	(7, 'Design Patterns: Elements of Reusable Object-Oriented Software', 0, 7),
	(8, 'Refactoring: Improving the Design of Existing Code', 1, 8),
	(9, 'Python Crash Course', 1, 1),
	(10, 'Effective Java', 1, 2),
	(11, 'The Clean Coder: A Code of Conduct for Professional Programmers', 0, 3),
	(12, 'Grokking Algorithms', 1, 4),
	(13, 'The Art of Computer Programming', 1, 5),
	(14, 'Introduction to the Theory of Computation', 0, 6),
	(15, 'Code: The Hidden Language of Computer Hardware and Software', 1, 7);

-- Dumping structure for table book_management.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table book_management.categories: ~8 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Lập trình web'),
	(2, 'Lập trình Python'),
	(3, 'Lập trình nhúng'),
	(4, 'Kiểm thử phần mềm'),
	(5, 'Trí tuệ nhân tạo'),
	(6, 'An toàn mạng'),
	(7, 'Javascript từ cơ bản đến nâng cao'),
	(8, 'Other');

-- Dumping structure for table book_management.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table book_management.users: ~1 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `role`, `name`, `password`) VALUES
	(2, 'admin', 'minhtien', '123456'),
	(3, 'client', 'Mien ', '123456');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
