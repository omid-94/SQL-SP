
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

------------------------------------------------------------------------------------------

SELECT * FROM  Tbl_Area 
--
--EXEC spGetLPPosts @aAreaId = 0
--                 ,@aMPFeederId = 0
--                 ,@IsAll = 0

EXEC spGetReport_10_26_All @FromDatePersian = '1401/01/01'
                          ,@ToDatePersian = '1401/05/01'
                          ,@AreaIDs = ''
                          ,@IsDCMPFeeder = 0
                          ,@OwnershipId = 0
                          ,@IsWithFogheTozi = 0
                          ,@IsTamir = 0

EXEC spGetReport_10_26 @FromDatePersian = ''
                      ,@ToDatePersian = ''
                      ,@AreaIDs = ''
                      ,@IsDCMPFeeder = 0
                      ,@OwnershipId = 0
                      ,@IsWithFogheTozi = 0
                      ,@IsTamir = 0


SELECT * FROM Tbl_Config WHERE ConfigName like '%Noti%'



SELECT * FROM Tbl_ToziIP



SELECT COUNT(*) FROM TblRequest


EXEC spGetReport_10_26_All '1401/01/01','1401/04/20','',-1,-1,-1,-1

EXEC spGetReport_10_26_All @FromDatePersian = '1401/01/01'
                          ,@ToDatePersian = '1401/04/20'
                          ,@AreaIDs = ''
                          ,@IsDCMPFeeder = -1
                          ,@OwnershipId = -1
                          ,@IsWithFogheTozi = -1
                          ,@IsTamir = -1