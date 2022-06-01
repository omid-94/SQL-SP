USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    TABLE_NAME like '%TblRequestCommon%' 
    AND TABLE_SCHEMA = 'Homa'
    AND COLUMN_NAME LIKE '%group%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%access%' AND TABLE_TYPE = 'BASE TABLE'

--------------------------------------------------------------------------------------------------
SELECT * FROM Emergency.Tbl_MPFeederLimitDay

SELECT * FROM Emergency.Tbl_MPFeederLimitType 

SELECT * FROM Emergency.TblTiming

  
SELECT * FROM Emergency.Tbl_TimingState 


SELECT * FROM Emergency.TblTimingMPFeeder WHERE TimingId = 990000009


SELECT * FROM Emergency.Tbl_GroupMPFeeder 

SELECT * FROM Emergency.Tbl_MPFeederTemplate WHERE GroupMPFeederId = 990188852

SELECT * FROM Tbl_EndJobState 
--------------------------------------------------------------------------------------------------

EXEC Emergency.spGetFeederGroupPlanRaw @aGroupMPFeederId = 990188852

EXEC Emergency.spGetFeederGroupPlan 990188852,990188894
-------------------------------------------------------


EXEC spGetMPPosts_v2 @aAreaId = 2
                    ,@IsAll = 0
                    ,@aWhereClause = ''
                    ,@aWhereClauseOR = ''

EXEC spGetMPFeeders_v2 @aAreaId = 2
                      ,@aMPPostId = 5
                      ,@IsAll = 0

---------------------------------------------------------

EXEC Emergency.spGetMPFeederTiming @aTiminigId = 990188926


SELECT * FROM BTbl_Holiday

EXEC Emergency.spGetFeederGroupTiming @aGroupMPFeederIds = ''
                                     ,@aFromDate = '1401/01/20'
                                     ,@aFromTime = '24:00'
                                     ,@aToDate = '1401/03/01'
                                     ,@aToTime = '12:00' 

EXEC Emergency.spGetFeederGroupTiming '','1401/02/21','00:00','1401/02/21','23:59'



--DELETE FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId >= 4000


SELECT * FROM Tbl_FormObject  WHERE FormObjectId >= 4000

SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId >= 4000


SELECT * FROM Tbl_SysObj 


EXEC Emergency.spGetFeederGroupPlan 990188955,-1


SELECT * FROM TblMPFeederPeak

--------------------------------------------------------
------------------------STATUS--------------------------
--------------------------------------------------------


SELECT * FROM Meter.Tbl_Kontor

DECLARE @aPersianDate AS VARCHAR(10) = '1401/03/10'

SELECT HourlyMeterValueId ,CONVERT(VARCHAR(5),CAST(MeterTime AS TIME),108) AS Time ,ROUND(ISNULL(Power_Active_Total,0), 2) AS Power_Active_Total
FROM Meter.TblHourlyMeterValue 
WHERE MeterTime BETWEEN dbo.ShamsiDateTimeToMiladi(@aPersianDate , '00:00') AND dbo.ShamsiDateTimeToMiladi(@aPersianDate, '23:59')
ORDER BY MeterTime ASC


SELECT * FROM Meter.TblMeterValue 
SELECT * FROM Meter.TblHourlyMeterValue 


SELECT COUNT(*) , ToolId FROM Meter.Tbl_Kontor
  GROUP BY  ToolId

SELECT *, CASE WHEN ToolTypeId = 4 THEN 'فيدر'
          	WHEN ToolTypeId = 1 THEN 'ترانس'
            ELSE 'نامشخص'
          END AS ToolType FROM Meter.Tbl_Kontor 
