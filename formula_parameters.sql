USE Linegro
GO

CREATE TABLE dbo.formula_parameters (
  id INT NOT NULL
 ,code NCHAR(50) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,formula_id INT NOT NULL
 ,placeholder NVARCHAR(4000) COLLATE Cyrillic_General_CI_AS NOT NULL
 ,CONSTRAINT PK_formula_parameters PRIMARY KEY CLUSTERED (id)
 ,CONSTRAINT UK_formula_parameters_code UNIQUE (formula_id, code)
 ,CONSTRAINT UK_formula_parameters_placeholder UNIQUE (formula_id, placeholder)
 ,CONSTRAINT FK_formula_parameters_formulas_id FOREIGN KEY (formula_id) REFERENCES dbo.formulas (id)
) ON [PRIMARY]
GO