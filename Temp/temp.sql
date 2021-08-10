
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%type%'


EXEC dbo.spReportHomaAreaSummary @aStartDate = '1400/01/01' ,@aEndDate = '1400/09/01'

SELECT * FROM Homa.TblTraceSummary

SELECT * FROM Homa.[TblRequestMP]

SELECT * FROM Homa.[TblRequestLP]

SELECT * FROM Homa.TblRequestCommon

SELECT * FROM Homa.Tbl_JobStatus 

SELECT * FROM Homa.[TblRequestSubscriber]

  -----------------------------------------------
--CREATE TABLE #HomaMPTamir (AreaId INT, cnt INT)
CREATE TABLE #HomaMPTamir (DisconnectDatePersian VARCHAR(10), cnt INT)
DECLARE 
  @aStartDate VARCHAR(10) = '1390/01/01'
  ,@aEndDate VARCHAR(10) = '1400/06/01'
  ,@lSQLMain VARCHAR(2000),@lSQL VARCHAR(2000)
  ,@lIsTamir VARCHAR(50) = 'TblJob.IsTamir=0 and'
  ,@lTempTable VARCHAR(50) = '#HomaMPNotTamir'
  ,@lTableName VARCHAR(50) = 'TblRequestMP' --  	INTO '+ @lTempTable +'
SET @lSQLMain ='SELECT TblJob.DisconnectDatePersian ,TblJob.AreaId '+--,COUNT(*) AS cnt 
  	  'FROM CCRequesterSetad.Homa.['+ @lTableName +']
  	  inner join CCRequesterSetad.Homa.TblRequestCommon
  	  on ['+ @lTableName +'].RequestCommonId=TblRequestCommon.RequestCommonId
  	  inner join CCRequesterSetad.Homa.TblJob on TblJob.JobId=TblRequestCommon.JobId
  	  where '+ @lIsTamir +' IsDuplicate=0 and JobStatusId in (10,11)
     AND TblJob.DisconnectDatePersian BETWEEN '''+ @aStartDate +''' AND '''+ @aEndDate +'''
  group by TblJob.AreaId'
--    	  and TblJob.DisconnectDatePersian in (select DisconnectDatePersian from #tmp3)
--EXEC(@lSQLMain)
SET @lSQL = REPLACE(@lSQLMain, @lTempTable , '#HomaMPTamir')
SET @lSQL = REPLACE(@lSQL, @lIsTamir , 'TblJob.IsTamir=1 and')
INSERT INTO #HomaMPTamir EXEC(@lSQL)
SELECT @lSQL
SELECT * FROM #HomaMPTamir
DROP TABLE #HomaMPTamir