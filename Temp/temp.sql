
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%type%'



SELECT * FROM Tbl_Config WHERE ConfigId BETWEEN 700 AND 710 --ConfigName LIKE '%Homa%'

INSERT INTO Tbl_Config (ConfigId, ConfigName, ConfigValue, ConfigText)
  VALUES (709, 'HomaMonitoringISShowLPPostCode', N'True', NULL); 

DELETE FROM Tbl_Config WHERE ConfigId = 202

UPDATE Tbl_Config SET ConfigValue = 'False' WHERE ConfigId = 709


SELECT  
	Tbl_Area.AreaId,  
	Tbl_Area.Area,  
  Sum((((vRN * RCurrent)+(vTN * TCurrent)+(vSN * SCurrent)))*100/1000)/NULLIF(SUM(Tbl_LPPost.PostCapacity), 0) AS UtilizationFactor     
   FROM Tbl_LPPost  
   LEFT JOIN Tbl_MPFeeder ON Tbl_LPPost.MPFeederId = Tbl_MPFeeder.MPFeederId  
   LEFT JOIN Tbl_MPPost ON Tbl_MPFeeder.MPPostId = Tbl_MPPost.MPPostId  
   INNER JOIN Tbl_Area ON Tbl_LPPost.AreaId = Tbl_Area.AreaId  
   INNER JOIN TblLPPostLoad on Tbl_LPPost.LPPostId = TblLPPostLoad.LPPostId  
  WHERE IsCenter = 0 
  GROUP BY Tbl_Area.AreaId ,Tbl_Area.Area

