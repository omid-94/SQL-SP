USE CcRequester
SELECT *
FROM INFORMATION_SCHEMA.TABLES t
  WHERE TABLE_NAME LIKE '%question%'
--  AND COLUMN_NAME LIKE '%id%'

SELECT TOP 10 * FROM TblQuestionAnswer

SELECT TOP 10 * FROM TblRequestInfo


EXEC spGetUserMessages 0 ,28, 1,' AND H.MediaDateTime BETWEEN ''1400/01/01 00:00:00'' AND ''1400/07/21 23:59:00'' AND H.SourceUserId IN (1,5,6,28) AND M.IsOnlineVoice = 1','LEFT'

SELECT * FROM Tbl_UserChannel

SELECT * FROM Tbl_UserAccess

SELECT * FROM Tbl_Access

EXEC spGetUserChannel 1

EXEC spGetChannelUsers 3

EXEC spGetUsers 5

EXEC spGetDisplayName

SELECT * FROM Tbl_User
  
SELECT * FROM Tbl_Channel

SELECT * FROM Tbl_UserAccess

SELECT * FROM Tbl_Config

select TOP 10 * FROM TblRequestInfo

SELECT TblRequest.AreaId, TblRequest.RequestNumber , ISNULL(TblRequestInfo.QnsAreaUserId , -1) As OperatorId 
  FROM TblRequest 
  INNER JOIN TblRequestInfo ON TblRequest.RequestId = TblRequestInfo.RequestId 
  WHERE TblRequest.AreaId IN (2) 
    AND TblRequest.DisconnectDatePersian >= '1390/08/03' 
    AND TblRequest.DisconnectDatePersian <= '1400/08/03' 
   AND IsLightRequest = 0 
  AND  ( NOT IsRealNotRelated IS NULL OR NOT OperatorConvsType IS NULL 
      OR NOT IsSaveParts IS NULL OR NOT IsInformTamir IS NULL 
      OR NOT IsSaveLight IS NULL 
      OR NOT SubscriberOKType IS NULL 
      OR NOT IsRealDuplicated IS NULL ) 

  EXEC spGetReport_9_18_ByOperator

EXEC spGetReport_9_18_ByOperator '1399/08/03','1400/08/03',10,'100051794,100051800,100051801,100051802,100051808,100051847,100051886,100052265,100052529,100053573,100057624,100074558,100074581,990066396,990117689,990118054,990118075',0