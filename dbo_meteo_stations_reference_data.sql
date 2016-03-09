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

INSERT Linegro.dbo.meteo_stations_reference(id, name, description) VALUES (1, N'ТАГАНАЙ', N'Метеостанция "Таганай"')
INSERT Linegro.dbo.meteo_stations_reference(id, name, description) VALUES (2, N'свердловск', N'Метеостанция на Метео горке')
INSERT Linegro.dbo.meteo_stations_reference(id, name, description) VALUES (3, N'Центральная', N'Москва Центральная')
INSERT Linegro.dbo.meteo_stations_reference(id, name, description) VALUES (4, N'Владик', N'Морской порт Владивосток')
INSERT Linegro.dbo.meteo_stations_reference(id, name, description) VALUES (5, N'Якутия', N'Метеостанция республики Саха - Якутия')
GO