SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'BTblService'
AND COLUMN_NAME LIKE '%warm%'
ORDER BY COLUMN_NAME
--ORDER BY ORDINAL_POSITION
SELECT * FROM BTblServiceCheckList bscl

SELECT * FROM BTblService bs

EXEC spGetReport_2_1_1
EXEC spGetReport_2_1_2
EXEC spGetReport_2_1_5
EXEC spGetReport_2_1_8
EXEC spGetReport_2_2_1
EXEC spGetReport_2_2_2
EXEC spGetReport_2_2_5
EXEC spGetReport_2_2_6
EXEC spGetReport_2_2_8
EXEC spGetReport_2_3_8
EXEC spGetReport_2_34_1
EXEC spGetReport_2_34_2
EXEC spGetReport_2_34_5
EXEC spGetReport_2_34_6
