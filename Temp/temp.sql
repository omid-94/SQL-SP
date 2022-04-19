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

SELECT * FROM Emergency.TblTiming 

SELECT * FROM Emergency.TblTimingMPFeeder 

SELECT * FROM Emergency.Tbl_GroupMPFeeder 

SELECT * FROM Emergency.Tbl_MPFeederTemplate 


SELECT * FROM Tbl_EndJobState 
--------------------------------------------------------------------------------------------------

SELECT ConnectDT,ConnectTime,ConnectDatePersian,AreaId,EndjobstateId,AreaUserId,* FROM TblRequest WHERE RequestNumber = 4009921156

-- 9900000000001586
SELECT ConnectDatePersian,AreaId,EndjobstateId,AreaUserId,* FROM TblMPRequest WHERE MPRequestId = 9900000000001586

UPDATE TblMPRequest SET ConnectDT = NULL , ConnectDatePersian = '' , ConnectTime = '' , EndJobStateId = 5 WHERE
  MPRequestId = 9900000000001586

1400/11/06

UPDATE TblRequest SET EndJobStateId = 5 WHERE RequestId = 9900000000001586

