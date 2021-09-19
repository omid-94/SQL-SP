
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS c
  WHERE TABLE_NAME = 'TblUserOfflineStatus'
  AND COLUMN_NAME LIKE '%feeder%'


SELECT *, LEN(MediaData) FROM [TblMediaPart] ORDER BY 1 DESC

--TRUNCATE TABLE TblMediaPart

SELECT TOP 1 * FROM TblMedia ORDER BY 1 DESC
SELECT TOP 1 * FROM TblMediaHistory  ORDER BY 1 DESC


EXEC spGetChannelOfflineCount @UserId = 1

EXEC spGetUserOfflineCount @UserId = 5

EXEC spGetUsers @UserId = 1

EXEC spGetUserChannel @aUserId = 1



SELECT U.UserId , U.Username , U.UserNumber , U.DisplayName , U.IsActive FROM Tbl_User U
  INNER JOIN Tbl_UserChannel UC ON UC.UserId = U.UserId 
  WHERE UC.ChannelId = 1 
  ORDER BY U.username 