# Лабораторная работа №1. Унифицированный интерфейс PDO
## Создание таблиц:
### Таблица клиентов
```sql
CREATE TABLE `client` (
	`id_client` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(30) NOT NULL,
	`login` VARCHAR(30) NOT NULL,
	`password` VARCHAR(30) NOT NULL,
	`ip` VARCHAR(30) NOT NULL,
	`balance` INT NOT NULL
);
```

### Таблица сеансов
```sql
CREATE TABLE `seance` (
	`id_seance` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`start` TIMESTAMP NOT NULL,
	`stop` TIMESTAMP NOT NULL,
	`in_traffic` INT UNSIGNED,
	`out_traffic` INT UNSIGNED,
	`fid_client` INT UNSIGNED NOT NULL,
	FOREIGN KEY (`fid_client`) REFERENCES `client` (`id_client`)
);
```

## Заполнение таблиц:
### Данные клиентов

```sql
INSERT INTO client (`name`, `login`, `password`, `ip`, `balance`) VALUES
('Inigo Mendez', 'user1', 'qwerty123', '79.151.83.26', 120),
('Kanye Ryder', 'user2', '1234567890', '10.29.133.86', -10),
('Caspar Hume', 'user3', 'qwerty', '200.224.8.98', 0);
```

### Данные сеансов
```sql
INSERT INTO seance (`start`, `stop`, `in_traffic`, `out_traffic`, `fid_client`) VALUES
('2021-01-20 20:05:30', '2021-01-20 21:50:09', 1500, 100, 1),
('2021-01-24 14:06:05', '2021-01-24 14:40:05', 500, NULL, 1),
('2021-01-21 13:37:37', '2021-01-22 18:07:25', 650, 700, 2),
('2021-01-29 09:59:18', '2021-01-29 16:46:02', 255, 50, 1),
('2021-01-30 02:46:31', '2021-01-30 14:02:32', 1600, 400, 3),
('2021-01-26 06:04:37', '2021-01-26 18:16:17', 4500, 500, 1),
('2021-01-31 06:43:53', '2021-01-31 09:52:44', 120, NULL, 2),
('2021-01-26 07:37:21', '2021-01-26 23:16:05', 650, 2500, 1),
('2021-01-31 05:20:10', '2021-01-31 05:45:15', 900, NULL, 2),
('2021-01-27 13:15:08', '2021-01-27 14:52:49', 95, 5500, 1),
('2021-01-23 09:19:03', '2021-01-24 01:19:03', 450, 10000, 3);
```
***
## Для выполнения задачи поставленной в лабораторной работе, за основу были взяты следующие запросы:
- ### Получение статистики работы в сети выбранного клиента:
  ```sql
  SELECT SUM(`in_traffic`), SUM(`out_traffic`) FROM `seance`
  WHERE `seance`.`fid_client` = 2;
  ```
- ### Получение статистики работы в сети за указанный промежуток времени:
  ```sql
  SELECT SUM(`in_traffic`), SUM(`out_traffic`) FROM `seance`
  WHERE `seance`.`start` > '2021-01-24 00:00:00' AND `seance`.`stop` < '2021-01-26 23:00:00';
  ```
- ### Вывод списка клиентов с отрицательным балансом счета:
  ```sql
  SELECT `name` FROM `client`
  WHERE `client`.`balance` < 0;
  ```
