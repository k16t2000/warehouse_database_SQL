-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 09 2020 г., 09:36
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `veebipoodtsimiris`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ladu`
--

CREATE TABLE `ladu` (
  `laduID` int(11) NOT NULL,
  `laduNimi` varchar(20) DEFAULT NULL,
  `laduAadress` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ladu`
--

INSERT INTO `ladu` (`laduID`, `laduNimi`, `laduAadress`) VALUES
(1, 'Smarten Logistics', 'Rae vald'),
(2, 'Maxima', 'Taru'),
(3, 'Balbiino', 'Tallinn'),
(4, 'Prisma', 'Rae vald');

-- --------------------------------------------------------

--
-- Структура таблицы `toodegrupp`
--

CREATE TABLE `toodegrupp` (
  `toodeGruppID` int(11) NOT NULL,
  `toodeGrupp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `toodegrupp`
--

INSERT INTO `toodegrupp` (`toodeGruppID`, `toodeGrupp`) VALUES
(1, 'söök'),
(2, 'jook'),
(3, 'keemia'),
(4, 'mänguasjad');

-- --------------------------------------------------------

--
-- Структура таблицы `toodeladu`
--

CREATE TABLE `toodeladu` (
  `toodeLaduID` int(11) NOT NULL,
  `toode` int(11) DEFAULT NULL,
  `ladu` int(11) DEFAULT NULL,
  `toodeLaduKuupaev` date DEFAULT NULL,
  `toodeLaduKogus` int(11) DEFAULT NULL,
  `toodeLaduHind` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `toodeladu`
--

INSERT INTO `toodeladu` (`toodeLaduID`, `toode`, `ladu`, `toodeLaduKuupaev`, `toodeLaduKogus`, `toodeLaduHind`) VALUES
(1, 1, 4, '2020-03-08', 100, '52.80'),
(2, 3, 2, '2020-03-05', 1000, '50.50'),
(3, 2, 2, '2020-03-03', 100, '15.00'),
(4, 3, 1, '2020-03-09', 100, '10.00'),
(5, 1, 1, '2020-03-09', 10, '30.00');

-- --------------------------------------------------------

--
-- Структура таблицы `tooted`
--

CREATE TABLE `tooted` (
  `toodeID` int(11) NOT NULL,
  `toodeNimi` varchar(20) NOT NULL,
  `toodeKirjeldus` text NOT NULL,
  `tootja` int(11) NOT NULL,
  `toodeGrupp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tooted`
--

INSERT INTO `tooted` (`toodeID`, `toodeNimi`, `toodeKirjeldus`, `tootja`, `toodeGrupp`) VALUES
(1, 'auto', 'väga ilus auto', 1, 1),
(2, 'Piim ', 'Pre pakk', 1, 1),
(3, 'Coca-Cola', 'Suur pakk', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tootja`
--

CREATE TABLE `tootja` (
  `tootjaID` int(11) NOT NULL,
  `toodeNimi` varchar(25) DEFAULT NULL,
  `tootjaAAdress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tootja`
--

INSERT INTO `tootja` (`tootjaID`, `toodeNimi`, `tootjaAAdress`) VALUES
(1, 'Eesti Piim', 'Rapla, Tehnika 20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ladu`
--
ALTER TABLE `ladu`
  ADD PRIMARY KEY (`laduID`);

--
-- Индексы таблицы `toodegrupp`
--
ALTER TABLE `toodegrupp`
  ADD PRIMARY KEY (`toodeGruppID`);

--
-- Индексы таблицы `toodeladu`
--
ALTER TABLE `toodeladu`
  ADD PRIMARY KEY (`toodeLaduID`),
  ADD KEY `toode` (`toode`),
  ADD KEY `ladu` (`ladu`);

--
-- Индексы таблицы `tooted`
--
ALTER TABLE `tooted`
  ADD PRIMARY KEY (`toodeID`),
  ADD KEY `tootja` (`tootja`),
  ADD KEY `toodeGrupp_fh` (`toodeGrupp`);

--
-- Индексы таблицы `tootja`
--
ALTER TABLE `tootja`
  ADD PRIMARY KEY (`tootjaID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ladu`
--
ALTER TABLE `ladu`
  MODIFY `laduID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `toodegrupp`
--
ALTER TABLE `toodegrupp`
  MODIFY `toodeGruppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `toodeladu`
--
ALTER TABLE `toodeladu`
  MODIFY `toodeLaduID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tooted`
--
ALTER TABLE `tooted`
  MODIFY `toodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tootja`
--
ALTER TABLE `tootja`
  MODIFY `tootjaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `toodeladu`
--
ALTER TABLE `toodeladu`
  ADD CONSTRAINT `toodeladu_ibfk_1` FOREIGN KEY (`toode`) REFERENCES `tooted` (`toodeID`),
  ADD CONSTRAINT `toodeladu_ibfk_2` FOREIGN KEY (`ladu`) REFERENCES `ladu` (`laduID`);

--
-- Ограничения внешнего ключа таблицы `tooted`
--
ALTER TABLE `tooted`
  ADD CONSTRAINT `toodeGrupp_fh` FOREIGN KEY (`toodeGrupp`) REFERENCES `toodegrupp` (`toodeGruppID`),
  ADD CONSTRAINT `tooted_ibfk_1` FOREIGN KEY (`tootja`) REFERENCES `tootja` (`tootjaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
