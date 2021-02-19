-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 18 2021 г., 15:56
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pdo`
--
CREATE DATABASE IF NOT EXISTS `pdo` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `pdo`;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `balance` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `name`, `login`, `password`, `ip`, `balance`) VALUES
(1, 'Inigo Mendez', 'user1', 'qwerty123', '79.151.83.26', 120),
(2, 'Kanye Ryder', 'user2', '1234567890', '10.29.133.86', -10),
(3, 'Caspar Hume', 'user3', 'qwerty', '200.224.8.98', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `seance`
--

CREATE TABLE `seance` (
  `id_seance` int UNSIGNED NOT NULL,
  `start` timestamp NOT NULL,
  `stop` timestamp NOT NULL,
  `in_traffic` int UNSIGNED DEFAULT NULL,
  `out_traffic` int UNSIGNED DEFAULT NULL,
  `fid_client` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `seance`
--

INSERT INTO `seance` (`id_seance`, `start`, `stop`, `in_traffic`, `out_traffic`, `fid_client`) VALUES
(1, '2021-01-20 18:05:30', '2021-01-20 19:50:09', 1500, 100, 1),
(2, '2021-01-24 12:06:05', '2021-01-24 12:40:05', 500, NULL, 1),
(3, '2021-01-21 11:37:37', '2021-01-22 16:07:25', 650, 700, 2),
(4, '2021-01-29 07:59:18', '2021-01-29 14:46:02', 255, 50, 1),
(5, '2021-01-30 00:46:31', '2021-01-30 12:02:32', 1600, 400, 3),
(6, '2021-01-26 04:04:37', '2021-01-26 16:16:17', 4500, 500, 1),
(7, '2021-01-31 04:43:53', '2021-01-31 07:52:44', 120, NULL, 2),
(8, '2021-01-26 05:37:21', '2021-01-26 21:16:05', 650, 2500, 1),
(9, '2021-01-31 03:20:10', '2021-01-31 03:45:15', 900, NULL, 2),
(10, '2021-01-27 11:15:08', '2021-01-27 12:52:49', 95, 5500, 1),
(11, '2021-01-23 07:19:03', '2021-01-23 23:19:03', 450, 10000, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `fid_client` (`fid_client`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`fid_client`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
