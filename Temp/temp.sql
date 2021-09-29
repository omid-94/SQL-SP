
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS c
  WHERE TABLE_NAME = 'TblMedia'
  AND COLUMN_NAME LIKE '%feeder%'


SELECT *, LEN(MediaData) FROM [TblMediaPart] ORDER BY 1 DESC

--TRUNCATE TABLE TblMediaPart

SELECT TOP 1 * FROM TblMedia ORDER BY 1 DESC
SELECT TOP 1 * FROM TblMediaHistory  ORDER BY 1 DESC


EXEC spGetOfflineChannelMessages 0 ,1, 3,' AND H.MediaDateTime BETWEEN ''2021/03/27 12:00:00 AM'' AND ''2021/09/29 11:59:00 PM'' AND H.SourceUserId IN (5,28,1) AND M.IsOnlineVoice = 0 AND OffState.IsListen = 0',' INNER JOIN TblChannelOfflineStatus OffState ON(H.MediaId = OffState.MediaId AND OffState.UserId = 1)'