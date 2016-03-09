USE Linegro
GO

CREATE TABLE dbo.columns (
  id INT NOT NULL
 ,formula_id INT NOT NULL
 ,name NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,description NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NULL
 ,CONSTRAINT PK_columns PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT FK_columns_formulas_id FOREIGN KEY (formula_id) REFERENCES dbo.formulas (id)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO