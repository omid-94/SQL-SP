ALTER PROCEDURE dbo.spGetReport_2_34_5
	@lFromDatePersian as varchar(12),
	@lToDatePersian as varchar(12),
	@lAreaId as varchar(1000),
	@lMPPostId as int,
	@lMPFeederIds as varchar(1000),
	@lLPPostId as int,
	@lLPFeederId as int,
	@lOwnershipId as int,
	@lIsActive as int,
	@lIsLight as int,
	@lBazdidMaster as varchar(1000),
	@lMPFeederPart as varchar(1000),
	@lParts as varchar(1000),
	@lAddress as varchar(1000),
	@lBazdidSpeciality as varchar(100) = '',
	@lServiceNumber as varchar(1000)= '',
	@lFromDateBazdid as varchar(12),
	@lToDateBazdid as varchar(12),
	@lWorkCommand as nvarchar(100),
  @lIsWarmLine AS BIT = 0 ----------omid
AS
	DECLARE @lWhere as varchar(4000)
	DECLARE @lWhereDT as varchar(2000)
	DECLARE @lSql as varchar(8000)
	DECLARE @lJoinSpecialitySql as varchar(500) = ''

	set @lWhere = ''
	set @lWhereDT = ''

	if @lFromDatePersian <> ''
		set @lWhereDT =  ' AND BTblServiceCheckList.DoneDatePersian >= ''' + @lFromDatePersian +''''
	if @lToDatePersian <> ''
		set @lWhereDT = @lWhereDT + ' AND BTblServiceCheckList.DoneDatePersian <= ''' + @lToDatePersian +''''
		
	if @lFromDateBazdid <> ''
		SET @lWhere = @lWhere + ' AND BTblBazdidResultAddress.StartDatePersian >= ''' + @lFromDateBazdid +''''
	if @lToDateBazdid <> ''
		SET @lWhere = @lWhere + ' AND BTblBazdidResultAddress.StartDatePersian <= ''' + @lToDateBazdid +''''
	
		
	if @lAreaId <> ''
		set @lWhere = @lwhere + ' AND Tbl_LPFeeder.AreaId IN ( ' + @lAreaId + ' )'
	if @lLPFeederId > -1
		set @lWhere = @lWhere + ' AND Tbl_LPFeeder.LPFeederId = ' + cast(@lLPFeederId as varchar)
	else if @lLPPostId > -1
		set @lWhere = @lWhere + ' AND Tbl_LPFeeder.LPPostId = ' + cast(@lLPPostId as varchar)
	else if @lMPFeederIds <> ''
		set @lWhere = @lWhere + ' AND Tbl_LPPost.MPFeederId IN ( ' + cast(@lMPFeederIds as varchar) + ' ) '
	else if @lMPPostId > -1
		set @lWhere = @lWhere + ' AND Tbl_MPFeeder.MPPostId = ' + cast(@lMPPostId as varchar)
	if @lOwnershipId  > -1
		set @lWhere = @lwhere + ' AND Tbl_LPFeeder.OwnershipId = ' + cast(@lOwnershipId as varchar)
	if @lServiceNumber  <> ''
		set @lWhere = @lwhere + ' AND BTblService.ServiceNumber = ''' + cast(@lServiceNumber as varchar) + ''''
	if @lIsActive = 1
		set @lWhere = @lWhere + ' AND Tbl_LPFeeder.IsActive = 1 '
    if @lBazdidMaster <> ''
		set @lWhereDT = @lWhereDT + ' AND BTblService.BazdidMasterId IN (' + @lBazdidMaster + ')'
	if @lMPFeederPart <> ''
		set @lWhere = @lWhere + ' AND BTblBazdidResult.BazdidBasketDetailId IN (' + @lMPFeederPart + ')'
	if @lParts <> ''
		set @lWhere = @lWhere + ' AND BTbl_ServicePart.ServicePartId IN (' + @lParts + ')'
	if @lWhereDT <> ''
		set @lWhereDT = ' WHERE ' + RIGHT(@lWhereDT, (LEN(@lWhereDT)-4))
	if @lAddress <> ''
		set @lAddress = ' AND (' + dbo.MergeFarsiAndArabi('BTblBazdidResultAddress.Address',@lAddress) + ')'
	if @lBazdidSpeciality <> ''
	BEGIN
		set @lWhere = @lWhere + ' AND ISNULL(tTS.BazdidSpecialityId,1) IN (' + @lBazdidSpeciality + ')'
		SET @lJoinSpecialitySql = ' LEFT JOIN BTblBazdidTiming ON BTblBazdidResult.BazdidTimingId = BTblBazdidTiming.BazdidTimingId ' +
								' LEFT JOIN BTblTimingSpeciality tTS ON BTblBazdidTiming.BazdidTimingId = tTS.BazdidTimingId '
	END
	if @lWorkCommand <> ''
		set @lWhere = @lwhere + ' AND BTblService.WorkCommandNo = ''' + cast(@lWorkCommand as nvarchar) + ''''
  IF @lIsWarmLine = 1  -----omid
		SET @lWhere = @lWhere + ' AND BTblService.IsWarmLine = 1'
	set @lSql =
		'
		SELECT DISTINCT
			Tbl_Area.AreaId,
			Tbl_Area.Area,
			Tbl_LPPost.LPPostName,
			Tbl_LPFeeder.LPFeederName,
			Tbl_LPFeeder.LPFeederId,
			BTblBazdidResult.BazdidResultId,
			BTblBazdidResult.FromToLengthHavayi,
			Tbl_LPFeeder.HavaeiLength AS LPFeederHavayiLen,
			BTblBazdidResult.FromToLengthZamini,
			Tbl_LPFeeder.ZeminiLength AS LPFeederZaminiLen,
			ISNULL(BTblBazdidResult.FromToLengthHavayi,Tbl_LPFeeder.HavaeiLength) AS HavaeiLength,
			ISNULL(BTblBazdidResult.FromToLengthZamini,Tbl_LPFeeder.ZeminiLength) AS ZeminiLength,
			BTblBazdidResultAddress.BazdidResultAddressId,
			BTblBazdidResult.FromPathTypeId,
			Tbl_PathType_From.PathType AS FromPathType,
			BTblBazdidResult.FromPathTYpeValue,
			BTblBazdidResult.ToPathTypeId,
			Tbl_PathType_To.PathType AS ToPathType,
			BTblBazdidResult.ToPathTypeValue,
			BTblBazdidResultAddress.Address,
			BTblBazdidResultAddress.GPSx,
			BTblBazdidResultAddress.GPSy,
			BTblServicePartUse.Quantity,
			BTbl_ServicePart.ServicePartName, 
			BTbl_ServicePart.PriceOne, 
			BTbl_ServicePart.ServicePrice, 
			BTbl_ServicePart.ServicePartCode, 
			Tbl_PartUnit.PartUnit
		FROM 
			BTblBazdidResultAddress
			INNER JOIN BTblBazdidResult ON BTblBazdidResultAddress.BazdidResultId = BTblBazdidResult.BazdidResultId
			INNER JOIN BTblServicePartUse ON BTblBazdidResultAddress.BazdidResultAddressId = BTblServicePartUse.BazdidResultAddressId
			INNER Join BTblService On BTblServicePartuse.ServiceId = BTblService.ServiceId
			INNER JOIN BTbl_ServicePart ON BTblServicePartUse.ServicePartId = BTbl_ServicePart.ServicePartId
			LEFT OUTER JOIN Tbl_PartUnit ON BTbl_ServicePart.PartUnitId = Tbl_PartUnit.PartUnitId
			LEFT OUTER JOIN Tbl_PathType Tbl_PathType_From ON BTblBazdidResult.FromPathTypeId = Tbl_PathType_From.PathTypeId
			LEFT OUTER JOIN Tbl_PathType Tbl_PathType_To ON BTblBazdidResult.ToPathTypeId = Tbl_PathType_To.PathTypeId
			INNER JOIN Tbl_LPFeeder ON BTblBazdidResult.LPFeederId = Tbl_LPFeeder.LPFeederId
			INNER JOIN Tbl_LPPost ON Tbl_LPFeeder.LPPostId = Tbl_LPPost.LPPostId
			INNER JOIN Tbl_MPFeeder ON Tbl_LPPost.MPFeederId = Tbl_MPFeeder.MPFeederId
			INNER JOIN Tbl_Area ON BTblBazdidResult.AreaId = Tbl_Area.AreaId
			' + @lJoinSpecialitySql + '
			INNER JOIN
			(
				SELECT
					BTblBazdidResultCheckList.BazdidResultAddressId
				FROM
					BTblBazdidResultCheckList
					INNER JOIN BTblServiceCheckList ON BTblBazdidResultCheckList.BazdidResultCheckListId = BTblServiceCheckList.BazdidResultCheckListId
					INNER JOIN BTblService ON BTblServiceCheckList.ServiceId = BTblService.ServiceId
				' + @lWhereDT + '
			) AS Tbl_FilterDate ON BTblBazdidResultAddress.BazdidResultAddressId = Tbl_FilterDate.BazdidResultAddressId
		WHERE 
			BTblBazdidResult.BazdidStateId IN (2,3)
			AND BTblBazdidResult.BazdidTypeId = 3
			AND NOT BTbl_ServicePart.ServicePartId IS NULL
			AND Tbl_LPFeeder.IslightFeeder = ' + CAST(@lIsLight as varchar) + '
		' + @lAddress + @lWhere

	EXEC(@lSql)
GO