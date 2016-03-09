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

INSERT Linegro.dbo.report_region_types(id, position, code) VALUES (1, 1, N'Титульный лист')
INSERT Linegro.dbo.report_region_types(id, position, code) VALUES (2, 10, N'шапка')
INSERT Linegro.dbo.report_region_types(id, position, code) VALUES (3, -100, N'подпись')
INSERT Linegro.dbo.report_region_types(id, position, code) VALUES (4, -10, N'подвал')
INSERT Linegro.dbo.report_region_types(id, position, code) VALUES (5, -1, N'итог')
GO