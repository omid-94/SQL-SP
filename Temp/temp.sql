USE CCRequesterSetad
GO


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%Id'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%part%' AND TABLE_TYPE = 'BASE TABLE'


  SELECT DISTINCT
   o.name AS Object_Name,
   o.type_desc
FROM sys.sql_modules m
   INNER JOIN
   sys.objects o
            ON m.object_id = o.object_id
WHERE m.definition Like '%title%'

EXEC spPrepareNotiMessage
EXEC spRayaGetTamirOutageByNetwork
EXEC spRayaGetOutageByNetwork
EXEC TolidToBar
-----------------------------------------------------------------------------------

SELECT * FROM Tbl_ToziIP


EXEC spTavanir_ReportSerghati '1395/01/01','1400/09/28'

SELECT * FROM Tbl_SerghatList

SELECT * FROM Tbl_LPPart

SELECT * FROM Tbl_GroupPart

SELECT * FROM TblLPRequestPart

SELECT * FROM TblLPRequest

--------------------------------------------------------------------------------


SELECT * FROM Tbl_Config WHERE ConfigName = 'TZServicesFileServerAddress'

UPDATE Tbl_Config SET ConfigValue = 'http://172.16.100.6/TZServices' WHERE ConfigName = 'TZServicesFileServerAddress'

SELECT * FROM TblSubscriberSMSSend

--  http://172.16.100.6/TZServices/RestServices/GetPostedFiles.aspx