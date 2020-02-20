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


-- Дамп структуры базы данных diplomka
CREATE DATABASE IF NOT EXISTS `diplomka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `diplomka`;

-- Дамп структуры для таблица diplomka.dish
CREATE TABLE IF NOT EXISTS `dish` (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name` text COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `dish_price` int(11) DEFAULT NULL,
  `ingredients_list_id` int(11) DEFAULT NULL,
  `dish_img_src` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dish_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplomka.dish: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT IGNORE INTO `dish` (`dish_id`, `dish_name`, `dish_price`, `ingredients_list_id`, `dish_img_src`, `dish_description`) VALUES
	(1, 'Burger', 120, 1, 'dish1.png', 'Очень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургерОчень вкусный бургер'),
	(2, 'Burger', 120, 1, 'dish2.png', 'Очень вкусный бургер'),
	(3, 'Burger', 120, 1, 'dish3.png', 'Очень вкусный бургер'),
	(4, 'Burger', 120, 1, 'dish3.png', 'Очень вкусный бургер'),
	(5, 'Burger', 120, 1, 'dish3.png', 'Очень вкусный бургер'),
	(6, 'Burger', 120, 1, 'dish3.png', 'Очень вкусный бургер'),
	(7, 'Burger', 120, 1, 'dish3.png', 'Очень вкусный бургер');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;

-- Дамп структуры для таблица diplomka.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredient_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredient_cal` int(11) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplomka.ingredients: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `ingredients` (`ingredient_id`, `ingredient_name`, `ingredient_description`, `ingredient_cal`) VALUES
	(1, 'Кунжутная булочка', 'Смачная булочка с кунжутом', 20),
	(2, 'Кусок мяса', 'Отбивная приготовленная на огне', 500),
	(3, 'Салат', 'Капуста', 10),
	(4, 'Ничего', 'Ничего', 0),
	(5, 'Что-то', 'Что-то', 1);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;

-- Дамп структуры для таблица diplomka.ingredients_list_id
CREATE TABLE IF NOT EXISTS `ingredients_list_id` (
  `ingredient_id` int(11) DEFAULT 0,
  `dish_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplomka.ingredients_list_id: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `ingredients_list_id` DISABLE KEYS */;
INSERT IGNORE INTO `ingredients_list_id` (`ingredient_id`, `dish_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(0, 2);
/*!40000 ALTER TABLE `ingredients_list_id` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
