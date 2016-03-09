USE Linegro
GO

CREATE TABLE dbo.report_region_types (
  id INT NOT NULL
 ,position INT NOT NULL
 ,code NCHAR(50) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,CONSTRAINT PK_report_region_types PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_report_region_types_code UNIQUE (code)
) ON [PRIMARY]
GO