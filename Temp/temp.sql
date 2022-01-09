USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblDejenctor'
  AND COLUMN_NAME LIKE '%spc%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%earth%' AND TABLE_TYPE = 'BASE TABLE'


SELECT DISTINCT
   o.name AS Object_Name,
   o.type_desc
FROM sys.sql_modules m
   INNER JOIN
   sys.objects o
            ON m.object_id = o.object_id
WHERE m.definition Like '%title%'

  
EXEC sp_fkeys 'Tbl_RelehType'

EXEC sp_spaceused 'TblRequest'

EXEC sp_spaceused 'TblServiceLog'

--------------------------------------------------------------------------------------------------

SELECT * FROM TblServiceLog

SELECT * FROM Tbl_ServiceLogType

SELECT * FROM Tbl_ServiceLogApplication

-------
SELECT * FROM Tbl_ServiceLogKeyType

SELECT * FROM Tbl_ServiceLogLevel

SELECT * FROM ViewServiceLog

-------
SELECT T.*,L.* FROM TblServiceLog L
  INNER JOIN Tbl_ServiceLogType T ON L.LogTypeId = T.ServiceLogTypeId
  INNER JOIN Tbl_ServiceLogApplication A ON L.LogTypeId = T.ServiceLogTypeId


EXEC spAddServiceLog @aLogTypeId = 1
                    ,@aApplicationId = 2
                    ,@aURL = N'www.adrinsoft.ir'
                    ,@aParams = N'{name : "Naser"  , task : "Run your own business !!!!"}'
                    ,@aResult = N'{status : False , Data : "Fuck Off :D"}'
                    ,@aMethod = 'GetSubscriberParents'
                    ,@aError= 'No Error'
                    ,@aKeyId = 400098656
                    ,@aKeyTypeId = 1
                    ,@aIsSuccess = 1
                    ,@aLevelId = 1

  
SELECT * FROM TblServiceLog ORDER BY 1 DESC

-------------------------------------------------------------------------------------

SELECT DisconnectGroupId
	,DisconnectGroupSetId
	,COUNT(CntRequest) AS CntRequest
	,ISNULL(SUM(DisconnectPower), 0) AS DisconnectPower
	,ISNULL(sum(DisconnectInterval), 0) AS DisconnectInterval
FROM VIEW_FORM_4_3
WHERE (
		DisconnectDatePersian >= '1400/07/01'
		AND DisconnectDatePersian <= '1400/07/30'
		)
GROUP BY DisconnectGroupId
	,DisconnectGroupSetId


SELECT R.IsSingleSubscriber,V.DisconnectPower ,V.DisconnectInterval, V.* FROM VIEW_FORM_4_3 V
  INNER JOIN TblLPRequest R ON V.RequestId = R.LPRequestId
  WHERE V.DisconnectDatePersian >= '1400/07/01'
		AND V.DisconnectDatePersian <= '1400/07/30'
    AND V.DisconnectGroupSetId = 62
    AND V.DisconnectGroupId = 4
  AND R.IsSingleSubscriber = 0

SELECT * FROM Tbl_DisconnectGroup WHERE DisconnectGroupId = 4
SELECT * FROM Tbl_DisconnectGroupSet WHERE DisconnectGroupSetId = 62

SELECT EndJobStateId,RequestNumber,DisconnectPower,DisconnectInterval,IsSingleSubscriber,* FROM TblRequest 
  WHERE RequestId IN (100000001348881,100000001348117)

SELECT IsSingleSubscriber,* FROM TblLPRequest WHERE LPRequestId IN (100000001348881,100000001348117)


SELECT * FROM TblDepartmentInfo 

SELECT * FROM Tbl_Area

