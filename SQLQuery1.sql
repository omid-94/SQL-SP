USE [CcRequesterSetad]
GO
/****** Object:  StoredProcedure [dbo].[spAAAAa]    Script Date: 04/06/2021 14:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spAAAAa]
	@MediaTypeId int,
	@AreaIDs as varchar(500),
	@FromDate as varchar(10),
	@ToDate as varchar(10),
	@ExternalServiceIDs as varchar(500),
	@EndJobStateIDs as varchar(500)
as

declare @lsql01 as nvarchar(4000)
declare @lsql02 as nvarchar(4000)

create table #tmpArea (AreaId int)
	set @lsql01 = ' select AreaId from tbl_Area '
if @AreaIDs <> ''
	set  @lsql01 += ' where AreaId in (' + @AreaIDs + ')'
insert #tmpArea exec (@lsql01) 

--create table #tmpMediaType (MediaTypeId int)
--	set @lsql02 = ' select MediaTypeId from Tbl_MediaType '
--if @MediaTypeId <> ''
--	set  @lsql02 += ' where MediaTypeId in (' + @MediaTypeId + ')'
--insert #tmpMediaType exec (@lsql02)


select tl.AreaId , Area ,SUM(cntNew6)as cntNew6,SUM(cntDone6) as cntDone6,
	SUM(cntNotDone6)as cntNotDone6,SUM(avgInterval6)as avgInterval6,
	SUM(cntNew5) as cntNew5,SUM(cntDone5) as cntDone5,SUM(cntNotDone5) as cntNotDone5,
	SUM(avgInterval5) as avgInterval5 from
(
select 6 as mediaTypeId, TblRequest.areaId,
sum(case when EndJobStateId in (4,5) then 1 else 0 end ) as cntNew6,
sum(case when EndJobStateId in (2,3) then  1 else 0 end ) as cntDone6,
sum(case when EndJobStateId in (8) then  1 else 0 end ) as cntNotDone6,
avg(case when EndJobStateId in (2,3) then DisconnectInterval end) as avgInterval6,
0 as cntNew5,
0 as cntDone5,
0 as cntNotDone5,
0 as avgInterval5  from TblRequest 
inner join #tmpArea on TblRequest.AreaId = #tmpArea.AreaId
LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
where TblRequest.DisconnectDatePersian> '1398/01/01' and 
	ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6
group by TblRequest.AreaId
union
select 5 as mediaTypeId, TblRequest.areaId,
0 as cntNew6,
0 as cntDone6,
0 as cntNotDone6,
0 as avgInterval6,
sum(case when EndJobStateId in (4,5) then 1 else 0 end ) as cntNew5,
sum(case when EndJobStateId in (2,3) then  1 else 0 end ) as cntDone5,
sum(case when EndJobStateId in (8) then  1 else 0 end ) as cntNotDone5,
avg(case when EndJobStateId in (2,3) then DisconnectInterval end) as avgInterval5  from TblRequest 
inner join #tmpArea on TblRequest.AreaId = #tmpArea.AreaId
LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
where TblRequest.DisconnectDatePersian> '1398/01/01' and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 5
group by TblRequest.AreaId
) tl 
inner join Tbl_Area on Tbl_Area.AreaId = tl.AreaId
where IsCenter = 0
group by tl.AreaId

drop table #tmpArea


--SELECT AreaId as code, Area as name from Tbl_Area where IsCenter = 0


--select * from Tbl_MediaType

--select 
--ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) as MediaTypeId,
--* from
--TblRequest
--LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
--LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId



--select * from 
--where ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 5

--select * from 
--where ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6


--select * from Tbl_EndJobState


--select areaId, COUNT(*) from TblRequest where not EndJobStateId in (7,10,6)
--group by AreaId



--select TblRequest.areaId, COUNT(*) from TblRequest 
--LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
--LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
--where EndJobStateId in (4,5)
--and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6
--group by TblRequest.AreaId

--select TblRequest.areaId, COUNT(*) from TblRequest 
--LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
--LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
--where EndJobStateId in (2,3)
--and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6
--group by TblRequest.AreaId

--select TblRequest.areaId, COUNT(*) from TblRequest 
--LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
--LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
--where EndJobStateId =8
--and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6
--group by TblRequest.AreaId

--select TblRequest.areaId, AVG(TblRequest.DisconnectInterval) from TblRequest 
--LEFT JOIN Tbl_GISSMSRecevied tGSMS ON TblRequest.RequestId = tGSMS.RequestId
--LEFT JOIN TblRequestData tRD ON TblRequest.RequestId = tRD.RequestId 
--where EndJobStateId in (2,3)
--and ISNULL(tGSMS.MediaTypeId, ISNULL(tRD.MediaTypeId, case when not TblRequest.CallId is null then 2 else 10 end)) = 6
--group by TblRequest.AreaId


--ar.AreaId, Area,0 as cntAll, 0 as cntNew6,0 as cntDone6 , 0 as cntNotDone6,
-- 0 as avgInterval6, 0 as cntNesbat6,
--0 as cntNew5,0 as cntDone5,0 as cntNotDone5,0 as avgInterval5, 0 as cntNesbat5




--select AreaId, Area,0 as cntAll, 0 as cntNew6,0 as cntDone6 , 0 as cntNotDone6, 0 as avgInterval6, 0 as cntNesbat6,
--0 as cntNew5,0 as cntDone5,0 as cntNotDone5,0 as avgInterval5, 0 as cntNesbat5 from
--Tbl_Area
--where IsCenter = 0

-- نوع خدمت : select * from Tbl_ExternalService

select top(10) * from TblRequest