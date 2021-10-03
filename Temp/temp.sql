
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS c
  WHERE TABLE_NAME = 'TblUserOfflineStatus'
  AND COLUMN_NAME LIKE '%feeder%'


SELECT *, LEN(MediaData) FROM [TblMediaPart] ORDER BY 1 DESC

--TRUNCATE TABLE TblMediaPart

SELECT TOP 1 * FROM TblMedia ORDER BY 1 DESC
SELECT TOP 1 * FROM TblMediaHistory  ORDER BY 1 DESC


EXEC spGetOfflineChannelMessages 0 ,1, 3,' AND H.MediaDateTime BETWEEN ''2021/03/27 12:00:00 AM'' AND ''2021/09/29 11:59:00 PM'' AND H.SourceUserId IN (5,28,1) AND M.IsOnlineVoice = 0 AND OffState.IsListen = 0',' INNER JOIN TblChannelOfflineStatus OffState ON(H.MediaId = OffState.MediaId AND OffState.UserId = 1)'

SELECT * FROM TblUserOfflineStatus WHERE MediaId = 1777

SELECT * FROM TblMedia
  INNER JOIN TblMediaHistory ON TblMedia.MediaId = TblMediaHistory.MediaId
  WHERE TblMedia.MediaId = 1446

TRUNCATE TABLE TblUserOfflineStatus

INSERT INTO TblUserOfflineStatus (MediaId, UserId, IsListen, DestUserId)
  SELECT H.MediaId, H.SourceUserId , CAST(0 AS BIT) , H.DestUserId 
    FROM TblMediaHistory H
    INNER JOIN TblMedia M ON H.MediaId = M.MediaId
  WHERE DestUserId IS NOT NULL AND M.IsOnlineVoice = 0


EXEC spGetUserMessages 0 ,5, 1,' AND H.MediaDateTime BETWEEN ''2021/03/21 12:00:00 AM'' AND ''2021/10/03 11:59:00 PM'' AND H.SourceUserId IN (5,28,1) AND M.IsOnlineVoice = 0 AND St.IsListen = 0','INNER'

EXEC spGetUserMessages 0 ,5, 1,' AND H.MediaDateTime BETWEEN ''2021/03/21 12:00:00 AM'' AND ''2021/10/03 11:59:00 PM'' AND H.SourceUserId IN (5,28,1) AND M.IsOnlineVoice = 1','left'
