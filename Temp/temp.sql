USE CCRequesterSetad
GO


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'ViewTamirRequest'
  AND COLUMN_NAME LIKE '%return%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%color%' AND TABLE_TYPE = 'BASE TABLE'
---------------------------------------

SELECT * FROM TblRequest WHERE RequestNumber = 4009921088

SELECT * FROM TblRequestInform WHERE RequestId = 9900000000001539 -- Delete

SELECT * FROM Tbl_RequestInformJobState

SELECT * FROM TblSubscriberInfom WHERE RequestInformId = 98900000098393 -- If Exists -- Delete

--UPDATE TblSubscriberInfom SET SendSMSStatusId = 1 WHERE SubscriberInformId = 990186805

SELECT * FROM Tbl_SendSMSStatus 

------------------------------------------------------------------------------------------

SELECT * FROM Tbl_FormObject WHERE FormObjectId BETWEEN 200 AND 300

SELECT * FROM Tbl_FormObjectApplication WHERE ApplicationId = 1 ORDER BY FormObjectApplicationId

SELECT * FROM Tbl_SysObj 

SELECT * FROM Tbl_Application 