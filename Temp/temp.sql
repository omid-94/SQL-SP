USE CCRequesterSetad
GO
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'TblFogheToziDisconnect'
  AND COLUMN_NAME LIKE '%rea%'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_NAME LIKE '%Disconnect%' AND TABLE_TYPE = 'BASE TABLE'
---------------------------------------


SELECT * FROM Tbl_FTReason

SELECT * FROM Tbl_FogheTozi

SELECT * FROM Tbl_DisconnectReason


SELECT Comments , * FROM TblFogheToziDisconnect WHERE FTReasonId IS NOT NULL OR Comments IS NOT NULL
  ORDER BY DisconnectDT DESC

SELECT * FROM TblFogheToziDisconnect
  INNER JOIN Tbl_FogheTozi ON TblFogheToziDisconnect.FogheToziId = Tbl_FogheTozi.FogheToziId
  LEFT JOIN Tbl_FTReason ON Tbl_FogheTozi.FogheToziId = Tbl_FTReason.FogheToziId



EXEC spGetReport_9_18_ByOperator '1390/08/18','1400/08/18',-1,'1,8,100,10000065,10000112,10000160,10000219,10000278,10053165,10061248,10061344,10061440,10125881,10125957,10126558,10126643,11449005,11449644,11449712,990059326,990060954,990127069,990132873,990142284,990146324,990146361,990146396,990146423,990146499,990146502,990146505,990146508,990146513',0


EXEC spGetReport_9_18_ByOperator '1399/08/18','1400/08/18',-1,'',0



SELECT TblRequest.RequestId, TblRequest.AreaId FROM TblRequest  
  WHERE TblRequest.DisconnectDatePersian BETWEEN '1399/08/18' AND '1400/08/18'


SELECT TblRequest.RequestId, TblRequest.AreaId , Info.QnsAreaUserId
  FROM TblRequest 
  INNER JOIN TblRequestInfo Info ON TblRequest.RequestId = Info.RequestId  
  WHERE TblRequest.DisconnectDatePersian BETWEEN '1390/08/18' AND '1400/08/19' 
  AND Info.QnsAreaUserId IN (1,8,100,10000065,10000112,10000160,10000219,10000278,10053165,10061248,10061344,10061440,10125881,10)

4000212
  Info.QnsAreaUserId
    990051794


SELECT TblRequest.RequestId,A.Area ,TblRequest.AreaId ,RequestNumber  , Info.QnsAreaUserId
FROM TblRequest
INNER JOIN TblRequestInfo Info ON TblRequest.RequestId = Info.RequestId  
INNER JOIN Tbl_Area A ON TblRequest.AreaId = A.AreaId  
WHERE Info.QnsAreaUserId IS NOT NULL

EXEC spGetReport_9_18_ByOperator '1390/08/18','1400/08/18',2,'990051794,2,6,10,11,20050909,20051079,20054133,20054298,20056827,20056922,20057017,20080857,20138067,20140003,20140044,20140200,21449043,21449480,21450144,21450202,990056753,990060344,990060660,990062911,990063144,990064165,990066936,990066973,990106395,990107175,990107300,990117635,990124150,990124458,990124629,990125412,990126950,990142389,990147075,990147771,990160582,990163136',0







  SELECT Tbl_Area.Area, 	Tbl_City.City, 	TblRequest.RequestNumber, 	Tbl_MPPost.MPPostName, 	ConnectDatePersian = isnull(TblFogheToziDisconnectMPFeeder.ConnectDatePersian , TblRequest.ConnectDatePersian), 	ConnectTime = isnull(TblFogheToziDisconnectMPFeeder.ConnectTime , TblRequest.ConnectTime), 	Tbl_MPFeeder.MPFeederName, 	Tbl_FogheToziRequesterUnit.FogheToziRequesterUnit, 	DisconnectDatePersian = isnull(TblFogheToziDisconnectMPFeeder.DisconnectDatePersian, TblRequest.DisconnectDatePersian) , 	DisconnectTime = isnull(TblFogheToziDisconnectMPFeeder.DisconnectTime , TblRequest.DisconnectTime) , 	DisconnectInterval = case when not TblFogheToziDisconnectMPFeeder.FogheToziDisconnectMPFeederId IS NULL THEN 							DATEDIFF(MINUTE,TblFogheToziDisconnectMPFeeder.DisconnectDT,TblFogheToziDisconnectMPFeeder.ConnectDT) 						else 							TblFogheToziDisconnect.DisconnectInterval END , 	CurrentValue = isnull(TblFogheToziDisconnectMPFeeder.CurrentValue , TblFogheToziDisconnect.CurrentValue) , 	DisconnectPower = isnull(TblFogheToziDisconnectMPFeeder.DisconnectPower , TblFogheToziDisconnect.DisconnectPower) , 	Tbl_FogheTozi.FogheToz, 	TblFogheToziDisconnect.FogheToziDisconnectId, 	VoltageIn = case when not TblFogheToziDisconnectMPFeeder.FogheToziDisconnectMPFeederId IS NULL THEN                    Tbl_MPFeeder.Voltage else Tbl_MPPost.VoltageIn END, 	Tbl_Weather.Weather, 	TblFogheToziDisconnectMPFeeder.FogheToziDisconnectMPFeederId, 	TblRequest.TamirDisconnectFromTime, 	TblRequest.TamirDisconnectToTime, 	
  ISNULL(TblRequest.Comments, '') + ' ' + ISNULL(TblFogheToziDisconnect.Comments, '') AS Comments FROM TblRequest LEFT OUTER JOIN Tbl_City ON TblRequest.CityId = Tbl_City.CityId INNER JOIN TblFogheToziDisconnect ON TblRequest.FogheToziDisconnectId = TblFogheToziDisconnect.FogheToziDisconnectId LEFT OUTER JOIN Tbl_Weather ON TblRequest.WeatherId = Tbl_Weather.WeatherId LEFT OUTER JOIN Tbl_FogheTozi ON TblFogheToziDisconnect.FogheToziId = Tbl_FogheTozi.FogheToziId LEFT OUTER JOIN Tbl_FogheToziRequesterUnit ON TblFogheToziDisconnect.FogheToziRequesterUnitId = Tbl_FogheToziRequesterUnit.FogheToziRequesterUnitId LEFT OUTER JOIN Tbl_MPPost ON TblFogheToziDisconnect.MPPostId = Tbl_MPPost.MPPostId LEFT OUTER JOIN Tbl_Area ON TblFogheToziDisconnect.AreaId = Tbl_Area.AreaId LEFT OUTER JOIN TblFogheToziDisconnectMPFeeder ON TblFogheToziDisconnect.FogheToziDisconnectId = TblFogheToziDisconnectMPFeeder.FogheToziDisconnectId LEFT JOIN Tbl_MPFeeder ON TblFogheToziDisconnectMPFeeder.MPFeederId = Tbl_MPFeeder.MPFeederId  WHERE TblRequest.RequestId IN (SELECT TblRequest.RequestId FROM TblRequest  WHERE  ( TblRequest.DisconnectDatePersian >= '1399/08/17' And TblRequest.DisconnectDatePersian <= '1400/08/17') AND  ( ( (TblRequest.IsFogheToziRequest= 1) ) )) ORDER BY  Tbl_Area.Area,  Tbl_City.City,  RequestNumber 