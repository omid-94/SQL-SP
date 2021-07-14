--------old 
exec [Homa].[GetTrace] 9900000000000042,0,-1
----------------
EXEC Homa.spTraceArea '' ,'' ,'' ,'' ,0
EXEC Homa.spTraceMaster '' ,'' ,'' ,'' ,0
EXEC Homa.spTraceTablet '' ,'' ,'' ,'' ,0



EXEC Homa.spTraceRequest '' ,'' ,'' ,'' ,0 ,'' ,'16,990000011,20054106' ,''

SELECT TOP 10 tj.RequestId , tt.* FROM Homa.TblJob tj
  INNER JOIN Homa.TblEkipStartMove tesm ON tesm.JobId = tj.JobId
  INNER JOIN Homa.TblTrace tt ON tt.JobId = tesm.JobId
  WHERE tt.TraceDatePersian = tesm.StartMoveDatePersian
    --AND tt.TraceTime = tesm.StartMoveTime

SELECT TOP 10 * FROM Homa.TblTrace tt


EXEC Homa.spTraceRequest '' ,'' ,'' ,'' ,0,'' ,'16,990000011' ,''

EXEC Homa.spTraceRequest '' ,'' ,'' ,'' ,0,'' ,'' ,''

EXEC Homa.spOmidInfo

EXEC spOmidTest

EXEC Homa.spGetTrace @OnCallId = 9900000000000037
                    ,@StartDT = '2021/06/27 8:53:39.000 AM'
                    ,@EndDT = '2021/06/27 9:30:22.000 AM'

EXEC Homa.spGetNearTrace @OnCallId = 9900000000000038
                        ,@DT = '2021-07-12 13:54:22.654'

EXEC Homa.spOnCallIfo 9900000000000019


EXEC  Homa.spGetStateTrace @RequestId = 9900000000001421,
                           @OnCallId = 9900000000000038
  --------------------------------------------------------------------------------------------------------------------
EXEC Homa.spOnCallInfo  9900000000000037

EXEC Homa.spTraceOnCall '1400/04/06' ,'1400/04/06' ,'00:00' ,'23:59' ,0,'' ,'' ,''

EXEC Homa.spGetTrace 9900000000000037,'2021/06/27 12:00:00 AM','2021/06/27 12:00:00 AM'

EXEC Homa.spGetStateTrace 9900000000001410,9900000000000037

SELECT  OnCallId, TraceDatePersian FROM Homa.TblTrace
  GROUP BY OnCallId ,TraceDatePersian
  ORDER BY TraceDatePersian DESC

EXEC Homa.spGetStateTrace 9900000000001421,9900000000000038