USE CcRequesterDepartment
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TblUsedPart' 
--AND ORDINAL_POSITION > 88
AND COLUMN_NAME LIKE '%count%'
--ORDER BY COLUMN_NAME
ORDER BY ORDINAL_POSITION

SELECT * FROM Tbl_GenericPart

SELECT *
FROM INFORMATION_SCHEMA.Tables
WHERE TABLE_NAME like '%usedpart%' 