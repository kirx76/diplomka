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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT IGNORE INTO `dishes` (`id`, `name`, `price`, `description`, `img_src`, `dish_type`) VALUES
	(1, 'Сырный Джо', 220, 'Котлета из 100% говядины, покрытая плавленным сыром, сыром Пармезан и сыром Чеддер, со свежими помидорами, листовым салатом, все заправлено двумя соусами: Цезарь и Сырный.', 'dish_sirnii_djo.png', 1),
	(2, 'Биг Кинг', 150, 'Два бифштекса из 100% говядины с фирменным соусом «Биг Кинг», ломтики сыра, листовой салат, хрустящие огурчики и свежий лук на мягкой булочке с кунжутом.', 'dish_big_king.png', 1),
	(3, 'Воппер с сыром', 227, 'Легендарный бургер с бифштексом из 100% говядины на нежной булочке с кунжутом, заправленный сочными помидорами, двумя ломтиками сыра, листовым салатом, майонезом, хрустящими огурчиками и луком.', 'dish_vopper_s_sirom.png', 1),
	(4, 'Салат Цезарь с креветками', 300, 'Легкий салат Цезарь с листьями салата айсберг, нежными королевскими креветками в легкой хрустящей панировке, сыром пармезан и чесночными сухариками под нежным соусом Цезарь.', 'dish_salad_cesar_s_krevetkami.png', 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes_ingredients: ~21 rows (приблизительно)
/*!40000 ALTER TABLE `dishes_ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `dishes_ingredients` (`id`, `dish_id`, `ingredient_id`, `weight`) VALUES
	(1, 4, 1, 10),
	(2, 4, 2, 10),
	(3, 4, 3, 10),
	(4, 4, 4, 10),
	(5, 4, 5, 10),
	(6, 4, 6, 10),
	(7, 1, 7, 100),
	(8, 1, 9, 10),
	(9, 1, 10, 10),
	(10, 1, 11, 10),
	(11, 1, 12, 10),
	(12, 2, 7, 100),
	(13, 2, 9, 10),
	(14, 2, 10, 10),
	(15, 2, 11, 10),
	(16, 2, 12, 10),
	(17, 3, 7, 100),
	(18, 3, 9, 10),
	(19, 3, 10, 10),
	(20, 3, 11, 10),
	(21, 3, 12, 10);
/*!40000 ALTER TABLE `dishes_ingredients` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.dishes_order
CREATE TABLE IF NOT EXISTS `dishes_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `dish_fk_2` (`dish_id`),
  KEY `order_fk_2` (`order_id`),
  CONSTRAINT `dish_fk_2` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `order_fk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dishes_order: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `dishes_order` DISABLE KEYS */;
INSERT IGNORE INTO `dishes_order` (`id`, `dish_id`, `order_id`, `count`) VALUES
	(64, 1, 1, 2),
	(65, 4, 1, 2),
	(66, 3, 1, 2),
	(67, 2, 1, 2);
/*!40000 ALTER TABLE `dishes_order` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.dish_types
CREATE TABLE IF NOT EXISTS `dish_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.dish_types: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `dish_types` DISABLE KEYS */;
INSERT IGNORE INTO `dish_types` (`id`, `dish_type_name`) VALUES
	(1, 'Бургеры'),
	(2, 'Салаты'),
	(3, 'Напитки'),
	(4, 'Картошка'),
	(5, 'Закуски'),
	(6, 'Роллы'),
	(7, 'Десерты'),
	(8, 'Новинки'),
	(9, 'Дополнительно');
/*!40000 ALTER TABLE `dish_types` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calories` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.ingredients: ~12 rows (приблизительно)
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT IGNORE INTO `ingredients` (`id`, `name`, `description`, `calories`) VALUES
	(1, 'Листья салата Айсберг', 'Салат Айсберг Салат Айсберг – овощная культура, относящаяся к кочанным салатам, имеет светло-зелёные листья, завернутые в небольшие, не очень плотные кочаны, сочные и хрустящие на вкус.', 14),
	(2, 'Королевские креветки', 'Королевские креветки – это не определенный вид ракообразных, а общее название больших по размеру креветок.', 87),
	(3, 'Панировочные сухари', 'Панировочные сухари — сухарная крошка из пшеничного хлеба, используемая для обсыпки обжариваемых изделий из мяса, рыбы и овощей.', 395),
	(4, 'Сыр пармезан', 'Пармеза́н — итальянский сорт твёрдого сыра долгого созревания.', 431),
	(5, 'Чесночные сухарики', 'Сухарики с ароматом чеснока.', 239),
	(6, 'Соус Цезарь', 'Соус с именем великого полководца.', 361),
	(7, 'Котлета из говядины', 'Сочная котлета из 100% говядины.', 260),
	(8, 'Плавленный сыр', NULL, 148),
	(9, 'Сыр Чеддер', 'Чеддер — популярный английский сыр жирностью от 35 до 45%.', 402),
	(10, 'Листовой салат', 'Лату́к посевной, или Сала́т латук — вид однолетних травянистых растений рода Латук семейства Астровые.', 15),
	(11, 'Сырный соус', 'Всеми любимый сырный соус.', 356),
	(12, 'Булочка для бургера', NULL, 272);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;

-- Дамп структуры для таблица diplom.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` int(11) DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_payed` text COLLATE utf8mb4_unicode_ci DEFAULT 'False',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.orders: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`id`, `total_price`, `date`, `is_payed`) VALUES
	(1, 897, '2020-03-11 19:10:11', 'False');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы diplom.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `phone`, `password`, `name`, `image`, `last_order_id`) VALUES
	(1, '79196413561', '123qwe', 'Egor', 'adm.jpg', 1);
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

-- Дамп данных таблицы diplom.users_orders: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users_orders` DISABLE KEYS */;
INSERT IGNORE INTO `users_orders` (`id`, `user_id`, `order_id`) VALUES
	(2, 1, 1);
/*!40000 ALTER TABLE `users_orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
