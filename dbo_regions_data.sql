--
-- Скрипт сгенерирован Devart dbForge Studio for SQL Server, Версия 5.1.178.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/sql/studio
-- Дата скрипта: 2016-03-10 03:20:54
-- Версия сервера: 11.00.6020
-- Версия клиента: 
--

SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT Linegro.dbo.regions(id, pattern, name, description) VALUES (1, N'max temp = $MAX_TEMP$ , min temp = $MIN_TEMP$ , average temp = $AVG_TEMP$', N'temp_statistics', N'статистика по температуре')
INSERT Linegro.dbo.regions(id, pattern, name, description) VALUES (2, N'группа номер 426 ( 2016 ) Горного университета города Екатеринубурга ', N'426_2016_title', N'шапка')
INSERT Linegro.dbo.regions(id, pattern, name, description) VALUES (3, N' ', N'empty', N'пустое поле')
INSERT Linegro.dbo.regions(id, pattern, name, description) VALUES (4, N'Министерство обороны Российской Федерации', N'МО РФ', NULL)
INSERT Linegro.dbo.regions(id, pattern, name, description) VALUES (5, N'ИП Наибенько', N'ИП Наибенько', NULL)
GO