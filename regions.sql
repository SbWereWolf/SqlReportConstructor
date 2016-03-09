USE Linegro
GO

CREATE TABLE dbo.regions (
  id INT NOT NULL
 ,pattern NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,name NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_regions PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_regions_name UNIQUE (name)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'Клиентские настройки отчёта'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'regions'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'Шаблон раздела'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'regions'
                               ,'COLUMN'
                               ,N'pattern'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'Имя'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'regions'
                               ,'COLUMN'
                               ,N'name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'Описание'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'regions'
                               ,'COLUMN'
                               ,N'description'
GO