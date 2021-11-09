ALTER PROCEDURE dbo.spGetReport_8_24 @aFromPeakDatePersian AS VARCHAR(50)
	,@aToPeakDatePersian AS VARCHAR(50)
	,@aPeakTime AS VARCHAR(10)
	,@aAreaIds AS VARCHAR(1000)
	,@aMPPostIds AS INT
	,@aMPFeederId AS INT
	,@aIsActive AS INT
	,@aOwnershipId AS INT
AS
BEGIN
	DECLARE @lWhere AS VARCHAR(2000)
	DECLARE @lSQL AS VARCHAR(4000)
	SET @lSQL = ''
	SET @lWhere = ''
	
	IF @aAreaIds <> ''
		SET @lWhere += ' AND Tbl_MPFeeder.AreaId IN (' + @aAreaIds + ')'
	IF @aMPPostIds <> ''
		SET @lWhere += ' AND Tbl_MPPost.MPPostId IN (' + @aMPPostIds + ')'
	IF @aMPFeederId > -1
		SET @lWhere += ' AND Tbl_MPFeeder.MPFeederId = ' + cast(@aMPFeederId as varchar(20))
	IF @aIsActive > -1
		SET @lWhere += ' AND Tbl_MPPost.IsActive = ' + cast(@aIsActive as varchar(20))
	IF @aOwnershipId > -1
		SET @lWhere += ' AND Tbl_MPPost.MPPostOwnershipId = ' + cast(@aOwnershipId as varchar(20))
	
	
	IF @aPeakTime = '' AND @aFromPeakDatePersian <> ''
		SET @lWhere += ' AND Tbl_MPFeederLoad.RelDatePersian >= ''' + @aFromPeakDatePersian + ''''
	IF @aPeakTime = '' AND @aToPeakDatePersian <> ''
		SET @lWhere += ' AND Tbl_MPFeederLoad.RelDatePersian <= ''' + @aToPeakDatePersian + ''''
	IF @aPeakTime <> '' AND @aFromPeakDatePersian <> ''
		SET @lWhere += ' AND Tbl_MPFeederLoad.RelDatePersian = ''' + @aFromPeakDatePersian + ''''
				+ ' AND Tbl_MPFeederLoadHours.HourExact = ''' + @aPeakTime + ''''
	
	IF @lWhere <> ''
		SET @lWhere = RIGHT(@lWhere, LEN(@lWhere) - 4)
	SET @lSQL = 'SELECT 
		Tbl_MPPost.MPPostId,
		Tbl_MPFeeder.MPFeederId, 
		Tbl_MPFeeder.AreaId,
		Tbl_Area.Area,
		Tbl_MPFeederLoad.MPFeederLoadId, 
		Tbl_MPPost.MPPostOwnershipId,
		Tbl_MPFeederLoadHours.MPFeederLoadHourId,
		Tbl_MPFeeder.MPFeederName,
		Tbl_MPPost.MPPostName,
		Tbl_MPFeederLoad.RelDatePersian AS LoadDatePersian, 
		Tbl_Hour.HourId, 
		Tbl_Hour.[Hour],
		Tbl_MPFeederLoadHours.HourExact, 
		Tbl_MPPost.IsActive,
		ROUND(ISNULL(Tbl_MPFeederLoadHours.CurrentValue,0) , 2) AS CurrentValue, 
		ROUND(ISNULL(Tbl_MPFeederLoadHours.CurrentValueReActive,0) , 2) AS CurrentValueReActive, 
		Tbl_MPFeederLoadHours.PowerValue
		FROM Tbl_MPFeeder
		INNER JOIN Tbl_MPPost ON Tbl_MPFeeder.MPPostId = Tbl_MPPost.MPPostId 
		LEFT OUTER JOIN Tbl_MPFeederLoad ON Tbl_MPFeeder.MPFeederId = Tbl_MPFeederLoad.MPFeederId
		INNER JOIN Tbl_MPFeederLoadHours ON Tbl_MPFeederLoad.MPFeederLoadId = Tbl_MPFeederLoadHours.MPFeederLoadId
		LEFT JOIN Tbl_Hour ON Tbl_MPFeederLoadHours.HourId = Tbl_Hour.HourId
		LEFT JOIN Tbl_Area ON Tbl_MPFeeder.AreaId = Tbl_Area.AreaId
		WHERE' + @lWhere + 
    ' ORDER BY  Tbl_MPFeeder.MPFeederId , Tbl_MPFeederLoad.RelDate DESC'
  EXEC(@lSQL)
END
GO