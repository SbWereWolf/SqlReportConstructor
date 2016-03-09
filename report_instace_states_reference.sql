USE Linegro
GO

CREATE TABLE dbo.report_instace_states_reference (
  id INT NOT NULL
 ,code NCHAR(50) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_report_instace_states_reference PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_report_instace_states_reference_code UNIQUE (code)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'идентификатор'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'report_instace_states_reference'
                               ,'COLUMN'
                               ,N'id'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'код'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'report_instace_states_reference'
                               ,'COLUMN'
                               ,N'code'
GO

EXEC sys.sp_addextendedproperty N'MS_Description'
                               ,'описание'
                               ,'SCHEMA'
                               ,N'dbo'
                               ,'TABLE'
                               ,N'report_instace_states_reference'
                               ,'COLUMN'
                               ,N'description'
GO