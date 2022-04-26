USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    TABLE_NAME like '%history%' AND
    COLUMN_NAME LIKE '%eco%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%access%' AND TABLE_TYPE = 'BASE TABLE'

--------------------------------------------------------------------------------------------------
SELECT * FROM Emergency.Tbl_MPFeederLimitDay

SELECT * FROM Emergency.Tbl_MPFeederLimitType 

SELECT * FROM Emergency.TblTiming 

SELECT * FROM Emergency.TblTimingMPFeeder 

SELECT * FROM Emergency.Tbl_GroupMPFeeder 

SELECT * FROM Emergency.Tbl_MPFeederTemplate WHERE GroupMPFeederId = 990188852


SELECT * FROM Tbl_EndJobState 
--------------------------------------------------------------------------------------------------

EXEC Emergency.spGetFeederGroupPlan @aGroupMPFeederId = 990188852

----------------------------------------------------

SELECT T.TimingId , T.GroupMPFeederId , E.EndJobState , G.GroupMPFeederName
    , T.ForecastDisconnectDatePersian, T.ForecastDisconnectTime
    ,T.ForecastConnectDatePersian , T.ForecastConnectTime , T.ForecastMW 
  FROM Emergency.TblTiming T
  INNER JOIN Tbl_EndJobState E ON T.EndJobStateId = E.EndJobStateId
  INNER JOIN Emergency.Tbl_GroupMPFeeder G ON T.GroupMPFeederId = G.GroupMPFeederId

-------------------------------------------------------


EXEC spFindFTOverlaps @aFromDT = '2022-04-25 14:00:15.965'
                     ,@aToDT = '2022-04-25 14:00:15.965'
                     ,@aMPPostId = 0
                     ,@aMPFeederId = 0
                     ,@aCurRequestId = 0
                     ,@NetworkTypeId = 0
                     ,@aLPPostId = 0
                     ,@aLPFeederId = 0
                     ,@aFeederPartId = 0

SELECT * FROM Tbl_TamirNetworkType 


-- FT : 40099748