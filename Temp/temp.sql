USE CcRequesterDepartment
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TblTamirRequest' 
--AND ORDINAL_POSITION > 88
AND COLUMN_NAME LIKE '%stat%'
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

SELECT TamirRequestNo,IsReturned,ReturnDesc,TamirRequestState FROM ViewTamirRequest WHERE TamirRequestNo = 40002745

SELECT TamirRequestNo,IsReturned,ReturnDesc,ReturnTimeoutDT,TamirRequestId FROM TblTamirRequest WHERE TamirRequestNo = 40002745

--UPDATE TblTamirRequest SET IsReturned = 0, ReturnTimeoutDT = NULL,TamirRequestStateId = 2  WHERE TamirRequestNo = 40002744
UPDATE TblTamirRequest SET IsReturned = 1,TamirRequestStateId = 2  WHERE TamirRequestNo = 40002745

SELECT * FROM TblTamirOperationList
-----------------------RESET-----------------------
DELETE FROM TblTamirOperationList WHERE TamirRequestId = 200000990180276 
DELETE FROM TblTamirRequest WHERE TamirRequestId = 200000990180276 

EXEC spFindFTOverlaps '2021/06/14 16:00:00', '2021/06/14 17:00:00', 4, 151, -1, 2, -1, -1, -1

