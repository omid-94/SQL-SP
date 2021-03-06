USE [CcRequesterSetad]
GO
/****** Object:  StoredProcedure [dbo].[spAAAAa]    Script Date: 04/06/2021 14:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[spGetReport_Sabz_Erja]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[spGetReport_Sabz_Erja]
GO

CREATE PROCEDURE [dbo].[spGetReport_Sabz_Erja]
	@MediaTypeId int,
	@AreaIDs AS varchar(500),
	@FromDate AS NVARCHAR(10),
	@ToDate AS NVARCHAR(10),
	@ExternalServiceIds AS varchar(500)
AS
BEGIN

DECLARE @lsql AS NVARCHAR(4000)

CREATE TABLE #tmpArea (AreaId INT)
	SET @lsql = ' SELECT AreaId FROM tbl_Area '
IF @AreaIDs <> ''
	SET  @lsql += ' WHERE AreaId in (' + @AreaIDs + ')'
INSERT #tmpArea EXEC (@lsql)

CREATE TABLE #tmpExternal (ExternalServiceId INT)
	SET @lsql = ' SELECT ExternalServiceId FROM Tbl_ExternalService '
IF @ExternalServiceIds <> ''
	SET  @lsql += ' WHERE ExternalServiceId in (' + @ExternalServiceIds + ')'
INSERT #tmpExternal EXEC (@lsql)

SELECT tl.AreaId , Area , SUM(cntAll) AS cntAll ,SUM(cntNew6) AS cntNew6,SUM(cntDone6) AS cntDone6,
	SUM(cntNotDone6) AS cntNotDone6,SUM(avgInterval6) AS avgInterval6,
	ISNULL(Round(CAST(SUM(cntSum6) AS float) / NullIF(CAST(SUM(cntAll) AS float),0) ,3), 0) AS cntNesbat6 ,
	SUM(cntNew5) AS cntNew5,SUM(cntDone5) AS cntDone5,SUM(cntNotDone5) AS cntNotDone5,
	SUM(avgInterval5) AS avgInterval5 , 
	ISNULL(Round(CAST(SUM(cntSum5) AS float) / NullIF(CAST(SUM(cntAll) AS float),0) , 3) ,0) AS cntNesbat5 
	from
	(
	SELECT 6 AS mediaTypeId, TblRequest.areaId,
		SUM(CASE WHEN ER.ErjaStateId IN (1,3) THEN 1 ELSE 0 END) AS cntNew6,
		SUM(CASE WHEN ER.ErjaStateId IN (4) THEN 1 ELSE 0 END) AS cntDone6,
		SUM(CASE WHEN ER.ErjaStateId IN (5) THEN 1 ELSE 0 END) AS cntNotDone6,
		SUM(CASE WHEN ER.ErjaStateId IN (1,3,4,5) THEN 1 ELSE 0 END) AS cntSum6,
		AVG(CASE WHEN ER.ErjaStateId IN (4) THEN DisconnectInterval END) AS avgInterval6,
		0 AS cntNew5,
		0 AS cntDone5,
		0 AS cntNotDone5,
		0 AS cntSum5,
		0 AS avgInterval5,
		0 AS cntAll
			FROM TblRequest 
		INNER JOIN #tmpArea on TblRequest.AreaId = #tmpArea.AreaId
		LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
		LEFT JOIN TblRequestData tRD on TblRequest.RequestId = tRD.RequestId
		LEFT JOIN #tmpExternal on tRD.ExternalServiceId = #tmpExternal.ExternalServiceId
		INNER JOIN TblErjaRequest ER on TblRequest.RequestId = ER.RequestId
		WHERE TblRequest.DisconnectDatePersian >= @FromDate
			and TblRequest.DisconnectDatePersian <= @ToDate
			and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId,
				CASE WHEN not TblRequest.CallId is null THEN 2 ELSE 10 END)) = 6
			and (@MediaTypeId = 6 or @MediaTypeId = 0)
		GROUP BY TblRequest.AreaId
	union
	SELECT 5 AS mediaTypeId, TblRequest.areaId,
		0 AS cntNew6,
		0 AS cntDone6,
		0 AS cntNotDone6,
		0 AS cntSum6,
		0 AS avgInterval6,
		SUM(CASE WHEN ER.ErjaStateId IN (1,3) THEN 1 ELSE 0 END) AS cntNew5,
		SUM(CASE WHEN ER.ErjaStateId IN (4) THEN 1 ELSE 0 END) AS cntDone5,
		SUM(CASE WHEN ER.ErjaStateId IN (5) THEN 1 ELSE 0 END) AS cntNotDone5,
		SUM(CASE WHEN ER.ErjaStateId IN (1,3,4,5) THEN 1 ELSE 0 END) AS cntSum5,
		AVG(CASE WHEN ER.ErjaStateId IN (4) THEN DisconnectInterval END) AS avgInterval5,
		0 AS cntAll
			FROM TblRequest
		INNER JOIN #tmpArea on TblRequest.AreaId = #tmpArea.AreaId
		LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
		LEFT JOIN TblRequestData tRD on TblRequest.RequestId = tRD.RequestId
		LEFT JOIN #tmpExternal on tRD.ExternalServiceId = #tmpExternal.ExternalServiceId
		INNER JOIN TblErjaRequest ER on TblRequest.RequestId = ER.RequestId
		WHERE TblRequest.DisconnectDatePersian >= @FromDate
			and TblRequest.DisconnectDatePersian <= @ToDate
			and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, 
				CASE WHEN not TblRequest.CallId is null THEN 2 ELSE 10 END)) = 5
			and (@MediaTypeId = 5 or @MediaTypeId = 0)
		GROUP BY TblRequest.AreaId
		union 
		SELECT 0 AS mediaTypeId, TblRequest.areaId,
		0 AS cntNew6,
		0 AS cntDone6,
		0 AS cntNotDone6,
		0 AS cntSum6,
		0 AS avgInterval6,
		0 AS cntNew5,
		0 AS cntDone5,
		0 AS cntNotDone5,
		0 AS cntSum5,
		0 AS avgInterval5,
		SUM(CASE WHEN ER.ErjaStateId not in (6,7,10) THEN 1 ELSE 0 END) AS cntAll
			FROM TblRequest
		INNER JOIN #tmpArea on TblRequest.AreaId = #tmpArea.AreaId
		LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
		LEFT JOIN TblRequestData tRD on TblRequest.RequestId = tRD.RequestId
		LEFT JOIN #tmpExternal on tRD.ExternalServiceId = #tmpExternal.ExternalServiceId
		INNER JOIN TblErjaRequest ER on TblRequest.RequestId = ER.RequestId
		WHERE TblRequest.DisconnectDatePersian >= @FromDate
			and TblRequest.DisconnectDatePersian <= @ToDate
			and (ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, 
				CASE WHEN not TblRequest.CallId is null THEN 2 ELSE 10 END)) = @MediaTypeId 
				or @MediaTypeId = 0)
		GROUP BY TblRequest.AreaId
	) tl 
	INNER JOIN Tbl_Area on Tbl_Area.AreaId = tl.AreaId
	WHERE IsCenter = 0 
	GROUP BY tl.AreaId , Area

drop table #tmpArea
drop table #tmpExternal

end