USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    TABLE_NAME = 'TblMPRequest' AND
    COLUMN_NAME LIKE 'Is%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%access%' AND TABLE_TYPE = 'BASE TABLE'

--------------------------------------------------------------------------------------------------

SELECT ForecastDisconnectDT , ForecastConnectDT,* FROM Emergency.TblTiming 

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

