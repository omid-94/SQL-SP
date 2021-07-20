SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TblLPRequest'
  AND COLUMN_NAME LIKE '%feeder%'
ORDER BY COLUMN_NAME
--ORDER BY ORDINAL_POSITION

SELECT TOP 10 * FROM TblMPRequest tm

SELECT TOP 10 * FROM Tbl_MPFeeder tm


---------------------------------------------------------------------------------------------------
DECLARE @From AS VARCHAR(10) = '1399/04/30' 
DECLARE @To AS VARCHAR(10) = '1400/04/30'

--SELECT  SUM(R.DisconnectPower) AS SumDisconnectPower, SUM(R.DisconnectInterval) AS SumDisconnectInterval,
--  COUNT(R.RequestId) AS Count, IsTamir FROM TblMPRequest MP
--  INNER JOIN TblRequest R ON MP.MPRequestId = R.MPRequestId
--  WHERE R.DisconnectDatePersian BETWEEN @From AND @To
--  GROUP BY IsTamir
--
SELECT  SUM(R.DisconnectPower) AS SumDisconnectPower, SUM(R.DisconnectInterval) AS SumDisconnectInterval,
  COUNT(R.RequestId) AS Count , IsTamir 
  FROM TblLPRequest LP
  INNER JOIN TblRequest R ON LP.LPRequestId = R.LPRequestId
  WHERE R.DisconnectDatePersian BETWEEN @From AND @To
  GROUP BY IsTamir

--SELECT COUNT(DISTINCT F.MPFeederId) AS CntFeeder , F.IsPrivate
--  FROM TblMPRequest MP
--  INNER JOIN TblRequest R ON MP.MPRequestId = R.MPRequestId
--  INNER JOIN Tbl_MPFeeder F ON F.MPFeederId = F.MPFeederId
--  WHERE R.DisconnectDatePersian BETWEEN @From AND @To
--  GROUP BY IsPrivate

SELECT SUM(R.DisconnectInterval) / COUNT(R.RequestId) AS AverageDisInterval
  FROM TblMPRequest MP
  INNER JOIN TblRequest R ON MP.MPRequestId = R.MPRequestId
  WHERE R.IsTamir = 0 AND  R.DisconnectDatePersian BETWEEN @From AND @To
-----------------------------------------------------------------------------------


DECLARE @From AS VARCHAR(10) = '1399/04/30' 
DECLARE @To AS VARCHAR(10) = '1400/04/30'
  SELECT RequestId INTO #tmp FROM TblRequest WHERE DisconnectDatePersian BETWEEN @From AND @To

    SELECT ta.AreaId ,ta.Area , TMP.DisPowerMP_Tamir , TMP.DisIntervalMP_Tamir , TMP.DisPowerMP , TMP.DisIntervalMP ,
      TMP.CountMP_Tamir , TMP.CountMP,
       TLP.DisPowerLP_Tamir , TLP.DisIntervalLP_Tamir , TLP.DisPowerLP , TLP.DisIntervalLP ,
      TLP.CountLP_Tamir , TLP.CountLP , TAVG.AverageDisInterval
      FROM
      Tbl_Area ta LEFT JOIN(
      SELECT R.AreaId, SUM( CASE WHEN R.IsTamir = 1 THEN R.DisconnectPower END ) AS DisPowerMP_Tamir
        , SUM( CASE WHEN R.IsTamir = 1 THEN R.DisconnectInterval END ) AS DisIntervalMP_Tamir,
        COUNT( CASE WHEN R.IsTamir = 1 THEN R.RequestId END ) AS CountMP_Tamir
        , SUM( CASE WHEN R.IsTamir = 0 THEN R.DisconnectPower END ) AS DisPowerMP
        , SUM( CASE WHEN R.IsTamir = 0 THEN R.DisconnectInterval END ) AS DisIntervalMP,
        COUNT( CASE WHEN R.IsTamir = 0 THEN R.RequestId END ) AS CountMP
      FROM TblMPRequest MP
        INNER JOIN TblRequest R ON MP.MPRequestId = R.MPRequestId
        INNER JOIN #tmp ON R.RequestId = #tmp.RequestId
        GROUP BY  R.AreaId ) TMP ON ta.AreaId = TMP.AreaId
    LEFT JOIN(
      SELECT R.AreaId, SUM( CASE WHEN R.IsTamir = 1 THEN R.DisconnectPower END ) AS DisPowerLP_Tamir
        , SUM( CASE WHEN R.IsTamir = 1 THEN R.DisconnectInterval END ) AS DisIntervalLP_Tamir,
        COUNT( CASE WHEN R.IsTamir = 1 THEN R.RequestId END ) AS CountLP_Tamir
        , SUM( CASE WHEN R.IsTamir = 0 THEN R.DisconnectPower END ) AS DisPowerLP
        , SUM( CASE WHEN R.IsTamir = 0 THEN R.DisconnectInterval END ) AS DisIntervalLP,
        COUNT( CASE WHEN R.IsTamir = 0 THEN R.RequestId END ) AS CountLP
      FROM TblLPRequest LP
        INNER JOIN TblRequest R ON LP.LPRequestId = R.LPRequestId
        INNER JOIN #tmp ON R.RequestId = #tmp.RequestId
        GROUP BY R.AreaId
        ) TLP ON ta.AreaId = TLP.AreaId
    LEFT JOIN(
        SELECT R.AreaId, SUM(R.DisconnectInterval) / COUNT(R.RequestId) AS AverageDisInterval
      FROM TblMPRequest MP
        INNER JOIN TblRequest R ON MP.MPRequestId = R.MPRequestId
        INNER JOIN #tmp ON R.RequestId = #tmp.RequestId
        WHERE R.IsTamir = 0
        GROUP BY R.AreaId
        ) TAVG ON ta.AreaId = TAVG.AreaId
      WHERE ta.IsCenter = 0
      DROP TABLE #tmp