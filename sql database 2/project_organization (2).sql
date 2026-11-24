-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 20 2026 г., 11:11
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project_organization`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

CREATE TABLE `contract` (
  `ID_contract` int NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `summ` decimal(10,2) DEFAULT NULL,
  `ID_project` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `contract`
--

INSERT INTO `contract` (`ID_contract`, `number`, `date`, `summ`, `ID_project`) VALUES
(1, 'Д-26/001', '2026-01-20', '1500000.00', 1),
(2, 'Д-26/002', '2026-03-10', '850000.50', 2),
(3, 'Д-26/003', '2026-01-05', '400000.00', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `ID_customer` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `adress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`ID_customer`, `name`, `phone`, `adress`) VALUES
(1, 'ООО \"СтройИнвест\"', '+7 (999) 111-22-33', 'г. Москва, ул. Ленина, д. 15'),
(2, 'ПАО \"ГорРазвитие\"', '+7 (999) 222-33-44', 'г. Москва, пр. Мира, д. 102'),
(3, 'ИП Смирнов А.В.', '+7 (900) 333-44-55', 'г. Подольск, ул. Кирова, д. 8');

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `ID_department` int NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`ID_department`, `department_name`) VALUES
(1, 'Архитектурный отдел'),
(2, 'Конструкторский отдел'),
(3, 'Сметный отдел');

-- --------------------------------------------------------

--
-- Структура таблицы `document`
--

CREATE TABLE `document` (
  `ID_document` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ID_project` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `document`
--

INSERT INTO `document` (`ID_document`, `name`, `type`, `date`, `ID_project`) VALUES
(1, 'Техническое задание на ЖК', 'ТЗ', '2026-01-25', 1),
(2, 'Чертеж фасада_v1', 'Чертеж', '2026-02-18', 1),
(3, 'Акт сдачи-приемки работ', 'Акт', '2026-02-05', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `ID_employee` int NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `ID_department` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`ID_employee`, `surname`, `name`, `post`, `phone`, `birth_date`, `ID_department`) VALUES
(1, 'Иванов', 'Иван', 'Главный архитектор', '+7 (910) 111-00-11', '1988-05-14', 1),
(2, 'Петрова', 'Анна', 'Инженер-конструктор', '+7 (910) 222-00-22', '1995-11-20', 2),
(3, 'Сидоров', 'Алексей', 'Руководитель проектов', '+7 (910) 333-00-33', '1982-03-08', 1),
(4, 'Волкова', 'Елена', 'Инженер-сметчик', '+7 (910) 444-00-44', '1990-09-01', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

CREATE TABLE `equipment` (
  `ID_equipment` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Исправен'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `equipment`
--

INSERT INTO `equipment` (`ID_equipment`, `name`, `serial_number`, `status`) VALUES
(1, 'Тахеометр электронный Leica', 'SN-98231', 'В работе'),
(2, 'Лазерный 3D-сканер Faro', 'SN-44102', 'В работе'),
(3, 'Плоттер широкоформатный HP', 'SN-10029', 'В резерве');

-- --------------------------------------------------------

--
-- Структура таблицы `object`
--

CREATE TABLE `object` (
  `ID_object` int NOT NULL,
  `name` char(100) DEFAULT NULL,
  `adress` char(150) DEFAULT NULL,
  `ID_customer` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `object`
--

INSERT INTO `object` (`ID_object`, `name`, `adress`, `ID_customer`) VALUES
(1, 'Жилой комплекс \"Рассвет\"', 'г. Москва, ул. Строителей, д. 5', 1),
(2, 'Торговый центр \"Омега\"', 'г. Химки, Ленинградское ш., д. 1', 2),
(3, 'Складской комплекс', 'г. Подольск, Промзона 2', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `ID_project` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ID_object` int DEFAULT NULL,
  `ID_employee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`ID_project`, `name`, `start_date`, `status`, `ID_object`, `ID_employee`) VALUES
(1, 'ПД для ЖК \"Рассвет\"', '2026-02-01', 'В работе', 1, 3),
(2, 'Реконструкция ТЦ', '2026-03-15', 'Согласование', 2, 1),
(3, 'Проектирование склада', '2026-01-10', 'Завершен', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `project_equipment`
--

CREATE TABLE `project_equipment` (
  `ID_allocation` int NOT NULL,
  `ID_project` int NOT NULL,
  `ID_equipment` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `project_equipment`
--

INSERT INTO `project_equipment` (`ID_allocation`, `ID_project`, `ID_equipment`, `start_date`, `end_date`) VALUES
(1, 1, 1, '2026-02-05', '2026-02-25'),
(2, 1, 2, '2026-02-10', '2026-03-05'),
(3, 2, 2, '2026-03-16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subcontractor_work`
--

CREATE TABLE `subcontractor_work` (
  `ID_work` int NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `work_description` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `ID_project` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subcontractor_work`
--

INSERT INTO `subcontractor_work` (`ID_work`, `company_name`, `work_description`, `cost`, `ID_project`) VALUES
(1, 'ООО \"ГеоМониторинг\"', 'Инженерно-геологические изыскания', '250000.00', 1),
(2, 'ИП \"ЭнергоАудит\"', 'Проверка электросетей и теплорасчета', '120000.00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `ID_task` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ID_project` int DEFAULT NULL,
  `ID_employee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`ID_task`, `name`, `deadline`, `status`, `ID_project`, `ID_employee`) VALUES
(1, 'Подготовка архитектурного плана', '2026-02-20', 'Выполнена', 1, 1),
(2, 'Расчет несущих конструкций', '2026-03-01', 'В работе', 1, 2),
(3, 'Составление сметы на материалы', '2026-04-10', 'Ожидает начала', 2, 4),
(4, 'Подготовка итоговой документации', '2026-02-01', 'Выполнена', 3, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`ID_contract`),
  ADD KEY `ID_project` (`ID_project`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_customer`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID_department`);

--
-- Индексы таблицы `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`ID_document`),
  ADD KEY `ID_project` (`ID_project`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID_employee`),
  ADD KEY `ID_department` (`ID_department`);

--
-- Индексы таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`ID_equipment`);

--
-- Индексы таблицы `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`ID_object`),
  ADD KEY `ID_customer` (`ID_customer`);

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID_project`),
  ADD KEY `ID_object` (`ID_object`),
  ADD KEY `ID_employee` (`ID_employee`);

--
-- Индексы таблицы `project_equipment`
--
ALTER TABLE `project_equipment`
  ADD PRIMARY KEY (`ID_allocation`),
  ADD KEY `ID_project` (`ID_project`),
  ADD KEY `ID_equipment` (`ID_equipment`);

--
-- Индексы таблицы `subcontractor_work`
--
ALTER TABLE `subcontractor_work`
  ADD PRIMARY KEY (`ID_work`),
  ADD KEY `ID_project` (`ID_project`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`ID_task`),
  ADD KEY `ID_project` (`ID_project`),
  ADD KEY `ID_employee` (`ID_employee`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `project` (`ID_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `project` (`ID_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID_department`) REFERENCES `department` (`ID_department`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `object_ibfk_1` FOREIGN KEY (`ID_customer`) REFERENCES `customer` (`ID_customer`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ID_object`) REFERENCES `object` (`ID_object`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`ID_employee`) REFERENCES `employee` (`ID_employee`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project_equipment`
--
ALTER TABLE `project_equipment`
  ADD CONSTRAINT `project_equipment_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `project` (`ID_project`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_equipment_ibfk_2` FOREIGN KEY (`ID_equipment`) REFERENCES `equipment` (`ID_equipment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subcontractor_work`
--
ALTER TABLE `subcontractor_work`
  ADD CONSTRAINT `subcontractor_work_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `project` (`ID_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`ID_project`) REFERENCES `project` (`ID_project`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`ID_employee`) REFERENCES `employee` (`ID_employee`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
