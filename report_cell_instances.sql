USE Linegro
GO

CREATE TABLE dbo.report_cell_instances (
  id INT NOT NULL DEFAULT (NEXT VALUE FOR [dbo].[report_cell_instances_sequence])
 ,instance_id INT NOT NULL
 ,consumer_id INT NOT NULL
 ,column_id INT NOT NULL
 ,row_order INT NOT NULL
 ,value NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_report_cell_instances PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_report_cell_instances_column_id_row_order UNIQUE (instance_id, consumer_id, column_id, row_order)
 ,CONSTRAINT FK_report_cell_instances FOREIGN KEY (consumer_id, column_id) REFERENCES dbo.consumers_report_columns (consumer_id, column_id)
 ,CONSTRAINT FK_report_cell_instances_report_instances_id FOREIGN KEY (instance_id) REFERENCES dbo.report_instances (id)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO