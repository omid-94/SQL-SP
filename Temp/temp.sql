
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
--  	WHERE COLUMN_ NAME LIKE '%BTblServicePartUse%'
  	WHERE TABLE_NAME = 'BTblServicePartUse'
  	AND COLUMN_NAME LIKE '%id%'

EXEC spGetReport_2_1_5 '','','',-1,'',-1,0,'','','990000211,990000214,990000217,990000220','','','','','',',0'

USE CcRequesterSetad

exec spGetReport_6_2 '1390/01/01','1400/04/26','1395/01/01','1400/04/26','','',-1,'','990000211,990000214,990000217,990000220' , ''


SELECT ServicePartId, ServicePartName, ServicePartCode FROM BTbl_ServicePart WHERE BazdidTypeId IS NULL OR BazdidTypeId = 1

SELECT * FROM BTbl_BazdidType bbt

SELECT * FROM BTblService

SELECT * FROM BTblService t1
  LEFT JOIN BTblServicePartUse spu ON t1.ServiceId = spu.ServiceId
  WHERE spu.ServicePartId IN (990000211,990000214,990000217,990000220)