USE Linegro
GO

CREATE TABLE dbo.consumer_reference (
  id INT NOT NULL
 ,name NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_consumer_reference PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_consumer_reference_name UNIQUE (name)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'идентификатор клиента'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'consumer_reference'
                               ,'COLUMN'
                               ,N'id'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'название'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'consumer_reference'
                               ,'COLUMN'
                               ,N'name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'описание'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'consumer_reference'
                               ,'COLUMN'
                               ,N'description'
GO