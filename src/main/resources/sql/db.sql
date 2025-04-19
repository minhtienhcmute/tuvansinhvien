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


-- Dumping database structure for hethongtuvansv
DROP DATABASE IF EXISTS `hethongtuvansv`;
CREATE DATABASE IF NOT EXISTS `hethongtuvansv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `hethongtuvansv`;

-- Dumping structure for table hethongtuvansv.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.categories: ~6 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Các vấn đề chung trong khoa CKM 2', '????', '2025-04-16 03:07:04', '2025-04-19 12:41:16', NULL),
	(2, 'Nghiên cứu Khoa học sinh viên', NULL, '2025-04-16 03:07:24', '2025-04-16 03:07:33', NULL),
	(3, 'Công tác sinh viên', '????', '2025-04-16 03:07:48', '2025-04-19 12:26:51', NULL),
	(4, 'Tuyển sinh', NULL, '2025-04-16 03:07:53', NULL, NULL),
	(5, 'Ngành công nghiệp Kỹ thuật Điện tử', NULL, '2025-04-16 03:08:38', NULL, NULL),
	(7, 'Cơ khí kĩ thuật', 'Cơ khí kĩ thuật', '2025-04-19 13:06:53', NULL, NULL);

-- Dumping structure for table hethongtuvansv.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `vote_cnt` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`question_id`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.comments: ~8 rows (approximately)
DELETE FROM `comments`;
INSERT INTO `comments` (`id`, `user_id`, `question_id`, `content`, `vote_cnt`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '<p>Chào em.</p><p><i>Xét khen thưởng em liên hệ phòng Tuyển sinh và công tác Sinh viên qua gmail: p.cthssv@hcmute.edu.vn để được hỗ trợ tư vấn em nha.</i></p><p><i>thân!</i></p>', 0, '2025-04-17 09:56:37', NULL),
	(2, 1, 4, '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơnChào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơnChào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, '2025-04-17 15:24:05', NULL),
	(3, 1, 4, '<p>Thầy cũng không biết nữa em!</p>', 0, '2025-04-17 16:13:00', NULL),
	(4, 1, 33, '<p><strong>Bảo hiểm xã hội Việt Nam trả lời&nbsp;</strong></p><p>Hiện nay trên ứng dụng VssID còn có trường hợp người lao động bị thiếu quá trình tham gia đóng BHXH. Bảo hiểm xã hội Việt Nam khẳng định toàn bộ quá trình tham gia BHXH, BHYT, BHTN của người lao động đã được số hóa, đồng bộ, lưu tại Cơ sở dữ liệu của Ngành. Do đó, người tham gia BHXH không cần quá lo lắng về việc hiển thị thiếu thời gian tham gia đóng BHXH trên ứng dụng VssID. Điều này không ảnh hưởng đến quyền lợi khi người lao động hưởng các chế độ BHXH. Bảo hiểm xã hội Việt Nam đang đẩy mạnh các giải pháp để cập nhật đầy đủ dữ liệu về thời gian tham gia BHXH trên ứng dụng VssID cho người lao động trong thời gian sớm nhất.</p><p>Để nhanh chóng cập nhật thông tin chính xác, người lao động phản ánh ngay với cơ quan BHXH tại địa phương trên toàn quốc (nếu bạn đang bảo lưu thời gian tham gia BHXH) hoặc nơi đang tham gia đóng BHXH để được hỗ trợ trực tiếp.</p>', 0, '2025-04-17 16:15:45', NULL),
	(5, 24, 34, '<p><strong>Chào em,</strong></p><p>Nếu em rớt môn thì vẫn có cơ hội chuyển ngành nếu em tích lũy đủ số tín chỉ của sinh viên năm 1 (khoảng 26 tính chỉ) và các điều kiện khác theo yêu cầu. Nếu em muốn thông tin chi tiết em có thể gặp quý thầy cô ở văn phòng khoa hoặc phòng đào tạo để được tư vấn.</p><p>Trân trọng.</p>', 0, '2025-04-19 03:56:28', NULL),
	(6, 24, 7, '<p>Chào em,</p><p>Đơn xin chuyển ngành thường sẽ được gửi vào các tuần cuối mỗi học kỳ sau khi sinh viên tích lũy đủ tín chỉ của Sinh viên năm 1 (tương đương khoảng 36 tín chỉ).</p><p>Hướng dẫn chi tiết em có thể gặp thư ký khoa quản ngành hoặc phòng tuyển sinh và công tác sinh viên trường.</p><p>Thân chào</p>', 0, '2025-04-19 10:00:20', NULL),
	(7, 24, 33, '<p>Hiện nay trên ứng dụng VssID còn có trường hợp người lao động bị thiếu quá trình tham gia đóng BHXH. Bảo hiểm xã hội Việt Nam khẳng định toàn bộ quá trình tham gia BHXH, BHYT, BHTN của người lao động đã được số hóa, đồng bộ, lưu tại Cơ sở dữ liệu của Ngành. Do đó, người tham gia BHXH không cần quá lo lắng về việc hiển thị thiếu thời gian tham gia đóng BHXH trên ứng dụng VssID. Điều này không ảnh hưởng đến quyền lợi khi người lao động hưởng các chế độ BHXH. Bảo hiểm xã hội Việt Nam đang đẩy mạnh các giải pháp để cập nhật đầy đủ dữ liệu về thời gian tham gia BHXH trên ứng dụng VssID cho người lao động trong thời gian sớm nhất.</p><p>Để nhanh chóng cập nhật thông tin chính xác, người lao động phản ánh ngay với cơ quan BHXH tại địa phương trên toàn quốc (nếu bạn đang bảo lưu thời gian tham gia BHXH) hoặc nơi đang tham gia đóng BHXH để được hỗ trợ trực tiếp.</p>', 0, '2025-04-19 10:18:28', NULL),
	(8, 1, 36, '<p>hêtte</p>', 0, '2025-04-19 13:08:29', NULL),
	(9, 1, 35, '<p>Chứng chỉ N4 có thể nộp&nbsp;để qui&nbsp;đổi cho các học phần Anh văn 1, 2, 3, 4 hệ&nbsp;đại trà. Cô gừi em&nbsp;&nbsp;thông báo về việc nhận chứng chỉ ngoại ngữ&nbsp;để chuyển&nbsp;điểm và miễn ngoại ngữ&nbsp;đầu ra của Phòng&nbsp;Đào tạo<br>(https://aao.hcmute.edu.vn/ArticleId/93008273-c2bf-43d1-81a4-77f9ee270332/thong-bao-thoi-gian-nhan-chung-chi-ngoai-ngu-de-chuyen-diem-va-mien-ngoai-ngu-dau-ra-hoc-ky-2-3-nam-hoc-2024-2025)</p>', 0, '2025-04-19 14:52:41', NULL),
	(10, 1, 35, '<p>Em tham khảo thêm tại đây nhé :</p>', 0, '2025-04-19 14:56:13', NULL);

-- Dumping structure for table hethongtuvansv.departments
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.departments: ~4 rows (approximately)
DELETE FROM `departments`;
INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Khoa công nghệ thông tin', NULL, '2025-04-13 12:56:56', '2025-04-13 12:56:56', NULL),
	(2, 'Khoa Điện - Điện tử', NULL, '2025-04-13 12:57:17', '2025-04-13 12:57:17', NULL),
	(4, 'Cơ khí', 'Phòng ban cơ khí', '2025-04-19 13:06:29', NULL, NULL);

-- Dumping structure for table hethongtuvansv.department_question
DROP TABLE IF EXISTS `department_question`;
CREATE TABLE IF NOT EXISTS `department_question` (
  `department_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `department_question_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `department_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.department_question: ~0 rows (approximately)
DELETE FROM `department_question`;

-- Dumping structure for table hethongtuvansv.notifications
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) NOT NULL,
  `message` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.notifications: ~0 rows (approximately)
DELETE FROM `notifications`;

-- Dumping structure for table hethongtuvansv.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.permissions: ~19 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `code`, `module`, `action`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'category.view', 'category', 'view', '2025-04-12 03:51:20', '2025-04-12 14:25:54', NULL),
	(2, 'category.add', 'category', 'add', '2025-04-12 03:51:20', '2025-04-12 14:26:04', NULL),
	(3, 'category.edit', 'category', 'edit', '2025-04-12 03:51:20', '2025-04-12 14:26:06', NULL),
	(4, 'category.delete', 'category', 'delete', '2025-04-12 03:51:20', '2025-04-12 14:26:07', NULL),
	(5, 'user.view', 'user', 'view', '2025-04-12 03:51:20', NULL, NULL),
	(6, 'user.add', 'user', 'add', '2025-04-12 03:51:20', NULL, NULL),
	(7, 'user.edit', 'user', 'edit', '2025-04-12 03:51:20', NULL, NULL),
	(8, 'user.delete', 'user', 'delete', '2025-04-12 03:51:20', NULL, NULL),
	(9, 'role.view', 'role', 'view', '2025-04-12 03:51:20', NULL, NULL),
	(10, 'role.add', 'role', 'add', '2025-04-12 03:51:20', NULL, NULL),
	(11, 'role.edit', 'role', 'edit', '2025-04-12 03:51:20', NULL, NULL),
	(12, 'role.delete', 'role', 'delete', '2025-04-12 03:51:20', NULL, NULL),
	(13, 'department.view', 'department', 'view', '2025-04-12 03:51:20', NULL, NULL),
	(14, 'department.add', 'department', 'add', '2025-04-12 03:51:20', NULL, NULL),
	(15, 'department.edit', 'department', 'edit', '2025-04-12 03:51:20', NULL, NULL),
	(16, 'department.delete', 'department', 'delete', '2025-04-12 03:51:20', NULL, NULL),
	(17, 'question.view', 'question', 'view', '2025-04-19 06:21:05', '2025-04-19 06:21:16', NULL),
	(22, 'question.reject', 'question', 'reject', '2025-04-19 06:21:05', '2025-04-19 06:21:16', NULL),
	(23, 'question.answer', 'question', 'answer', '2025-04-19 06:21:05', '2025-04-19 06:21:16', NULL);

-- Dumping structure for table hethongtuvansv.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `vote_cnt` int(11) DEFAULT 0,
  `views` int(11) DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `FK_questions_departments` (`department_id`),
  CONSTRAINT `FK_questions_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.questions: ~36 rows (approximately)
DELETE FROM `questions`;
INSERT INTO `questions` (`id`, `user_id`, `category_id`, `department_id`, `title`, `content`, `status`, `vote_cnt`, `views`, `reason`, `created_at`, `updated_at`) VALUES
	(0, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 1, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 05:27:46'),
	(1, 1, 1, 1, 'Vấn đề đình chỉ học tập', '<p><strong>Chào các Thầy Cô, cho em hỏi điểm xét tốt nghiệp cho K21 xét theo hệ 4 vậy xét khen thưởng thủ khoa ngành, thủ khoa toàn khóa thì xét hệ 4 hay hệ 10 ạa</strong></p>', 1, 0, 3, NULL, '2025-04-16 03:49:16', '2025-04-19 13:47:39'),
	(2, 1, 1, 1, 'Quy đổi anh văn K19', '<p><strong>Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;</strong><br><strong>Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;</strong><br><strong>Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;Cho em hỏi k19, kỳ sau còn qui đổi anh văn 1234 được nữa không ạ.&nbsp;</strong></p>', 2, 0, 0, NULL, '2025-04-16 03:50:16', '2025-04-17 05:27:50'),
	(4, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 1, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 15:24:05'),
	(5, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 1, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 05:27:49'),
	(6, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 2, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 05:27:49'),
	(7, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 1, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-19 10:00:21'),
	(8, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 1, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 05:27:48'),
	(9, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(10, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 2, 0, 0, NULL, '2025-04-16 03:51:01', '2025-04-17 05:27:47'),
	(11, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(12, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(13, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(14, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(15, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(16, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(17, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(18, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(19, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(20, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(21, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(22, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(23, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(24, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(25, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(26, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(27, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(28, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(29, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(30, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(31, 1, 2, 1, 'Xét tốt nghiệp tháng 3', '<p>Chào thầy cô cho em hỏi,<br>Em đã hoàn thành xong tất cả điều kiện tốt nghiệp. Giờ còn thiếu một môn học là Thực tập tốt nghiệp<br>Em mới đăng ký môn vào HK2 này. Em đã thực tập xong và nhờ giáo viên chấm điểm. Hoàn thành xong môn này vào cuối tháng 2.<br>Cô nói với em là hiện chưa khoá được điểm vì con nhiều bạn chưa thực tập xong.<br>Thì em muốn hỏi là vậy em có được đủ điều kiện để xét tốt nghiệp vào tháng 3 không ạ. Hay còn làm thêm thủ tục gì ạ<br>Em cảm ơn</p>', 0, 0, 0, NULL, '2025-04-16 03:51:01', NULL),
	(32, 1, 4, 2, 'Tuyển sinh liên thông', '<p>Trường ơi cho em hỏi Em học xong cao đẳng Công Nghệ Kỉ Thuật BR-VT thì em có thể liên thông trực tiếp vào được không ạ . &nbsp;Em mong được trường hồi đáp ạ<br><br>int userId = Integer.<i>parseInt</i>(req.getParameter("id"));<br>String title = req.getParameter("title");<br>int categoryId = Integer.<i>parseInt</i>(req.getParameter("category_id"));<br>int departmentId = Integer.<i>parseInt</i>(req.getParameter("department_id"));<br>String content = req.getParameter("content");</p>', 2, 0, 0, 'Câu hỏi ko hợp lệ', '2025-04-16 17:31:54', '2025-04-19 09:49:15'),
	(33, 1, 4, 2, 'Thời hạn nộp bằng anh Văn', '<p><strong>Kính gửi Phòng Tuyển Sinh và Công Tác SV- Chế độ Chính sách</strong></p><p><strong>Em tên là: Châu Thị Thúy Kiều. MSSV: 24116166</strong></p><p><strong>Hiện tại đã qua ngày thông báo của trường nhưng em vẫn chưa thấy công bố kết quả chính thức về tiền trợ cấp và cũng chưa có tiền gửi vào tài khoản.</strong></p><p><strong>Em muốn hỏi là khi nào mới có danh sách và khi nào em mới nhận được tiền trợ cấp ạ?</strong></p><p><strong>Em xin cảm ơn!</strong></p>', 1, 0, 0, NULL, '2025-04-16 17:37:26', '2025-04-17 16:15:45'),
	(34, 24, 1, 2, 'Vấn đề rớt môn và cơ hội chuyển ngành', '<p>Dạ em chào thầy cô khoa Xây Dựng ạ, cho em hỏi nếu bị rớt môn thì còn cơ hội chuyển ngành hay không ạ? Em cảm ơn ạ&nbsp;</p>', 1, 0, 0, NULL, '2025-04-19 03:44:50', '2025-04-19 03:56:28'),
	(35, 25, 1, 2, 'Thắc mắc về việc trừ điểm khi nộp chứng chỉ TOIEC đợt 3. ', '<p>Dạ thầy/cô cho em hỏi, hiện tại em đang học năm 3, nếu quy đổi chứng chỉ ngoại ngữ trong học kỳ này thì em được 9 điểm. Nhưng trong học kỳ 2 và 3 của năm học 2024/2025 có 3 đợt quy đổi, vậy nếu em nộp vào đợt 3 (tháng 6/2025) thì có bị tính là trễ trong học kỳ này và bị trừ từ 9 xuống 8 không ạ?</p>', 1, 0, 0, NULL, '2025-04-19 10:40:23', '2025-04-19 14:52:41'),
	(36, 26, 7, 4, 'Test', '<p>Test</p>', 1, 0, 14, NULL, '2025-04-19 13:07:57', '2025-04-19 15:07:46');

-- Dumping structure for table hethongtuvansv.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.roles: ~6 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, 'System admin', '2025-04-12 17:05:05', NULL, NULL),
	(6, 'Quản lý người dùng', '2025-04-12 17:10:56', NULL, NULL),
	(8, 'Hello World API Server', '2025-04-13 03:26:51', '2025-04-13 07:24:15', NULL),
	(10, 'Quản lý danh mục', '2025-04-13 08:14:58', '2025-04-14 04:50:09', NULL),
	(11, 'Tư vấn viên', '2025-04-14 14:12:38', NULL, NULL),
	(12, 'Admin', '2025-04-14 14:14:46', NULL, NULL);

-- Dumping structure for table hethongtuvansv.role_permission
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.role_permission: ~44 rows (approximately)
DELETE FROM `role_permission`;
INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(4, 8),
	(4, 9),
	(4, 10),
	(4, 11),
	(4, 12),
	(4, 13),
	(4, 14),
	(4, 15),
	(4, 16),
	(4, 17),
	(4, 22),
	(4, 23),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 8),
	(8, 1),
	(8, 5),
	(8, 9),
	(8, 13),
	(10, 1),
	(10, 5),
	(10, 6),
	(10, 7),
	(10, 9),
	(10, 13),
	(11, 9),
	(11, 10),
	(11, 11),
	(11, 12),
	(11, 17),
	(11, 22),
	(11, 23),
	(12, 9),
	(12, 10),
	(12, 11),
	(12, 12);

-- Dumping structure for table hethongtuvansv.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.users: ~8 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `email`, `password`, `google_id`, `name`, `avatar`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'minhtien020900@gmail.com', '$2a$10$iBzdX/U5YXZ9ZKOHVqBJROhwszR18f2Pj/i/r39k4EZzlKvAc3P3S', NULL, 'Mien Tinh dep TRAI', NULL, 1, '2025-04-14 10:51:39', '2025-04-14 14:46:59', NULL),
	(5, '123@gmail.com', '$2a$10$prLmEYjCGQIs4iALp8RLj.MtOFuDg2VIGGxWv9nhXqyj.k64kl2TC', NULL, 'My App', NULL, 1, '2025-04-14 10:55:20', NULL, NULL),
	(17, '1234@gmail.com', '$2a$10$04SOp43TtZdimnK4nlYHT.NdIwTu6t2XZinzz3OmTKvubY7v.wwJ.', NULL, 'Hello World API Server', NULL, 1, '2025-04-14 11:17:01', NULL, NULL),
	(21, '1234455@gmail.com', '$2a$10$lab335nOfY05IKYlegDrpusyk.Ft6ke/3tPCDIspN/Wv9VfVFdExm', NULL, 'Hello World API Server', NULL, 1, '2025-04-14 15:29:07', NULL, NULL),
	(22, 'mminhtien020900@gmail.com', '$2a$10$sdgA1Uu6VNOatRCRufXctO1u1qvXrx8vQScJx2gLsbDFMKLIOWyBq', NULL, 'Hello World API Server', NULL, 0, '2025-04-14 15:30:30', NULL, NULL),
	(24, '24810045@student.hcmute.edu.vn', NULL, '110832716534860988939', 'Minh Tien Vo', 'https://lh3.googleusercontent.com/a/ACg8ocJ0gp5ktp6GbmHCUG1b1SysLaGryROinKWQYV3x6byM-cYm5Q=s96-c', 1, '2025-04-19 10:22:51', '2025-04-19 13:19:59', NULL),
	(25, 'minhtien04102000@gmail.com', NULL, '108442551524883267912', 'Minh Tien', 'https://lh3.googleusercontent.com/a/ACg8ocJYJUNfjTqwdHRZ4cVS_6ckWuE7HGO9RrhDC2fi0qZlc3Fzmg=s96-c', 0, '2025-04-19 10:24:24', NULL, NULL),
	(26, 'webnickmap5sao@gmail.com', NULL, '115707757875235198072', 'Xinh Trai Tiến', 'https://lh3.googleusercontent.com/a/ACg8ocK1i0GYcxu8Lc4qzhK0icL12JRa7fzVXI0xAO4u3EJTa0O31I40=s96-c', 0, '2025-04-19 20:07:36', NULL, NULL),
	(27, 'admin@gmail.com', '$2a$10$3.vH0X26vn9BotFd8pcZye5b1ghA0aGy.Pta08anFuSHxat7zgS3y', NULL, 'Admin', NULL, 1, '2025-04-19 22:31:04', NULL, NULL);

-- Dumping structure for table hethongtuvansv.user_department
DROP TABLE IF EXISTS `user_department`;
CREATE TABLE IF NOT EXISTS `user_department` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`department_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `user_department_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.user_department: ~8 rows (approximately)
DELETE FROM `user_department`;
INSERT INTO `user_department` (`user_id`, `department_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 4),
	(5, 1),
	(5, 2),
	(17, 1),
	(17, 2),
	(24, 2),
	(27, 1),
	(27, 2),
	(27, 4);

-- Dumping structure for table hethongtuvansv.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hethongtuvansv.user_role: ~5 rows (approximately)
DELETE FROM `user_role`;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 4),
	(5, 6),
	(17, 4),
	(17, 6),
	(24, 11),
	(27, 4);

-- Dumping structure for procedure hethongtuvansv.increase_question_views
DROP PROCEDURE IF EXISTS `increase_question_views`;
DELIMITER //
CREATE PROCEDURE `increase_question_views`(IN question_id INT)
BEGIN
    UPDATE questions
    SET views = views + 1
    WHERE id = question_id;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
