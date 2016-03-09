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

INSERT Linegro.dbo.report_instace_states_reference(id, code, description) VALUES (1, N'формируется', N'формируется')
INSERT Linegro.dbo.report_instace_states_reference(id, code, description) VALUES (2, N'готов', N'готов')
INSERT Linegro.dbo.report_instace_states_reference(id, code, description) VALUES (3, N'сохранён', N'сохранён')
INSERT Linegro.dbo.report_instace_states_reference(id, code, description) VALUES (4, N'удалён', N'удалён')
GO