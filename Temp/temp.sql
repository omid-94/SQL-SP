EXEC [Homa].[spGetOnCall] -1,-1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,99'

EXEC [Homa].[GetTrace] 9900000000000043,9900000000047792,-1

--SELECT * FROM Homa.TblTrace 

SELECT TOP 10 * FROM Tbl_Area

EXEC homa.spGetTrace @OnCallId = 0
                    ,@StartDT = '2021-08-03 11:07:55.812'
                    ,@EndDT = '2021-08-03 11:07:55.813'

EXEC [Homa].[spGetOnCall] 19606166,-1,'2,3'

EXEC [Homa].[spGetOnCall] -1,-1,'2,3'

EXEC [Homa].[spGISGetRequest] -1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,99'

SELECT * FROM Homa.TblJob

SELECT * FROM Homa.TblOnCall 

SELECT * FROM TblRequest 
  WHERE DisconnectDatePersian BETWEEN '1384/05/23' AND '1384/05/27'

USE CCRequesterSetad
GO
EXEC Homa.spGetOnCall @CheckSum = 0
                     ,@aRequestId = 0
                     ,@Areas = ''

EXEC Homa.spGetOnCall  -1,9900000000001421, -1 , -1 ,'' ,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,99'

EXEC  Homa.spTraceArea @StartDate = ''
                        ,@EndDate = ''
                        ,@StartTime = ''
                        ,@EndTime = ''
                        ,@AreaId = 0

EXEC Homa.spReportOnCallSummary '1400/04/13', 2



  EXEC Homa.spTraceRequest '1400/04/13','1400/04/13','11:43','11:44',2,'20050975','16','2'

    SELECT * FROM ViewMonitoringEx WHERE requestId IN (-1)