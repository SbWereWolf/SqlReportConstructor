USE Linegro
GO

CREATE TABLE dbo.consumers_report_columns (
  column_id INT NOT NULL
 ,consumer_id INT NOT NULL
 ,column_order INT NOT NULL
 ,CONSTRAINT PK_consumers_report_columns PRIMARY KEY CLUSTERED (consumer_id, column_id)
 ,CONSTRAINT UK_consumers_report_columns_column_order UNIQUE (consumer_id, column_order)
 ,CONSTRAINT FK_consumers_report_columns_columns_id FOREIGN KEY (column_id) REFERENCES dbo.columns (id)
 ,CONSTRAINT FK_consumers_report_columns_consumer_reference_id FOREIGN KEY (consumer_id) REFERENCES dbo.consumer_reference (id)
) ON [PRIMARY]
GO