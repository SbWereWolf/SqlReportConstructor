--
-- Скрипт сгенерирован Devart dbForge Studio for SQL Server, Версия 5.1.178.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/sql/studio
-- Дата скрипта: 2016-03-10 03:20:52
-- Версия сервера: 11.00.6020
-- Версия клиента: 
--

SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT Linegro.dbo.formulas(id, code, formula) VALUES (1, N'temperature', N'COALESCE(temperature ,0) AS temperature')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (2, N'pressure', N'COALESCE(pressure,0) AS pressure')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (3, N'wind_direction', N'COALESCE(wind_direction,0) AS wind_direction')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (4, N'wind_speed', N'wind_speed AS wind_speed')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (5, N'temperature_max', N'MAX(COALESCE(temperature,0)) ')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (6, N'temperature_min', N'MIN(COALESCE(temperature,0)) ')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (7, N'temperature_avg', N'AVG(COALESCE(temperature,0)) ')
INSERT Linegro.dbo.formulas(id, code, formula) VALUES (8, N'speed_m_s', N'CAST ( COALESCE(wind_speed  ,0) AS NVARCHAR ) + N'' ( $M_S$ )'' AS speed_m_s')
GO