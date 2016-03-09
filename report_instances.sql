USE Linegro
GO

CREATE TABLE dbo.report_instances (
  id INT NOT NULL DEFAULT (NEXT VALUE FOR [dbo].[report_instances_sequence])
 ,name NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,state_id INT NOT NULL
 ,CONSTRAINT PK_report_instances PRIMARY KEY NONCLUSTERED (id)
 ,CONSTRAINT UK_report_instances_name UNIQUE (name)
 ,CONSTRAINT FK_report_instances_report_instace_states_reference_id FOREIGN KEY (state_id) REFERENCES dbo.report_instace_states_reference (id)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO