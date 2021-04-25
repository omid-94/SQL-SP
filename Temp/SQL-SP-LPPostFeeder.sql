USE CcRequesterSetad
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Sp-PostFeederSelect]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[Sp-PostFeederSelect] 
GO
CREATE PROCEDURE [dbo].[Sp-PostFeederSelect] 
	@feederIds as NVARCHAR(1000),
	@state as INT
AS
BEGIN
	Declare @lsql AS NVARCHAR(1000)
	Declare @lsql1 AS NVARCHAR(4000) --**** Post 
	Declare @lsql2 AS NVARCHAR(4000) --**** Feeder
	------------------------- Post Load
	SET @lsql1 = 'SELECT DISTINCT pl.* , f.LPFeederCode , p.LPPostName
		FROM  Tbl_LPFeeder f
		INNER JOIN Tbl_LPPost p ON p.LPPostId = f.LPPostId
		LEFT JOIN TblLPFeederLoad fl ON f.LPFeederId = fl.LPFeederId
		LEFT JOIN TblLPPostLoad pl ON p.LPPostId = pl.LPPostId
		WHERE f.LPFeederId IN (' + @feederIds + ')
		ORDER BY pl.LPPostLoadId DESC';
	------------------------- Feeder Load
	SET @lsql2 = 'SELECT fl.* , f.LPFeederCode
		FROM  Tbl_LPFeeder f
		INNER JOIN TblLPFeederLoad fl ON f.LPFeederId = fl.LPFeederId
		WHERE f.LPFeederId IN (' + @feederIds + ')'
	IF @state = 1
		EXEC(@lsql1)
	ELSE IF @state = 2
		EXEC(@lsql2)
END
GO

exec [dbo].[Sp-PostFeederSelect] '20050983,20051023' , 1;

exec [dbo].[Sp-PostFeederSelect] '20050983,20051023' , 2;

exec [dbo].[Sp-PostFeederSelect] '' , 3;

select * from Tbl_LPFeeder where LPFeederId = 20050983
select * from TblLPFeederLoad where LPFeederId = 9900000990180523



Delete from TblLPFeederLoad where LoadDateTimePersian = '1387/04/22'


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TblLPPostLoad'
ORDER BY ORDINAL_POSITION

select top(2) * from TblLPFeederLoad
select top(2) * from TblLPPostLoad

/*


ALTER VIEW dbo.View_FeederPost
AS
SELECT f.LPFeederCode , f.LPFeederName
	, p.LPPostName , fl.LPFeederId , pl.LPPostId
	, fl.LoadDateTimePersian , fl.LoadTime 
	, fl.RCurrent AS FeederRCurrent , fl.SCurrent AS FeederSCurrent
	, fl.TCurrent AS FeederTCurrent, fl.NolCurrent AS FeederNolcurrent
	, ISNULL(fl.EndlineVoltage,0) AS FeederEndlineVoltage
	, pl.RCurrent AS PostRCurrent, pl.SCurrent AS PostSCurrent
	, pl.TCurrent AS PostTCurrent, pl.NolCurrent AS PostNolCurrent
	, ISNULL(pl.vRN,0) AS PostvRN , ISNULL(pl.vSN,0) AS PostvSN, ISNULL(pl.vTN,0) AS PostvTN
	, ISNULL(pl.vRS,0) AS PostvRS, ISNULL(pl.vTR,0) AS PostvTR, ISNULL(pl.vTS,0) AS PostvTS
	, rf.Fuse AS RFuse, sf.Fuse AS SFuse , tf.Fuse AS TFuse
	FROM  Tbl_LPFeeder f
	INNER JOIN Tbl_LPPost p ON p.LPPostId = f.LPPostId  
	LEFT JOIN TblLPFeederLoad fl ON f.LPFeederId = fl.LPFeederId
	LEFT JOIN TblLPPostLoad pl ON p.LPPostId = pl.LPPostId
	INNER JOIN Tbl_Fuse rf ON rf.FuseId = fl.RFuseId
	INNER JOIN Tbl_Fuse sf ON sf.FuseId = fl.SFuseId
	INNER JOIN Tbl_Fuse tf ON tf.FuseId = fl.TFuseId
go
*/