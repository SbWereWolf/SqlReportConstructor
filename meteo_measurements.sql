USE Linegro
GO

CREATE TABLE dbo.meteo_measurements (
  meteo_station_id BIGINT NOT NULL
 ,read_timestamp DATETIMEOFFSET NOT NULL
 ,temperature DECIMAL(4, 1) NULL
 ,pressure INT NULL
 ,wind_direction INT NULL
 ,wind_speed INT NULL
 ,CONSTRAINT PK_meteo_measurements PRIMARY KEY CLUSTERED (meteo_station_id, read_timestamp)
 ,CONSTRAINT FK_meteo_measurements_meteo_stations_reference_id FOREIGN KEY (meteo_station_id) REFERENCES dbo.meteo_stations_reference (id)
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'Метео данные'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'идентификатор метеостанции'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'meteo_station_id'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'дата съёма метеоданных'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'read_timestamp'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'температура'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'temperature'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'атмосферное давление'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'pressure'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'направление ветра'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'wind_direction'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'скорость ветра'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_measurements'
                               ,'COLUMN'
                               ,N'wind_speed'
GO