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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` int(11) DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_src` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT IGNORE INTO `dishes` (`id`, `name`, `price`, `description`, `img_src`) VALUES
	(1, 'Burger', 120, 'Очень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургер', 'dish1.png'),
	(2, 'Burger', 120, 'Очень вкусный бургер', 'dish2.png'),
	(3, 'Burger', 120, 'Очень вкусный бургер', 'dish3.png'),
	(4, 'Burger', 120, 'Очень вкусный бургер', 'dish3.png'),
	(5, 'Burger', 120, 'Очень вкусный бургер', 'dish3.png'),
	(6, 'Burger', 120, 'Очень вкусный бургер', 'dish3.png'),
	(7, 'Burger', 120, 'Очень вкусный бургер', 'dish3.png');
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
  CONSTRAINT `dish_fk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `ingredient_fk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes_ingredients: ~25 rows (приблизительно)
/*!40000 ALTER TABLE `dishes_ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `dishes_ingredients` (`id`, `dish_id`, `ingredient_id`, `weight`) VALUES
	(1, 1, 1, 100),
	(2, 2, 1, 200),
	(3, 3, 1, 50),
	(4, 3, 2, 30),
	(5, 3, 4, 30),
	(6, 3, 5, 30),
	(7, 3, 3, 30),
	(8, 3, 3, 30),
	(9, 3, 3, 30),
	(10, 2, 1, 200),
	(11, 2, 1, 200),
	(12, 2, 1, 200),
	(13, 2, 1, 200),
	(14, 2, 1, 200),
	(15, 2, 1, 200),
	(16, 2, 1, 200),
	(17, 2, 1, 200),
	(18, 1, 1, 100),
	(19, 1, 1, 100),
	(20, 1, 1, 100),
	(21, 1, 1, 100),
	(22, 1, 1, 100),
	(23, 1, 1, 100),
	(24, 1, 1, 100),
	(25, 1, 1, 100);
/*!40000 ALTER TABLE `dishes_ingredients` ENABLE KEYS */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.orders: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`id`, `total_price`, `date`) VALUES
	(1, 100, '2020-02-22 01:20:50'),
	(2, 200, '2020-02-22 01:20:50'),
	(3, 200, '2020-02-22 01:20:50'),
	(4, 200, '2020-02-22 01:20:50');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `phone`, `password`, `name`, `image`) VALUES
	(1, '79196413561', '123qwe', 'Egor', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.users_orders: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `users_orders` DISABLE KEYS */;
INSERT IGNORE INTO `users_orders` (`id`, `user_id`, `order_id`) VALUES
	(1, 1, 1),
	(2, 1, 2);
/*!40000 ALTER TABLE `users_orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
