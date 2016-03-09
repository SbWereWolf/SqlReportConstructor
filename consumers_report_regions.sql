USE Linegro
GO

CREATE TABLE dbo.consumers_report_regions (
  consumer_id INT NOT NULL
 ,region_id INT NOT NULL
 ,region_order INT NOT NULL
 ,type_id INT NULL
 ,CONSTRAINT PK_consumers_report_base PRIMARY KEY CLUSTERED (consumer_id, region_id)
 ,CONSTRAINT UK_consumers_report_regions_region_order UNIQUE (consumer_id, region_order)
 ,CONSTRAINT FK_consumers_report_regions_consumer_reference_id FOREIGN KEY (consumer_id) REFERENCES dbo.consumer_reference (id)
 ,CONSTRAINT FK_consumers_report_regions_regions_id FOREIGN KEY (region_id) REFERENCES dbo.regions (id)
 ,CONSTRAINT FK_consumers_report_regions_report_region_types_id FOREIGN KEY (type_id) REFERENCES dbo.report_region_types (id)
) ON [PRIMARY]
GO