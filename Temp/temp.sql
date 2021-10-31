USE CCRequesterSetad
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%end%'


SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%part%' AND TABLE_TYPE = 'BASE TABLE'
---------------------------------------


SELECT 	Tbl_Area.Area, 	TblRequest.RequestNumber, 	TblRequest.Address, 	TblRequest.DisconnectDatePersian, 	Tbl_MPPart.MPPart AS Part, 	TblMPRequestPart.MPPartValueSerghat AS cntSerghat, 	
  CASE WHEN NOT (TblMPRequest.Comments) IS NULL AND (TblMPRequest.Comments) <> ''THEN '- ' + TblMPRequest.Comments 
    + CASE WHEN (TblRequest.Comments) <> '' AND NOT (TblRequest.Comments)IS NULL THEN nchar(13) 
    + '- ' + TblRequest.Comments ELSE '' END 	
      WHEN (TblMPRequest.Comments) IS NULL THEN CASE WHEN NOT (TblRequest.Comments) IS NULL AND NOT (TblRequest.Comments) = ''
        THEN '- ' + TblRequest.Comments END
  	END as Comments 
  FROM 	TblRequest 	
  INNER JOIN TblMPRequest ON TblRequest.MPRequestId = TblMPRequest.MPRequestId 	
  INNER JOIN TblMPRequestPart ON TblMPRequest.MPRequestId = TblMPRequestPart.MPRequestId 	
  INNER JOIN Tbl_MPPart ON TblMPRequestPart.MPPartId = Tbl_MPPart.MPPartId 	
  INNER JOIN Tbl_Area ON TblRequest.AreaId = Tbl_Area.AreaId 
  WHERE 	TblMPRequestPart.MPPartValueSerghat > 0  
    AND TblRequest.DisconnectDatePersian >= '1390/08/09' 
    AND TblRequest.DisconnectDatePersian <= '1400/08/09' 
    AND Tbl_Area.AreaId IN (2,3)
  AND Tbl_MPPart.MPPartId IN (1,2,3,4,5,6)


SELECT * FROM Tbl_MPPart

SELECT * FROM Tbl_LPPart

SELECT * FROM Tbl_LightPart

SELECT * FROM  TblMPRequestPart

SELECT * FROM TblLightRequestPart

------------------------------------------------
