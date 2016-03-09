USE Linegro
GO

CREATE TABLE dbo.meteo_stations_reference (
  id BIGINT NOT NULL
 ,name NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_meteo_stations_reference PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_meteo_stations_reference_name UNIQUE (name)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'справочник метео станций'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_stations_reference'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'идентификатор метеостанции'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_stations_reference'
                               ,'COLUMN'
                               ,N'id'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'название'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_stations_reference'
                               ,'COLUMN'
                               ,N'name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'описание'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'meteo_stations_reference'
                               ,'COLUMN'
                               ,N'description'
GO