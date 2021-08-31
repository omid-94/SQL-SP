
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS c
  WHERE TABLE_NAME = 'Tbl_MPFeeder'
  AND COLUMN_NAME LIKE '%feeder%'

SELECT * FROM Tbl_Area

SELECT * FROM Tbl_MPPost WHERE AreaId

SELECT * FROM Tbl_MPFeeder WHERE MPPostId

SELECT * FROM Tbl_LPPost WHERE LPPostId IN (3)

SELECT LPP.LPPostName , MPF.MPFeederName , MPP.MPPostName , A.Area FROM Tbl_LPPost LPP
  INNER JOIN Tbl_MPFeeder MPF ON LPP.MPFeederId = MPF.MPFeederId
  INNER JOIN Tbl_MPPost MPP ON MPF.MPPostId = MPP.MPPostId
  INNER JOIN Tbl_Area A ON MPP.AreaId = A.AreaId

EXEC spGetReport_6_21_01 '3' , '' , '' , ''