USE CcRequester
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%end%'

SELECT TOP 10 * FROM TblRequest

SELECT * FROM Tbl_EndJobState ORDER BY EndJobStateId
-------------------------------------------------------
USE CCRequesterSetad

SELECT TOP 10 * FROM Tbl_EventLogCenter

SELECT TOP 100 * FROM Tbl_SendMessageSchedule

SELECT * FROM Tbl_ScheduleStatus

SELECT * FROM Tbl_ScheduleType

EXEC spGetRecordFromMessageSchedule

SELECT * FROM Tbl_Config WHERE ConfigId BETWEEN 80 AND 90

--INSERT INTO Tbl_Config (ConfigId , ConfigName , ConfigValue , ConfigText)
--    VALUES  (88 , 'NearDisconnectNotiTimeout' , '15' ,NULL)


DECLARE @date AS DATETIME = DATEADD(MINUTE, 30 , GETDATE())
DECLARE @now AS DATETIME = GETDATE()

SELECT @date , @now , DATEDIFF(MINUTE , @now, @date)


SELECT TOP 10 * FROM TblRequestCancelSMS
  
SELECT * FROM Tbl_SendCancelNotifStatus

EXEC spSetRequestForCancelNotification
