EXEC [Homa].[spGetOnCall] -1,-1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,99'

EXEC [Homa].[GetTrace] 9900000000000043,9900000000047792,-1

--SELECT * FROM Homa.TblTrace 

SELECT TOP 10 * FROM Tbl_Area



EXEC [Homa].[spGetOnCall] 19606166,-1,'2,3'

EXEC [Homa].[spGetOnCall] -1,-1,'2,3'

EXEC [Homa].[spGISGetRequest] -1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,99'