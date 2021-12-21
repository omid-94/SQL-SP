USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblRequest'
  AND COLUMN_NAME LIKE '%Id'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%load%' AND TABLE_TYPE = 'BASE TABLE'


  SELECT DISTINCT
   o.name AS Object_Name,
   o.type_desc
FROM sys.sql_modules m
   INNER JOIN
   sys.objects o
            ON m.object_id = o.object_id
WHERE m.definition Like '%title%'

-----------------------------------------------------------------------------------



