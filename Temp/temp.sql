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

