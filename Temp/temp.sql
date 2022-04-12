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
--TRUNCATE TABLE TblServiceLog

SELECT * FROM TblServiceLog

SELECT * FROM Tbl_ServiceLogType

SELECT * FROM Tbl_ServiceLogApplication

-------------------------

SELECT * FROM Tbl_ServiceLogKeyType

SELECT * FROM Tbl_ServiceLogLevel

SELECT * FROM ViewServiceLog ORDER BY LogDT DESC

EXEC spAddServiceLog @aLogTypeId = 1
                    ,@aApplicationId = 2
                    ,@aURL = N'www.adrinsoft.ir'
                    ,@aParams = N'{name : "Naser"  , task : "Run your own business !!!!"}'
                    ,@aResult = N'{status : False , Data : "Fuck Off :D"}'
                    ,@aCompany = N'Tazarv'
                    ,@aMethod = 'GetSubscriberParents'
                    ,@aError= 'No Error'
                    ,@aKeyId = 400098655
                    ,@aKeyTypeId = 1
                    ,@aIsSuccess = 1
                    ,@aLevelId = 1

  
SELECT * FROM TblServiceLog ORDER BY 1 DESC

--------------------------------------------------------------------------

SELECT CriticalsAddress , WorkingAddress,MPPostId,* FROM TblTamirRequest WHERE TamirRequestNo IN (40099741)

SELECT * FROM Tbl_TestService
  
SELECT * FROM Tbl_TestServiceSMS
------------------------------------------------------------------------

SELECT * FROM TblErjaRequest 
---------------------------------------------

SELECT * FROM Tbl_Ownership

/*
				Tbl_MPFeeder.OwnershipId=2 and 
				TblRequest.IsDisconnectMPFeeder = 1 and
				(TblRequest.IsTamir =0 and TblMPRequest.DisconnectInterval>5) 
*/			
--------------------------------------------------------------------------------
SELECT AreaCode ,* FROM Tbl_Area 


SELECT * FROM Tbl_AreaInfo 



SELECT CityId ,* FROM TblRequest WHERE RequestNumber = 4009921236

---------------------------


Select * from Emergency.Tbl_GroupMPFeeder

Select * from Emergency.Tbl_MPFeederTemplate


SELECT G.GroupMPFeederId , G.GroupMPFeederName ,COUNT(*) AS MPFeederCount 
  FROM Emergency.Tbl_GroupMPFeeder G
    LEFT JOIN Emergency.Tbl_MPFeederTemplate T ON G.GroupMPFeederId = T.GroupMPFeederId
  GROUP BY G.GroupMPFeederId , G.GroupMPFeederName


SELECT * FROM Tbl_MPFeederKey

SELECT T.* , K1.KeyName, K2.KeyName, K3.KeyName, K4.KeyName , A.Area , MPF.MPFeederName ,LT.MPFeederLimitType
  FROM Emergency.Tbl_MPFeederTemplate T
  INNER JOIN Tbl_MPFeeder MPF ON T.MPFeederId = MPF.MPFeederId
  LEFT JOIN Emergency.Tbl_MPFeederLimitType LT ON T.MPFeederLimitTypeId = LT.MPFeederLimitTypeId
  LEFT JOIN Tbl_Area A ON T.AreaId = A.AreaId
  LEFT JOIN Tbl_MPFeederKey K1 ON T.MPFeederKeyId1 = K1.MPFeederKeyId
  LEFT JOIN Tbl_MPFeederKey K2 ON T.MPFeederKeyId2 = K2.MPFeederKeyId
  LEFT JOIN Tbl_MPFeederKey K3 ON T.MPFeederKeyId3 = K3.MPFeederKeyId
  LEFT JOIN Tbl_MPFeederKey K4 ON T.MPFeederKeyId4 = K4.MPFeederKeyId



SELECT * FROM Emergency.Tbl_MPFeederTemplate


SELECT * FROM Emergency.Tbl_MPFeederLimitType 

-------------------------------------------------------------
SELECT MPFeederKeyId , KeyName AS MPFeederKey FROM Tbl_MPFeederKey

SELECT T.* , K1.KeyName, K2.KeyName, K3.KeyName, K4.KeyName ,
            A.Area , MPF.MPFeederName ,LT.MPFeederLimitType
              FROM Emergency.Tbl_MPFeederTemplate T
            INNER JOIN Tbl_MPFeeder MPF ON T.MPFeederId = MPF.MPFeederId
            LEFT JOIN Emergency.Tbl_MPFeederLimitType LT ON T.MPFeederLimitTypeId = LT.MPFeederLimitTypeId
            LEFT JOIN Tbl_Area A ON T.AreaId = A.AreaId
            LEFT JOIN Tbl_MPFeederKey K1 ON T.MPFeederKeyId1 = K1.MPFeederKeyId
            LEFT JOIN Tbl_MPFeederKey K2 ON T.MPFeederKeyId2 = K2.MPFeederKeyId
            LEFT JOIN Tbl_MPFeederKey K3 ON T.MPFeederKeyId3 = K3.MPFeederKeyId
            LEFT JOIN Tbl_MPFeederKey K4 ON T.MPFeederKeyId4 = K4.MPFeederKeyId

  SELECT MPFeederId , MPFeederName FROM Tbl_MPFeeder

