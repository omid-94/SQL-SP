USE CcRequesterSetad
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ViewTamirRequest' 
--AND ORDINAL_POSITION > 88
AND COLUMN_NAME LIKE '%warm%'
--ORDER BY COLUMN_NAME
ORDER BY ORDINAL_POSITION

SELECT * FROM Tbl_Area

SELECT TOP(2) * FROM TblRequest

SELECT TOP(2) * FROM TblTamirRequest

SELECT TOP(2) * FROM TblTamirRequestDisconnect
  
SELECT TOP(2) * FROM TblTamirRequestConfirm 

SELECT TOP(2) * FROM TblRequestInform

SELECT TOP(2) * FROM TblSubscriberInfom 
  
SELECT * FROM ViewTamirRequest WHERE TamirRequestNo = 40002744

SELECT * FROM Tbl_TamirRequestState 

SELECT TamirRequestNo,IsReturned,ReturnDesc,TamirRequestState FROM ViewTamirRequest WHERE --TamirRequestNo = 40002744

SELECT TamirRequestNo,IsReturned,ReturnDesc,ReturnTimeoutDT FROM TblTamirRequest WHERE TamirRequestNo = 40002744

UPDATE TblTamirRequest SET IsReturned = 0, ReturnTimeoutDT = NULL,TamirRequestStateId = 2  WHERE TamirRequestNo = 40002744

SELECT * FROM TblError WHERE ErrorId = 21451889