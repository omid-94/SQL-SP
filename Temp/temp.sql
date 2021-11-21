USE CCRequesterSetad
GO


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'Tbl_Media'
  AND COLUMN_NAME LIKE '%Serv%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%Disconnect%' AND TABLE_TYPE = 'BASE TABLE'
---------------------------------------

EXEC Homa.spTraceMaster '1400/08/29' ,'1400/08/29' ,'00:00' ,'23:59' ,0,0

SELECT * FROM Homa.TblOnCall WHERE OnCallStartDatePersian BETWEEN '1400/08/01' AND '1400/08/30'

SELECT * FROM Homa.TblTraceSummary WHERE TargetDatePersian BETWEEN '1400/08/01' AND '1400/08/30'


SELECT CityId FROM Tbl_Area WHERE AreaId = 3


SELECT TamirNetworkTypeId,* FROM TblTamirRequest WHERE TamirRequestId = 9900000000000065

SELECT * FROM Tbl_TamirNetworkType 