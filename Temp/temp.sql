USE CCRequesterSetad
GO


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblLPRequest'
  AND COLUMN_NAME LIKE '%post%'

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

SELECT * FROM Tbl_MPPost WHERE  AreaId IN (2,3)

SELECT * FROM Tbl_MPFeeder WHERE  MPPostId IN (1) AND AreaId IN(2,3)


SELECT * FROM Tbl_MPFeeder WHERE  MPPostId IN (990163401,50051985) AND AreaId IN(5,13)

---------------------------


SELECT SUM ( dbo.MinuteCount ( CONVERT(DATETIME, '2021/12/07 0:0' , 102), CONVERT(DATETIME, '2021/12/07 1:0' , 102), TblRequest.DisconnectDT, TblRequest.ConnectDT ) / TblRequest.DisconnectInterval * TblRequest.DisconnectPower ) AS PartPower 
  FROM TblRequest 
  LEFT OUTER JOIN TblMPRequest ON TblRequest.MPRequestId = TblMPRequest.MPRequestId 
  LEFT JOIN Tbl_MPFeeder MPF ON TblMPRequest.MPFeederId = MPF.MPFeederId 
  LEFT OUTER JOIN TblLPRequest ON TblRequest.LPRequestId = TblLPRequest.LPRequestId 
  LEFT JOIN Tbl_LPFeeder LPF ON TblLPRequest.LPFeederId = LPF.LPFeederId 
  LEFT JOIN Tbl_LPPost LPP ON LPF.LPPostId = LPP.LPPostId 
  LEFT JOIN Tbl_MPFeeder MPLPF ON LPP.MPFeederId = MPLPF.MPFeederId 
  WHERE
      (TblRequest.DisconnectInterval > 0) AND (NOT (TblRequest.ConnectDT IS NULL)) 
      AND TblRequest.DisconnectDatePersian >= '1400/09/16' 
      AND TblRequest.DisconnectDatePersian <= '1400/09/17' 
      AND (IsMPRequest=1 OR IsLPRequest=1 OR IsFogheToziRequest=1) 
      AND TblRequest.AreaId IN (2,7) 
      AND ISNULL(MPF.MPPostId ,MPLPF.MPPostId) IN(990063855,2) 
      AND ISNULL(MPF.MPFeederId ,MPLPF.MPFeederId) IN(990063858,990133687,990052382) 
    ORDER BY PartPower DESC


