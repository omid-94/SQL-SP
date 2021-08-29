
SELECT *
FROM INFORMATION_SCHEMA.TABLES t
  WHERE TABLE_NAME LIKE '%spec%'
--  AND COLUMN_NAME LIKE '%user%'

SELECT * FROM Tbl_LPPost

SELECT * FROM TblSecsuner

SELECT * FROM TblSpec

SELECT LPP.LPPostId, A.Area, MPP.MPPostName , MPF.MPFeederName , LPP.LPPostName, LPP.LPPostCode , LPP.PostCapacity
    
  FROM Tbl_LPPost LPP
  INNER JOIN Tbl_MPFeeder MPF ON LPP.MPFeederId = MPF.MPFeederId
  INNER JOIN Tbl_MPPost MPP ON MPF.MPPostId = MPP.MPPostId
  INNER JOIN Tbl_Area A ON LPP.AreaId = A.AreaId
  INNER JOIN TblSecsuner Sec ON LPP.LPPostId = Sec.LPPostId
  LEFT JOIN TblSpec Spc_Sec ON Sec.spcSecsunerTypeId = Spc_Sec.SpecId
  LEFT JOIN TblSpec Spc_App ON Sec.spcSecsunerTypeId = Spc_App.SpecId
  LEFT JOIN TblSpec Spc_Fac ON Sec.spcSecsunerTypeId = Spc_Fac.SpecId
  LEFT JOIN TblSpec Spc_Mec ON Sec.spcSecsunerTypeId = Spc_Mec.SpecId
  LEFT JOIN TblSpec Spc_Sar ON Sec.spcSecsunerTypeId = Spc_Sar.SpecId
  LEFT JOIN TblSpec Spc_Size ON Sec.spcSecsunerTypeId = Spc_Size.SpecId