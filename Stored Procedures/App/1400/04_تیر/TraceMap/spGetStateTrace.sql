USE CCRequesterSetad
GO
CREATE PROCEDURE Homa.spGetStateTrace
  @RequestId AS BIGINT
  ,@OnCallId AS BIGINT
  ,@StartDT AS DATETIME
  ,@EnsDT AS DATETIME
  AS 
  BEGIN
  	CREATE TABLE #tmpResult
    	(
    		Radif INT,
    		TraceDT DATETIME,
    		GpsX FLOAT,
    		GpsY FLOAT,
        Flag VARCHAR(10)
    	)
      CREATE TABLE #tmpTrace
    	(
    		Radif INT,
    		TraceDT DATETIME,
    		GpsX FLOAT,
    		GpsY FLOAT
    	)
     CREATE TABLE #tmpDT
    	(
    		TraceDT DATETIME,
        Flag VARCHAR(10)
    	)
      INSERT INTO  #tmpTrace EXEC Homa.spGetTrace @OnCallId

      /* Start Times */
      INSERT INTO #tmpDT SELECT tesm.StartMoveDT , 'Start'  FROM  Homa.TblJob tj
      INNER JOIN Homa.TblEkipStartMove tesm ON tj.JobId = tesm.JobId
      WHERE tj.RequestId = @RequestId

      /* Arrive Times */
      INSERT INTO #tmpDT SELECT tea.ArriveDT , 'Arrive'  FROM  Homa.TblJob tj
      INNER JOIN Homa.TblEkipArrive tea ON tj.JobId = tea.JobId
      WHERE tj.RequestId = @RequestId

      /* Finish Times */
      INSERT INTO #tmpDT SELECT tr.ConnectDT , 'Finish'  FROM  Homa.TblJob tj
      INNER JOIN dbo.TblRequest tr ON tr.RequestId = tj.RequestId
      WHERE tj.RequestId = @RequestId
        
      /*Get TraceStates */
        DECLARE db_cursor CURSOR FOR SELECT * FROM #tmpDT
        DECLARE @lDate DATETIME , @lFlag VARCHAR(10)
        OPEN db_cursor  
        FETCH NEXT FROM db_cursor INTO @lDate , @lFlag
        
        WHILE @@FETCH_STATUS = 0  
        BEGIN  
              INSERT INTO #tmpResult SELECT  TOP 1 * , @lFlag FROM #tmpTrace
                ORDER BY ABS(DATEDIFF(SECOND , @lDate , TraceDT))
              FETCH NEXT FROM db_cursor INTO @lDate , @lFlag
        END 
        
        CLOSE db_cursor  
        DEALLOCATE db_cursor 
      
      SELECT * FROM #tmpResult WHERE TraceDT BETWEEN @StartDT AND @EnsDT
      
      DROP TABLE #tmpResult
      DROP TABLE #tmpDT
      DROP TABLE #tmpTrace
  END
-------------------------------------


