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

INSERT Linegro.dbo.region_formulas(id, formula_id, region_id, placeholder) VALUES (1, 5, 1, N'$MAX_TEMP$')
INSERT Linegro.dbo.region_formulas(id, formula_id, region_id, placeholder) VALUES (2, 6, 1, N'$MIN_TEMP$')
INSERT Linegro.dbo.region_formulas(id, formula_id, region_id, placeholder) VALUES (3, 7, 1, N'$AVG_TEMP$')
GO