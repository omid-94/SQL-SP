USE CCRequesterSetad
GO


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblFuseSecsuner'
  AND COLUMN_NAME LIKE '%FuseSecsune%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%color%' AND TABLE_TYPE = 'BASE TABLE'

  SELECT DISTINCT
   o.name AS Object_Name,
   o.type_desc
FROM sys.sql_modules m
   INNER JOIN
   sys.objects o
            ON m.object_id = o.object_id
WHERE m.definition Like '%CCRequesterSetad%'
---------------------------------------

SELECT * FROM TblTamirRequest WHERE TamirRequestNo = 40099725

SELECT * FROM TblTamirOperationList WHERE TamirRequestId = 9900000000000042

EXEC spGetReport_6_21_02 @aAreaIds = ''
                        ,@aMPPost = ''
                        ,@aMPFeederIds = ''
                        ,@aLPPostIds = ''

EXEC spGetReport_6_21 '10,2,3,7' , '' , '' , ''

EXEC spGetReport_6_21_Post '10,2,3,7' , '' , '' , ''

SELECT * FROM TblSecsuner

SELECT CASE WHEN FuseSecsunerId IS NOT NULL THEN 'frfrfrr' ELSE NULL END
  FROM TblFuseSecsuner
