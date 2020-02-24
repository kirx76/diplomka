-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.13-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных diplom
CREATE DATABASE IF NOT EXISTS `diplom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `diplom`;

-- Дамп структуры для таблица diplom.dishes
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_src` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dish_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dishes_dish_types` (`dish_type`),
  CONSTRAINT `FK_dishes_dish_types` FOREIGN KEY (`dish_type`) REFERENCES `dish_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT IGNORE INTO `dishes` (`id`, `name`, `price`, `description`, `img_src`, `dish_type`) VALUES
	(8, 'Burger1', 120, 'Очень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургер', 'dish1.png', 1),
	(9, 'Burger2', 120, 'Очень вкусный бургер', 'dish2.png', 1),
	(10, 'Burger3', 120, 'Очень вкусный бургер', 'dish3.png', 1),
	(11, 'Burger4', 120, 'Очень вкусный бургер', 'dish1.png', 1),
	(12, 'Burger5', 120, 'Очень вкусный бургер', 'dish1.png', 1),
	(13, 'Burger6', 120, 'Очень вкусный бургер', 'dish1.png', 1),
	(14, 'Burger7', 120, 'Очень вкусный бургер', 'dish1.png', 1),
	(15, 'Burger8', 120, 'Очень вкусный бургер', 'dish1.png', 1),
	(16, 'Burger9', 120, 'Очень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургер', 'dish1.png', 1);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.dishes_ingredients
CREATE TABLE IF NOT EXISTS `dishes_ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_fk_1` (`dish_id`),
  KEY `ingredient_fk_1` (`ingredient_id`),
  CONSTRAINT `dish_fk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ingredient_fk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes_ingredients: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `dishes_ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `dishes_ingredients` (`id`, `dish_id`, `ingredient_id`, `weight`) VALUES
	(27, 8, 1, 100),
	(28, 8, 2, 100),
	(29, 8, 3, 100),
	(31, 9, 3, 100),
	(32, 9, 3, 100),
	(33, 10, 3, 100),
	(34, 10, 3, 100),
	(35, 11, 3, 100),
	(36, 12, 3, 100),
	(37, 13, 3, 100),
	(38, 14, 3, 100),
	(39, 15, 3, 100),
	(40, 16, 3, 100);
/*!40000 ALTER TABLE `dishes_ingredients` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.dishes_order
CREATE TABLE IF NOT EXISTS `dishes_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `dish_fk_2` (`dish_id`),
  KEY `order_fk_2` (`order_id`),
  CONSTRAINT `dish_fk_2` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `order_fk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes_order: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `dishes_order` DISABLE KEYS */;
INSERT IGNORE INTO `dishes_order` (`id`, `dish_id`, `order_id`) VALUES
	(3, 16, 5),
	(4, 15, 6),
	(5, 10, 7),
	(6, 10, 8),
	(7, 9, 9),
	(29, 15, 9),
	(30, 8, 11),
	(31, 9, 11),
	(32, 10, 11),
	(33, 11, 11),
	(34, 12, 11),
	(35, 13, 11),
	(36, 14, 11),
	(37, 15, 11),
	(38, 16, 11),
	(39, 8, 11),
	(40, 9, 11),
	(41, 10, 11);
/*!40000 ALTER TABLE `dishes_order` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.dish_types
CREATE TABLE IF NOT EXISTS `dish_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dish_types: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `dish_types` DISABLE KEYS */;
INSERT IGNORE INTO `dish_types` (`id`, `dish_type_name`) VALUES
	(1, 'Бургеры'),
	(2, 'Что-то еще'),
	(3, 'И еще что-то');
/*!40000 ALTER TABLE `dish_types` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calories` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.ingredients: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `ingredients` (`id`, `name`, `description`, `calories`) VALUES
	(1, 'Кунжутная булочка', 'Смачная булочка с кунжутом', 20),
	(2, 'Кусок мяса', 'Отбивная приготовленная на огне', 500),
	(3, 'Салат', 'Капуста', 10),
	(4, 'Ничего', 'Ничего', 0),
	(5, 'Что-то', 'Что-то', 1);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` int(11) DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_payed` text COLLATE utf8mb4_unicode_ci DEFAULT 'False',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.orders: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`id`, `total_price`, `date`, `is_payed`) VALUES
	(1, 300, '2020-02-22 01:20:50', 'True'),
	(2, 200, '2020-02-22 01:20:50', 'True'),
	(3, 200, '2020-02-22 01:20:50', 'True'),
	(4, 200, '2020-02-22 01:20:50', 'True'),
	(5, 500, '2020-02-24 23:37:59', 'True'),
	(6, 650, '2020-02-24 23:45:40', 'True'),
	(7, 120, '2020-02-24 23:57:14', 'True'),
	(8, 120, '2020-02-24 23:57:17', 'True'),
	(9, 120, '2020-02-24 23:57:59', 'True'),
	(10, 860, '2020-02-25 00:00:01', 'True'),
	(11, 1440, '2020-02-25 00:19:49', 'True'),
	(12, 0, '2020-02-25 00:39:54', 'True'),
	(13, 0, '2020-02-25 00:53:32', 'False');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_order_id_fk_1` (`last_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `phone`, `password`, `name`, `image`, `last_order_id`) VALUES
	(2, '79196413561', '123qwe', 'Egor', 'adm.jpg', 13);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.users_orders
CREATE TABLE IF NOT EXISTS `users_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_fk_1` (`user_id`),
  KEY `order_fk_1` (`order_id`),
  CONSTRAINT `order_fk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `user_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.users_orders: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `users_orders` DISABLE KEYS */;
INSERT IGNORE INTO `users_orders` (`id`, `user_id`, `order_id`) VALUES
	(20, 2, 1),
	(21, 2, 2),
	(24, 2, 5),
	(25, 2, 6),
	(26, 2, 7),
	(27, 2, 8),
	(28, 2, 9),
	(29, 2, 10),
	(30, 2, 11),
	(31, 2, 12),
	(32, 2, 13);
/*!40000 ALTER TABLE `users_orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
