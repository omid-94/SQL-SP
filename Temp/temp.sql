
SELECT TOP(10) IsTamir,IsFogheToziRequest,IsMPRequest ,* FROM TblRequest ORDER BY 1 DESC

SELECT * FROM TblFogheToziDisconnect WHERE FogheToziId = 1 --Kambood

SELECT * FROM TblMPRequest WHERE DisconnectReasonId IN (1235 , 1215) --Kambood

SELECT * FROM Homa.TblJob WHERE JobStatusId = 7
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Tbl_ServiceLogType 

--homa
--homa@123

-------------------------------------------------------------------------------------------------------------------------

SELECT TOP(100) * FROM Homa._tblRegister 

SELECT TOP(100) * FROM Homa.TblRegister WHERE MobileNo = '093612244201'
  
SELECT TOP(100) * FROM Homa.TblRegisterBillingID WHERE BillingID = '1234567890111'

EXEC Homa.spGetSubscriberBilling @CallerId = '0216565655', @BillingIDTypeId = 1

EXEC Homa.spDelSubscriberBilling @CallerId = '0216565655', @BillingID = '1234567890111'

----------------------------------------------------------------------------------------

SELECT * FROM Tbl_EndJobState ORDER BY 1 

SELECT * FROM Emergency.TblTimingMPFeeder WHERE TimingMPFeederId = @aTimingMPFeederId



EXEC Emergency.spGetContours @aToolIDs = ''
                            ,@aStationIDs = ''
                            ,@aTypeID = ''

EXEC spRayaGetOutageByNetwork @aFromDate = '1401/03/01'
                             ,@aMPFeederId = 10
                             ,@aLPPostId = 0
                             ,@aLPFeederId = 0

EXEC spRayaGetTamirOutageByNetwork @aFromDate = ''
                                  ,@aToDate = ''
                                  ,@aMPFeederId = 0
                                  ,@aLPPostId = 0
                                  ,@aLPFeederId = 0

EXEC spRayaGetTamirOutageByAreaDate @aAreaId = 0
                                   ,@aFromDate = ''
                                   ,@aToDate = ''

EXEC spRayaGetOutageByAreaDate @aAreaId = 0
                              ,@aFromDate = ''
                              ,@aToDate = ''


EXEC Emergency.spGetReportDisconnectAreas @aPersianDate = '1401/03/28'
                                         ,@aAreaIDs = ''

EXEC Emergency.spGetFeederGroupPlan @aGroupMPFeederId = 0
                                  ,@aDayCount = 0
                                  ,@aTimingId = 0
                                  ,@aDisDatePersian = ''
                                  ,@aDisTime = ''

---------------RASAD DB-------------RASAD DB-------------RASAD DB--------------RASAD DB-----------------
USE RasadDB
GO 
SELECT * FROM Tbl_ToziIP WHERE SID = 32
UPDATE Tbl_ToziIP SET ServerName = N'استان تهران' WHERE SID = 32
