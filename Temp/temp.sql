
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[spSendPeymankarAllowSMS]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[spSendPeymankarAllowSMS]
GO
CREATE PROCEDURE [dbo].[spSendPeymankarAllowSMS]
AS
BEGIN
  DECLARE @lNowDT AS DATETIME = GETDATE()
  DECLARE @lReqAreaID AS BIGINT, @lBazdidID AS BIGINT, @lRequestNumber AS BIGINT
  DECLARE @lAllowNumber AS NVARCHAR(50), @lSMSDesc AS NVARCHAR(50)
  DECLARE @lPeymankar AS NVARCHAR(100)
  DECLARE @lPeymankarMobile AS NVARCHAR(20)
  DECLARE @lSMS AS NVARCHAR(2000) ,@lSMSBuff AS NVARCHAR(2000)
  SELECT @lSMS = ConfigText FROM Tbl_Config WHERE ConfigName = N'SMSPeymankarAllow'
  SELECT R.AreaId ,R.RequestNumber, B.BazdidId ,B.AllowNumber , TR.Peymankar , TR.PeymankarMobileNo
    INTO #tmp FROM TblRequest R
    INNER JOIN TblTamirRequestConfirm TRC ON R.RequestId = TRC.RequestId
    INNER JOIN TblTamirRequest TR ON TRC.TamirRequestId = TR.TamirRequestId
    INNER JOIN TblBazdid B ON R.RequestId = B.RequestId
    INNER JOIN Homa.TblRequestAllow RA ON B.BazdidId = RA.BazdidId
    WHERE RA.AllowStatusId IN (6,7) AND DATEDIFF(DAY , R.DisconnectDT ,@lNowDT) < 2
      AND R.EndJobStateId IN (4,5)
    DELETE FROM #tmp WHERE BazdidId IN (SELECT BazdidId FROM TblBazdidInfo)
  IF(NOT EXISTS(SELECT 1 FROM #tmp))
  BEGIN
    INSERT INTO #tmp SELECT R.AreaId ,R.RequestNumber, B.BazdidId ,B.AllowNumber , TR.Peymankar , TR.PeymankarMobileNo
      FROM TblRequest R
      INNER JOIN TblTamirRequestConfirm TRC ON R.RequestId = TRC.RequestId
      INNER JOIN TblTamirRequest TR ON TRC.TamirRequestId = TR.TamirRequestId
      INNER JOIN TblBazdid B ON R.RequestId = B.RequestId
      WHERE DATEDIFF(DAY , R.DisconnectDT ,@lNowDT) < 2
        AND R.EndJobStateId IN (4,5)
      DELETE FROM #tmp WHERE BazdidId IN (SELECT BazdidId FROM TblBazdidInfo)
  END;
  DECLARE db_cursor CURSOR FOR SELECT * FROM #tmp  
  OPEN db_cursor 
  FETCH NEXT FROM db_cursor INTO @lReqAreaID, @lRequestNumber, @lBazdidID, @lAllowNumber, @lPeymankar, @lPeymankarMobile
  WHILE @@FETCH_STATUS = 0  
  BEGIN
      INSERT INTO TblBazdidInfo (BazdidId, IsSentAllowNumberSMS) VALUES (@lBazdidID , CAST(1 AS BIT));
      SET @lSMSBuff = Replace( @lSMS,'RequestNumber', ISNULL(@lRequestNumber,'؟'))
      SET @lSMSBuff = Replace( @lSMSBuff,'AllowNumber', ISNULL(@lAllowNumber,'؟'))
      SET @lSMSDesc = 'SMS AllowNo : ' + @lAllowNumber
      EXEC spSendSMS @lSMSBuff , @lPeymankarMobile, @lSMSDesc , '' , @lReqAreaID
  FETCH NEXT FROM db_cursor INTO @lReqAreaID, @lRequestNumber, @lBazdidID, @lAllowNumber, @lPeymankar, @lPeymankarMobile
  END 

  CLOSE db_cursor  
  DEALLOCATE db_cursor 
  DROP TABLE #tmp
END

EXEC [spSendPeymankarAllowSMS]

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%stat%'
ORDER BY COLUMN_NAME
--ORDER BY ORDINAL_POSITION

SELECT E.EndJobState , E.EndJobStateId,* FROM TblRequest R
  INNER JOIN Tbl_EndJobState E ON R.EndJobStateId = E.EndJobStateId
  WHERE RequestNumber = 400991941
--  WHERE R.DisconnectDatePersian = '1400/05/05'

SELECT * FROM TblError WHERE ErrorId = 990186726


SELECT * FROM TblBazdidInfo 

DELETE FROM TblBazdidInfo

SELECT CreateDTPersian,* FROM Tbl_SMS  
  WHERE CreateDTPersian = '1400/05/05'
  ORDER BY CreateTime DESC

DELETE FROM Tbl_SMS WHERE CreateDTPersian = '1400/05/05'
