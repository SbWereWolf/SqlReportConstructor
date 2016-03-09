/*

meteo_measurements

meteo_station_id BIGINT NOT NULL
 ,read_timestamp TIMESTAMP
 ,temperature DECIMAL(4, 1) NULL
 ,pressure INT NULL
 ,wind_direction INT NULL
 ,wind_speed
*/

SELECT TOP 1 id FROM meteo_stations_reference ORDER BY NEWID()
;

TRUNCATE TABLE meteo_measurements
GO

SELECT
  --pressure
  CAST ( wind_speed  AS NVARCHAR ) + N' ( $M_S$ )' AS speed_m_s
FROM 
  meteo_measurements mm 
WHERE 
  mm.meteo_station_id = 1 
  AND mm.read_timestamp BETWEEN '01-01-2013' AND '01-02-2013'
;

EXEC 
('
SELECT
  --pressure
  CAST ( wind_speed  AS NVARCHAR ) + N'' ( $M+S$ )'' AS speed_m_s
FROM 
  meteo_measurements mm 
WHERE 
  mm.meteo_station_id = 1 
  AND mm.read_timestamp BETWEEN ''01-01-2013'' AND ''01-02-2013''
;
')
;


BEGIN 

DECLARE @formula AS NVARCHAR(MAX);
DECLARE @C_COLUMN_FORMULA_SELECT AS NVARCHAR(MAX) = ' SELECT ';
DECLARE @C_FROM AS NVARCHAR(MAX) = 
'
 FROM 
  meteo_measurements mm 
WHERE 
  mm.meteo_station_id = 1 
  AND mm.read_timestamp BETWEEN ''01-01-2013'' AND ''01-02-2013''
; 
';
DECLARE @phrase AS NVARCHAR(MAX);

SELECT TOP 1 @formula = fm.formula FROM formulas fm ORDER BY NEWID();
PRINT N' @formula  = ' + @formula ;

SET @phrase = @C_COLUMN_FORMULA_SELECT + @formula + @C_FROM ;
PRINT ' @phrase  = ' + @phrase ;

EXECUTE (@phrase);

END;

BEGIN

  DECLARE @formula NVARCHAR(MAX);
  DECLARE @sql NVARCHAR(MAX);
  DECLARE @ColumnFormulaParams NVARCHAR(MAX); 
  DECLARE @Station BIGINT = 1 ;
  DECLARE @From DATETIMEOFFSET(7) = '01-01-2013' ;
  DECLARE @Thru DATETIMEOFFSET(7) = '01-02-2013' ;
  DECLARE @SwapVariable DATETIMEOFFSET(7) ;

  DECLARE @ConsumerId INT ;

  SET @ColumnFormulaParams = 
    N' @StatonId bigint , ' + 
    N' @FromDate datetimeoffset(7) , ' +
    N' @ThruDate datetimeoffset(7) '
  ;
  DECLARE @C_SELECT NVARCHAR(MAX) = ' SELECT ';
  DECLARE @C_FROM NVARCHAR(MAX) = 
  '
   FROM 
      meteo_measurements mm 
   WHERE 
      mm.meteo_station_id = @StationId 
      AND mm.read_timestamp BETWEEN @FromDate AND @ThruDate 
  ;
  ';
  DECLARE @phrase NVARCHAR(MAX);

  SELECT TOP 1 @ConsumerId = cr.id FROM consumer_reference cr ORDER BY NEWID();
  PRINT N' @Consumer  = ' + @ConsumerId ;

  DECLARE @ColumnId INT ;

  SELECT TOP 1 
    @ColumnId = rc.column_id 
  FROM 
    consumers_report_columns rc 
  WHERE
    rc.consumer_id = @ConsumerId
  ORDER BY NEWID();
  PRINT N' @ColumnId  = ' + @ColumnId ;

  DECLARE @FormulaId INT;

  SELECT 
    @FormulaId = cl.formula_id
  FROM 
    columns cl
  WHERE
    cl.id = @ColumnId  ;
  PRINT N' @FormulaId  = ' + @FormulaId ;
  
  SELECT 
    @formula = fm.formula 
  FROM 
    formulas fm 
  WHERE
    fm.id = @FormulaId  ;
  PRINT N' @formula  = ' + @formula ;
  
  SET @phrase = @C_COLUMN_FORMULA_SELECT + @formula + @C_FROM ;
  PRINT ' @phrase  = ' + @phrase ;

  SELECT TOP 1 @Station = sr.id FROM meteo_stations_reference sr ORDER BY NEWID();
  PRINT ' @Staton  = ' + CAST ( @Station AS NVARCHAR ) ;

  SELECT TOP 1 @From = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();
  SELECT TOP 1 @Thru = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();

  IF ( @From > @Thru )
    BEGIN
      SET @SwapVariable = @Thru;
      SET @Thru = @From ;
      SET @From = @SwapVariable ;
    END; 
  PRINT ' @From = ' + CAST ( @From  AS NVARCHAR )+ ' @Thru = ' + CAST ( @Thru  AS NVARCHAR );
  
  SET @sql = @phrase ;
                
  EXEC sp_executesql @sql, @ColumnFormulaParams, @StationId = @Station , @FromDate = @From , @ThruDate =  @Thru 

END;

SELECT COALESCE(NULL,0);

SELECT AVG(COALESCE(temperature,0)) AS temperature_max
   FROM 
      meteo_measurements mm 
   WHERE 
      mm.meteo_station_id = 2 
      AND mm.read_timestamp BETWEEN '01-01-2016' AND '01-03-2016' 
  ;

BEGIN

  DECLARE @Station BIGINT ;
  SELECT TOP 1 @Station = sr.id FROM meteo_stations_reference sr ORDER BY NEWID();
  PRINT N' @Staton  = ' + CAST ( @Station AS NVARCHAR ) ;

  DECLARE @From DATETIMEOFFSET(7) ;
  DECLARE @Thru DATETIMEOFFSET(7) ;

  SELECT TOP 1 @From = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();
  SELECT TOP 1 @Thru = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();

  DECLARE @SwapVariable DATETIMEOFFSET(7) ;
  IF ( @From > @Thru )
    BEGIN
      SET @SwapVariable = @Thru;
      SET @Thru = @From ;
      SET @From = @SwapVariable ;
    END; 
  PRINT N' @From = ' + CAST ( @From  AS NVARCHAR )+ N' @Thru = ' + CAST ( @Thru  AS NVARCHAR );

  DECLARE @Instance INT ;

  SET @Instance = NEXT VALUE FOR [dbo].[report_instances_sequence] ;

  DECLARE @ConsumerId INT ;
  SELECT TOP 1 @ConsumerId = cr.id FROM consumer_reference cr ORDER BY NEWID();
  PRINT N' @ConsumerId  = ' + CAST ( @ConsumerId AS NVARCHAR ) ;

  DECLARE @ColumnId INT ;
  SELECT TOP 1 
    @ColumnId = rc.column_id 
  FROM 
    consumers_report_columns rc 
  WHERE
    rc.consumer_id = @ConsumerId
  ORDER BY NEWID();
  PRINT N' @ColumnId  = ' + CAST ( @ColumnId AS NVARCHAR ) ;

  DECLARE @FormulaId INT;
  SELECT 
    @FormulaId = cl.formula_id
  FROM 
    columns cl
  WHERE
    cl.id = @ColumnId  ;
  PRINT N' @FormulaId  = ' + CAST ( @FormulaId AS NVARCHAR ) ;
  
  DECLARE @formula NVARCHAR(MAX);
  SELECT 
    @formula = fm.formula 
  FROM 
    formulas fm 
  WHERE
    fm.id = @FormulaId  ;
  PRINT N' @formula  = ' + @formula ;

  DECLARE @C_SELECT NVARCHAR(MAX) = 
  N'
  SELECT 
      (NEXT VALUE FOR [dbo].[report_cell_instances_sequence] OVER(ORDER BY mm.meteo_station_id , mm.read_timestamp ) ) AS RecordId ,       
      @Instance_Id AS InstanceId ,
      @Consumer_Id AS ConsumerId , 
      @Column_Id AS ColumnId ,
      ROW_NUMBER() OVER(ORDER BY mm.meteo_station_id , mm.read_timestamp ) AS Row_Order ,
  ';
  DECLARE @C_FROM NVARCHAR(MAX) = 
  N'
   FROM 
      meteo_measurements mm 
   WHERE 
      mm.meteo_station_id = @Station_Id 
      AND mm.read_timestamp BETWEEN @FromDate AND @ThruDate   
    ORDER BY 
      mm.meteo_station_id 
      , mm.read_timestamp
  ;
  ';

  DECLARE @phrase NVARCHAR(MAX);  
  SET @phrase = @C_COLUMN_FORMULA_SELECT + @formula + @C_FROM ;
  PRINT N' @phrase  = ' + @phrase ;
  
  DECLARE @sql NVARCHAR(MAX);
  SET @sql = @phrase ;

  DECLARE @params NVARCHAR(MAX); 
  SET @ColumnFormulaParams = 
    N' @Station_Id bigint , ' + 
    N' @FromDate datetimeoffset(7) , ' +
    N' @ThruDate datetimeoffset(7) , ' +
    N' @Column_Id INT , ' +
    N' @Instance_Id INT , ' +
    N' @Consumer_Id INT '
  ;
                
  EXEC sp_executesql 
      @sql
    , @ColumnFormulaParams
    , @Station_Id = @Station
    , @FromDate = @From
    , @ThruDate =  @Thru 
    , @Column_Id = @ColumnId
    , @Instance_Id = @Instance
    , @Consumer_Id = @ConsumerId

END;

SELECT
   fr.formula
  , rf.placeholder
--  , rg.pattern
FROM
  consumers_report_regions rr
  JOIN regions rg 
  ON rr.region_id = rg.id
  JOIN region_formulas rf 
  ON rg.id = rf.region_id
  JOIN formulas fr 
  ON rf.formula_id = fr.id
WHERE
   rr.consumer_id = 2
;

BEGIN

  DECLARE @C_ORDER_BY NVARCHAR(MAX) = ' ORDER BY mm.meteo_station_id , mm.read_timestamp ' ;

  DECLARE @C_COLUMN_FORMULA_INSERT NVARCHAR(MAX) = 
N'
INSERT INTO report_cell_instances 
  (id 
  ,instance_id 
  ,consumer_id 
  ,column_id 
  ,row_order 
  ,value)
';

  DECLARE @C_COLUMN_FORMULA_SELECT NVARCHAR(MAX) = 
  N'
  SELECT 
      (NEXT VALUE FOR [dbo].[report_cell_instances_sequence] OVER( ' + @C_ORDER_BY + ' ) ) AS RecordId ,       
      @Instance_Id AS InstanceId ,
      @Consumer_Id AS ConsumerId , 
      @Column_Id AS ColumnId ,
      ROW_NUMBER() OVER( ' + @C_ORDER_BY + ' ) AS Row_Order ,
  ';
  DECLARE @C_COLUMN_FORMULA_FROM NVARCHAR(MAX) = 
  N'
   FROM 
      meteo_measurements mm 
   WHERE 
      mm.meteo_station_id = @Station_Id 
      AND mm.read_timestamp BETWEEN @FromDate AND @ThruDate   
    ' + @C_ORDER_BY
  ;

  DECLARE @ColumnFormulaParams NVARCHAR(MAX); 
  SET @ColumnFormulaParams = 
    N' @Station_Id bigint , ' + 
    N' @FromDate datetimeoffset(7) , ' +
    N' @ThruDate datetimeoffset(7) , ' +
    N' @Column_Id INT , ' +
    N' @Instance_Id INT , ' +
    N' @Consumer_Id INT '
  ;

  DECLARE @Station BIGINT ;
  SELECT TOP 1 @Station = sr.id FROM meteo_stations_reference sr ORDER BY NEWID();
  PRINT N' @Staton  = ' + CAST ( @Station AS NVARCHAR ) ;

  DECLARE @From DATETIMEOFFSET(7) ;
  DECLARE @Thru DATETIMEOFFSET(7) ;

  SELECT TOP 1 @From = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();
  SELECT TOP 1 @Thru = mm.read_timestamp FROM meteo_measurements mm ORDER BY NEWID();

  DECLARE @SwapVariable DATETIMEOFFSET(7) ;
  IF ( @From > @Thru )
    BEGIN
      SET @SwapVariable = @Thru;
      SET @Thru = @From ;
      SET @From = @SwapVariable ;
    END; 
  PRINT N' @From = ' + CAST ( @From  AS NVARCHAR )+ N' @Thru = ' + CAST ( @Thru  AS NVARCHAR );

  DECLARE @Instance INT ;
  SET @Instance = NEXT VALUE FOR [dbo].[report_instances_sequence] ;

  INSERT INTO report_instances 
    ( id , name , description , state_id )
  VALUES 
    (@Instance,CAST(@Instance AS NVARCHAR ),' DEBUG ', 1 )
  ;

  DECLARE @ConsumerId INT ;
  SELECT TOP 1 @ConsumerId = cr.id FROM consumer_reference cr ORDER BY NEWID();
  SET @ConsumerId = 3 ; 
  PRINT N' @ConsumerId  = ' + CAST ( @ConsumerId AS NVARCHAR ) ;
  
--  CREATE TABLE #consumers_report_columns(
--  column_id int )
--
--  INSERT INTO #consumers_report_columns ( column_id )
--  SELECT 
--    rc.column_id 
--  FROM 
--    consumers_report_columns rc 
--  WHERE
--    rc.consumer_id = @ConsumerId
--  ;

  DECLARE @consumers_report_columns TABLE ( column_id INT )
  INSERT INTO @consumers_report_columns (column_id)
  SELECT 
    rc.column_id 
  FROM 
    consumers_report_columns rc 
  WHERE
    rc.consumer_id = @ConsumerId
  ;

  /* -=* CYCLE BEGIN *=- */

--  DECLARE consumers_report_columns_cursor CURSOR FOR 
--  SELECT 
--    rc.column_id 
--  FROM 
--    #consumers_report_columns rc
--  ;

  DECLARE consumers_report_columns_cursor CURSOR FOR 
  SELECT 
    rc.column_id 
  FROM 
    @consumers_report_columns rc
  ;
  
  DECLARE @ColumnId INT ;

  OPEN consumers_report_columns_cursor ;
  
  FETCH NEXT FROM consumers_report_columns_cursor 
  INTO 
      @ColumnId
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
  
    PRINT N' @ColumnId  = ' + CAST ( @ColumnId AS NVARCHAR ) ;
  
    DECLARE @FormulaId INT;
    SELECT 
      @FormulaId = cl.formula_id
    FROM 
      columns cl
    WHERE
      cl.id = @ColumnId  ;
    PRINT N' @FormulaId  = ' + CAST ( @FormulaId AS NVARCHAR ) ;
    
    DECLARE @formula NVARCHAR(MAX);
    SELECT 
      @formula = fm.formula 
    FROM 
      formulas fm 
    WHERE
      fm.id = @FormulaId  ;
    PRINT N' @formula  = ' + @formula ;
  
    DECLARE @column_formula_phrase NVARCHAR(MAX);  
    SET @column_formula_phrase = @C_COLUMN_FORMULA_SELECT + @formula + @C_COLUMN_FORMULA_FROM ;
    PRINT N' @column_formula_phrase  = ' + @column_formula_phrase ;
    
    DECLARE @column_formula_sql NVARCHAR(MAX);
    SET @column_formula_sql = @column_formula_phrase ;
                 
    EXEC sp_executesql 
        @column_formula_sql
      , @ColumnFormulaParams
      , @Station_Id = @Station
      , @FromDate = @From
      , @ThruDate =  @Thru 
      , @Column_Id = @ColumnId
      , @Instance_Id = @Instance
      , @Consumer_Id = @ConsumerId

      
    SET @column_formula_phrase = @C_COLUMN_FORMULA_INSERT + @C_COLUMN_FORMULA_SELECT + @formula + @C_COLUMN_FORMULA_FROM ;
    PRINT N' @column_formula_phrase  = ' + @column_formula_phrase ;
    SET @column_formula_sql = @column_formula_phrase ;
                 
    EXEC sp_executesql 
        @column_formula_sql
      , @ColumnFormulaParams
      , @Station_Id = @Station
      , @FromDate = @From
      , @ThruDate =  @Thru 
      , @Column_Id = @ColumnId
      , @Instance_Id = @Instance
      , @Consumer_Id = @ConsumerId
  
    FETCH NEXT FROM consumers_report_columns_cursor 
    INTO 
        @ColumnId
  END 
  CLOSE consumers_report_columns_cursor;
  DEALLOCATE consumers_report_columns_cursor;  

  /* -=* CYCLE END *=- */

--  DROP TABLE #consumers_report_columns
  DELETE @consumers_report_columns ;

  DECLARE @consumers_report_regions TABLE ( region_id INT )
  INSERT INTO @consumers_report_regions (region_id)
  SELECT 
    rr.region_id 
  FROM 
    consumers_report_regions rr 
  WHERE
    rr.consumer_id = @ConsumerId
  ;

  DECLARE consumers_report_regions_cursor CURSOR FOR 
  SELECT 
    rr.region_id 
  FROM 
    @consumers_report_regions rr
  ;

  DECLARE @C_REGION_FORMULA_SELECT NVARCHAR(MAX) = N' SELECT @Result = ' ;
  DECLARE @C_REGION_FORMULA_FROM NVARCHAR(MAX) = 
N'
FROM 
  meteo_measurements mm 
WHERE 
  mm.meteo_station_id = @Station_Id 
  AND mm.read_timestamp BETWEEN @FromDate AND @ThruDate   
';
  DECLARE @C_REGION_FORMULA_PARAMS NVARCHAR(MAX) = 
    N' @Station_Id bigint , ' + 
    N' @FromDate datetimeoffset(7) , ' +
    N' @ThruDate datetimeoffset(7) , ' +
    N' @Result NVARCHAR(MAX) OUT '
  ;   

  DECLARE @RegionId INT ;

  OPEN consumers_report_regions_cursor ;
  
  FETCH NEXT FROM consumers_report_regions_cursor 
  INTO 
      @RegionId
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
  
    PRINT N' @RegionId  = ' + CAST ( @RegionId AS NVARCHAR ) ;

    DECLARE @Pattern NVARCHAR(MAX) ;
    SELECT
      @Pattern = rg.pattern
    FROM
      regions rg
    WHERE
      rg.id = @RegionId
    ;
    PRINT N' @Pattern  = ' + @Pattern ;

    DECLARE @region_formulas_and_placeholders TABLE ( formula NVARCHAR(MAX) , placeholder NVARCHAR(MAX) )
    INSERT INTO @region_formulas_and_placeholders ( formula , placeholder )
    SELECT
       fr.formula
      , rf.placeholder
    --  , rg.pattern
    FROM
      regions rg
      JOIN region_formulas rf 
      ON rg.id = rf.region_id
      JOIN formulas fr 
      ON rf.formula_id = fr.id
    WHERE
      rg.id = @RegionId
    ;

    DECLARE region_formulas_and_placeholders_cursor CURSOR FOR 
    SELECT 
        fp.formula
      , fp.placeholder 
    FROM 
      @region_formulas_and_placeholders fp
    ;

    DECLARE @region_formula NVARCHAR(MAX);
    DECLARE @placeholder NVARCHAR(MAX);

    OPEN region_formulas_and_placeholders_cursor ;
    
    FETCH NEXT FROM region_formulas_and_placeholders_cursor 
    INTO 
        @region_formula
      , @placeholder
    
    WHILE @@FETCH_STATUS = 0
    BEGIN

      PRINT N' @region_formula  = ' + @region_formula + N' @placeholder = ' + @placeholder;
    
      DECLARE @region_formula_phrase NVARCHAR(MAX) ;  
      SET @region_formula_phrase = @C_REGION_FORMULA_SELECT + @region_formula + @C_REGION_FORMULA_FROM ;
      PRINT N' @region_formula_phrase  = ' + @region_formula_phrase ;
      
      DECLARE @region_formula_sql NVARCHAR(MAX) ; 
      SET @region_formula_sql = @region_formula_phrase ;

      DECLARE @Substitute NVARCHAR(MAX) ; 
                   
      EXEC sp_executesql 
          @region_formula_sql
        , @C_REGION_FORMULA_PARAMS
        , @Station_Id = @Station
        , @FromDate = @From
        , @ThruDate =  @Thru
        , @Result = @Substitute OUT
      ;

      PRINT N' @Substitute = ' + @Substitute ;

      PRINT N' BEFOR REPLACE ' + @Pattern ;
      SET @Pattern = REPLACE ( @Pattern , @placeholder , @Substitute ) ; 
      PRINT N' AFTER REPLACE ' + @Pattern ;

      FETCH NEXT FROM region_formulas_and_placeholders_cursor 
      INTO 
          @region_formula
        , @placeholder
    END 
    CLOSE region_formulas_and_placeholders_cursor;
    DEALLOCATE region_formulas_and_placeholders_cursor;

    DELETE @region_formulas_and_placeholders ;

    PRINT N' FINISH @Pattern ' + @Pattern ;

    INSERT INTO report_region_instances
    ( instace_id ,consumer_id ,region_id ,value )
    VALUES( @Instance , @ConsumerId , @RegionId , @Pattern )    
    ;
  
    FETCH NEXT FROM consumers_report_regions_cursor 
    INTO 
        @RegionId
  END

  CLOSE consumers_report_regions_cursor;
  DEALLOCATE consumers_report_regions_cursor;

  DELETE @consumers_report_regions ; 

END;