USE Linegro
GO

CREATE TABLE dbo.region_formulas (
  id INT NOT NULL
 ,formula_id INT NOT NULL
 ,region_id INT NOT NULL
 ,placeholder NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,CONSTRAINT PK_region_formulas PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_region_formulas UNIQUE (region_id, formula_id)
 ,CONSTRAINT FK_region_formulas_formulas_formula_id FOREIGN KEY (formula_id) REFERENCES dbo.formulas (id)
 ,CONSTRAINT FK_region_formulas_regions_id FOREIGN KEY (region_id) REFERENCES dbo.regions (id)
) ON [PRIMARY]
GO