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

INSERT Linegro.dbo.columns(id, formula_id, name, description) VALUES (1, 1, N'температура', N'температура воздуха ( градусов Цельсия )  ')
INSERT Linegro.dbo.columns(id, formula_id, name, description) VALUES (2, 2, N'давление', N'атмосферное давление ( мм рт ст )')
INSERT Linegro.dbo.columns(id, formula_id, name, description) VALUES (3, 3, N'ветер', N'направление ветра')
INSERT Linegro.dbo.columns(id, formula_id, name, description) VALUES (4, 4, N'скорость', N'скорость ветра ( м/с )')
INSERT Linegro.dbo.columns(id, formula_id, name, description) VALUES (5, 8, N'скорость', N'скорость ветра')
GO