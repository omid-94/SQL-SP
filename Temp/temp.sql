USE CCRequesterSetad
GO

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE 
    TABLE_NAME like '%tamirreq%' AND
    COLUMN_NAME LIKE '%MPFeederLimitDayId%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%access%' AND TABLE_TYPE = 'BASE TABLE'

--------------------------------------------------------------------------------------------------
SELECT * FROM Emergency.Tbl_MPFeederLimitDay

SELECT * FROM Emergency.Tbl_MPFeederLimitType 

SELECT * FROM Emergency.TblTiming 

SELECT * FROM Emergency.TblTimingMPFeeder

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



SELECT TOP 1 * FROM TblMPRequest 


/*--------------------RESET-------------------------

UPDATE Emergency.TblTimingMPFeeder SET ConnectDT = NULL, ConnectDatePersian = NULL , ConnectTime = NULL
  WHERE TimingMPFeederId IN (990188927,990188939,990188940)


UPDATE Emergency.TblTimingMPFeeder SET DisconnectDT = NULL, DisconnectDatePersian = NULL , DisconnectTime = NULL
  WHERE TimingMPFeederId IN (990188927,990188939,990188940)


*/

SELECT * FROM Tbl_FogheTozi WHERE FogheToziId NOT IN (5,9)


SELECT * FROM Emergency.Tbl_TimingState 