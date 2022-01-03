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
-----------------------------------------------------------------------------------

SELECT * FROM Tbl_SMS

SELECT * FROM TblServiceLog

SELECT * FROM Tbl_ServiceLogType

SELECT * FROM Tbl_ServiceLogApplication

SELECT T.*,L.* FROM TblServiceLog L
  INNER JOIN Tbl_ServiceLogType T ON L.LogTypeId = T.ServiceLogTypeId
  INNER JOIN Tbl_ServiceLogApplication A ON L.LogTypeId = T.ServiceLogTypeId


EXEC spAddServiceLog @aLogTypeId = 1
                    ,@aApplicationId = 2
                    ,@aURL = N'www.adrinsoft.ir'
                    ,@aParams = N'{name : "Naser"  , task : "Run your own business !!!!"}'
                    ,@aResult = N'{status : False , Data : "Fuck Off :D"}'
                    ,@aError= 'No Error'
                    ,@aIsSuccess = 1


SELECT * FROM Tbl_Config WHERE ConfigName LIKE '%sms%' AND ConfigText LIKE '%مشترک%'
  -- = 'SMSCallTrackingCode'

EXECUTE sp_Raya_RegOutage @First_name = N''
                         ,@Last_name = N''
                         ,@National_code = N''
                         ,@Req_national_code = N''
                         ,@Req_mobile = N''
                         ,@Phone = N''
                         ,@Mobile = N''
                         ,@Bill_id = N''
                         ,@Address = N''
                         ,@CityId = 0
                         ,@AreaId = 0
                         ,@Comment = N''
                         ,@RefertoId = 0
                         ,@DepartmentId = 0
                         ,@EnvironmentTypeId = 0
                         ,@WorkingAreaUserId = 0
                         ,@aCallId = N''
                         ,@IsVoltage = 0
                         ,@IsLightRequest = 0
                         ,@IsDamage = 0
                         ,@DisconnectDate = ''
                         ,@DisconnectTime = ''
                         ,@IsTheft = 0
                         ,@IsPeopleDamage = 0
                         ,@ErjaComment = N''
                         ,@IsFrontage = 0
                         ,@IsDanger = 0
                         ,@IsGovernment = 0
                         ,@IsPlanned = 0
                         ,@GPSx = ''
                         ,@GPSy = ''
                         ,@FileServerId = 0
                         ,@FileName = N''
                         ,@FileDesc = N''
                         ,@MediaTypeId = 0
                         ,@IsSingleSubscriber = 0