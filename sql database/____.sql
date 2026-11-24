-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 04 2026 г., 11:19
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ИС`
--

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id_department` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id_department`, `Name`) VALUES
(1, 'Бухгалтерия'),
(2, 'IT-Отдел'),
(3, 'Отдел продаж'),
(4, 'Маркетинг'),
(5, 'Кадровая служба');

-- --------------------------------------------------------

--
-- Структура таблицы `distribution_of_employees_in_the_department`
--

CREATE TABLE `distribution_of_employees_in_the_department` (
  `id_distribution_of_employees_in_the_department` int(11) NOT NULL,
  `id_staff` int(11) NOT NULL,
  `id_department` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `distribution_of_employees_in_the_department`
--

INSERT INTO `distribution_of_employees_in_the_department` (`id_distribution_of_employees_in_the_department`, `id_staff`, `id_department`) VALUES
(2, 2, 2),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Position`
--

CREATE TABLE `Position` (
  `id_Position` int(11) NOT NULL,
  `Type_of_position` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Position`
--

INSERT INTO `Position` (`id_Position`, `Type_of_position`) VALUES
(1, 'Менеджер'),
(2, 'Разработчик'),
(3, 'Дизайнер'),
(4, 'Бухгалтер');

-- --------------------------------------------------------

--
-- Структура таблицы `Staff`
--

CREATE TABLE `Staff` (
  `ID_Staff` int(11) NOT NULL,
  `Surname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Patronymic` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date of birth` date NOT NULL,
  `Salary` float NOT NULL,
  `ID_Position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Staff`
--

INSERT INTO `Staff` (`ID_Staff`, `Surname`, `Name`, `Patronymic`, `Date of birth`, `Salary`, `ID_Position`) VALUES
(2, 'Смирнов', 'Александр', 'Игоревич', '1988-01-10', 49500, 3),
(3, 'Сидоров', 'Сергей', 'Сергеевич', '1995-07-20', 55000, 3),
(4, 'Романова', 'Иван', 'Антонович', '1973-05-12', 55000, 2),
(5, 'Зверев', 'Виталий', 'Семенович', '1989-06-15', 40000, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`);

--
-- Индексы таблицы `distribution_of_employees_in_the_department`
--
ALTER TABLE `distribution_of_employees_in_the_department`
  ADD PRIMARY KEY (`id_distribution_of_employees_in_the_department`),
  ADD KEY `id_staff` (`id_staff`),
  ADD KEY `id_department` (`id_department`);

--
-- Индексы таблицы `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`id_Position`);

--
-- Индексы таблицы `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`ID_Staff`),
  ADD KEY `ID_Position` (`ID_Position`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `distribution_of_employees_in_the_department`
--
ALTER TABLE `distribution_of_employees_in_the_department`
  MODIFY `id_distribution_of_employees_in_the_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Staff`
--
ALTER TABLE `Staff`
  MODIFY `ID_Staff` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `distribution_of_employees_in_the_department`
--
ALTER TABLE `distribution_of_employees_in_the_department`
  ADD CONSTRAINT `distribution_of_employees_in_the_department_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`ID_Staff`),
  ADD CONSTRAINT `distribution_of_employees_in_the_department_ibfk_2` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`);

--
-- Ограничения внешнего ключа таблицы `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ID_Position`) REFERENCES `Position` (`id_Position`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`ID_Position`) REFERENCES `Position` (`id_Position`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
