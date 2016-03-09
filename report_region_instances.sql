USE Linegro
GO

CREATE TABLE dbo.report_region_instances (
  instace_id INT NOT NULL
 ,consumer_id INT NOT NULL
 ,region_id INT NOT NULL
 ,value NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_report_region_instances PRIMARY KEY CLUSTERED (instace_id, consumer_id, region_id)
 ,CONSTRAINT FK_report_region_instances_consumers_report_regions FOREIGN KEY (consumer_id, region_id) REFERENCES dbo.consumers_report_regions (consumer_id, region_id)
 ,CONSTRAINT FK_report_region_instances_report_instances_instace_id FOREIGN KEY (instace_id) REFERENCES dbo.report_instances (id)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO