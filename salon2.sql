-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 20 2024 г., 22:26
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
-- База данных: `salon2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CLIENT`
--

CREATE TABLE `CLIENT` (
  `ID` int(11) NOT NULL,
  `FIO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CLIENT`
--

INSERT INTO `CLIENT` (`ID`, `FIO`) VALUES
(1, 'Шадрина И.В'),
(2, 'Замятина Н.В'),
(3, 'Лужакова М.С'),
(4, 'Иванова Б.В'),
(5, 'Анисимова В.М');

-- --------------------------------------------------------

--
-- Структура таблицы `Cosmet`
--

CREATE TABLE `Cosmet` (
  `ID` int(11) NOT NULL,
  `FIO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Cosmet`
--

INSERT INTO `Cosmet` (`ID`, `FIO`) VALUES
(1, 'Агапова А.А'),
(2, 'Сулумова Э.И'),
(3, 'Манченко Д.З'),
(4, 'Лутова Н.В'),
(5, 'Янковская А.Т');

-- --------------------------------------------------------

--
-- Структура таблицы `ren_service`
--

CREATE TABLE `ren_service` (
  `ID` int(11) NOT NULL,
  `Id_session` int(11) NOT NULL,
  `Id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ren_service`
--

INSERT INTO `ren_service` (`ID`, `Id_session`, `Id_service`) VALUES
(1, 4, 4),
(2, 6, 2),
(3, 1, 5),
(4, 2, 1),
(5, 3, 2),
(6, 5, 1),
(7, 7, 2),
(8, 8, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `SERVICE`
--

CREATE TABLE `SERVICE` (
  `ID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SERVICE`
--

INSERT INTO `SERVICE` (`ID`, `Title`, `Price`) VALUES
(1, 'Кислотный пилинг', 1500),
(2, 'Биоревитализация кожи рук', 1400),
(3, 'Мезотерапия лица и шеи', 800),
(4, 'Механическая чистка лица', 1000),
(5, 'Микротоковая терапия', 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `SESSION`
--

CREATE TABLE `SESSION` (
  `ID` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `ID_COSMET` int(11) NOT NULL,
  `Date and time start` datetime NOT NULL,
  `Date and time stop` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SESSION`
--

INSERT INTO `SESSION` (`ID`, `ID_CLIENT`, `ID_COSMET`, `Date and time start`, `Date and time stop`) VALUES
(1, 1, 5, '2024-02-21 11:30:00', '2024-02-21 12:45:00'),
(2, 4, 3, '2024-03-03 17:45:00', '2024-03-03 18:45:00'),
(3, 2, 2, '2024-02-21 20:44:48', '2024-02-21 20:44:48'),
(4, 3, 2, '2024-02-27 19:00:00', '2024-02-27 20:55:00'),
(5, 5, 1, '2024-03-14 14:00:00', '2024-03-14 16:20:00'),
(6, 4, 3, '2024-03-07 10:00:00', '2024-03-07 11:56:00'),
(7, 4, 2, '2024-04-30 12:50:51', '2024-04-30 14:50:51'),
(8, 2, 3, '2024-05-27 16:00:00', '2024-05-27 16:50:51');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Cosmet`
--
ALTER TABLE `Cosmet`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `ren_service`
--
ALTER TABLE `ren_service`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_service` (`Id_service`),
  ADD KEY `Id_session` (`Id_session`);

--
-- Индексы таблицы `SERVICE`
--
ALTER TABLE `SERVICE`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `SESSION`
--
ALTER TABLE `SESSION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CLIENT` (`ID_CLIENT`),
  ADD KEY `ID_COSMET` (`ID_COSMET`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `CLIENT`
--
ALTER TABLE `CLIENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Cosmet`
--
ALTER TABLE `Cosmet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ren_service`
--
ALTER TABLE `ren_service`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `SERVICE`
--
ALTER TABLE `SERVICE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `SESSION`
--
ALTER TABLE `SESSION`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ren_service`
--
ALTER TABLE `ren_service`
  ADD CONSTRAINT `ren_service_ibfk_1` FOREIGN KEY (`Id_service`) REFERENCES `SERVICE` (`ID`),
  ADD CONSTRAINT `ren_service_ibfk_2` FOREIGN KEY (`Id_session`) REFERENCES `SESSION` (`ID`);

--
-- Ограничения внешнего ключа таблицы `SESSION`
--
ALTER TABLE `SESSION`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `CLIENT` (`ID`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`ID_COSMET`) REFERENCES `Cosmet` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
