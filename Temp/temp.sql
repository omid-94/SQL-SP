SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Tbl_MPFeeder'
  AND COLUMN_NAME LIKE '%private%'
ORDER BY COLUMN_NAME
--ORDER BY ORDINAL_POSITION

SELECT TOP 10 * FROM TblMPRequest tm

SELECT TOP 10 * FROM Tbl_MPFeeder tm


---------------------------------------------------------------------------------------------------
DECLARE @From AS VARCHAR(10) = '1399/04/30' 
DECLARE @To AS VARCHAR(10) = '1400/04/30'

EXEC spsKerman_Part1 @From = '1397/04/30' ,@To = '1400/04/30' 

EXEC spSKerman_part1 '1398/02/01', '1400/02/01'

EXEC spGetReport_FeederPeak 20377, '1395/02/01' , '1400/02/31'
-----------------------------------------------------------------------------------------------------
