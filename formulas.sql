USE Linegro
GO

CREATE TABLE dbo.formulas (
  id INT NOT NULL
 ,code NCHAR(50) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,formula NVARCHAR(MAX) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,CONSTRAINT PK_formulas PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_formulas_code UNIQUE (code)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO