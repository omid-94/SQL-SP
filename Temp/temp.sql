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

EXEC spGetReport_2_2_8 '1390/10/10','1400/04/08','',-1,'',-1,-1,0,'','','',0,-1,'','','',1

SELECT DISTINCT 	Tbl_LPPost.AreaId, 	Tbl_Area.Area, 	HavayiCount, 	ZaminiCount, 	StartDate, 	EndDate, 	HavayiService, 	ZaminiService FROM 	Tbl_LPPost 	INNER JOIN Tbl_Area ON Tbl_LPPost.AreaId = Tbl_Area.AreaId 	INNER JOIN 	( 	SELECT 		Tbl_LPPost.AreaId, 		COUNT(CASE WHEN Tbl_LPPost.IsHavayi = 1 THEN Tbl_LPPost.LPPostId END) AS HavayiCount, 		COUNT(CASE WHEN Tbl_LPPost.IsHavayi = 0 THEN Tbl_LPPost.LPPostId END) AS ZaminiCount 	FROM 		Tbl_LPPost 		INNER JOIN Tbl_MPFeeder ON Tbl_LPPost.MPFeederId = Tbl_MPFeeder.MPFeederId        INNER JOIN Tbl_MPPost ON Tbl_MPFeeder.MPPostId = Tbl_MPPost.MPPostId 	    LEFT JOIN BTblBazdidResult ON Tbl_MPFeeder.MPFeederId = BTblBazdidResult.MPFeederId        LEFT JOIN BTblBazdidTiming ON BTblBazdidResult.BazdidTimingId = BTblBazdidTiming.BazdidTimingId 	GROUP BY 		Tbl_LPPost.AreaId 	) AS Tbl_LPPostCount ON Tbl_LPPost.AreaId = Tbl_LPPostCount.AreaId 	INNER JOIN 	( 	SELECT 		Tbl_LPPost.AreaId, 		MIN(StartDate) AS StartDate, 		MAX(EndDate) AS EndDate, 		COUNT(CASE WHEN Tbl_LPPost.IsHavayi = 1 THEN Tbl_LPPost.LPPostId END) AS HavayiService, 		COUNT(CASE WHEN Tbl_LPPost.IsHavayi = 0 THEN Tbl_LPPost.LPPostId END) AS ZaminiService 	FROM 		Tbl_LPPost 		INNER JOIN Tbl_MPFeeder ON Tbl_LPPost.MPFeederId = Tbl_MPFeeder.MPFeederId        INNER JOIN Tbl_MPPost ON Tbl_MPFeeder.MPPostId = Tbl_MPPost.MPPostId 	    LEFT JOIN BTblBazdidResult ON Tbl_MPFeeder.MPFeederId = BTblBazdidResult.MPFeederId        LEFT JOIN BTblBazdidTiming ON BTblBazdidResult.BazdidTimingId = BTblBazdidTiming.BazdidTimingId 		INNER JOIN 		( 		SELECT DISTINCT 			Tbl_LPFeeder.LPPostId, 			MIN(BTblServiceCheckList.DoneDatePersian) AS StartDate, 			MAX(BTblServiceCheckList.DoneDatePersian) AS EndDate 		FROM 			Tbl_LPFeeder            INNER JOIN Tbl_LPPost ON Tbl_LPFeeder.LPPostId = Tbl_LPPost.LPPostId 			INNER JOIN BTblBazdidResult ON Tbl_LPFeeder.LPFeederId = BTblBazdidResult.LPFeederId AND BTblBazdidResult.BazdidTypeId = 3 			INNER JOIN BTblBazdidResultAddress ON BTblBazdidResult.BazdidResultId = BTblBazdidResultAddress.BazdidResultId 			INNER JOIN BTblBazdidResultCheckList ON BTblBazdidResultAddress.BazdidResultAddressId = BTblBazdidResultCheckList.BazdidResultAddressId 			INNER JOIN BTblServiceCheckList ON BTblBazdidResultCheckList.BazdidResultCheckListId = BTblServiceCheckList.BazdidResultCheckListId            LEFT JOIN BTblBazdidTiming ON BTblBazdidResult.BazdidTimingId = BTblBazdidTiming.BazdidTimingId  LEFT JOIN BTblService ON BTblServiceCheckList.ServiceId = BTblService.ServiceId 		WHERE 			BTblServiceCheckList.ServiceStateId = 3 			AND Tbl_LPFeeder.IsLightFeeder = 1 AND ISNULL(BTblService.IsWarmLine,0)  =  1  AND BTblServiceCheckList.DoneDatePersian >= '1390/01/01' AND BTblServiceCheckList.DoneDatePersian <= '1400/04/08'		GROUP BY 			Tbl_LPFeeder.LPPostId 		) AS Tbl_Service ON Tbl_LPPost.LPPostId = Tbl_Service.LPPostId 	GROUP BY 		Tbl_LPPost.AreaId 	) AS Tbl_ServiceCount ON Tbl_LPPost.AreaId = Tbl_ServiceCount.AreaId	