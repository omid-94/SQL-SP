USE CCRequesterSetad
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblMedia'
  AND COLUMN_NAME LIKE '%rea%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%Disconnect%' AND TABLE_TYPE = 'BASE TABLE'
---------------------------------------

SELECT * FROM TblMedia


SELECT * FROM Tbl_TamirOperation