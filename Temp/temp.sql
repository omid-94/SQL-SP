
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


EXEC Homa.spGetSubscriberBilling @CallerId='0216565655', @BillingIDTypeId=1


exec Homa.spDelSubscriberBilling @CallerId='0216565655', @BillingID='1234567890111'