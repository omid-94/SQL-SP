
--Maz--http://172.1�.50.103/TZHavades/Tavanir
SELECT * FROM Tbl_Config WHERE ConfigName LIKE '%Tozi%'


SELECT * FROM Tbl_AccessType

SELECT * FROM TblUserAccess

SELECT * FROM Tbl_User


---------------------------------------------------
SET IDENTITY_INSERT Tbl_AccessType ON
INSERT INTO Tbl_AccessType (AccessTypeId,AccessType, AccessTypeName)
  VALUES  (4,N'Monitoring', N'������� ������ �� ���������'),
          (5,N'ReportReliability', N'������� ����Ԑ��� ���� ��� ������ ������� '),
          (6,N'ReportKambood', N'������� ����Ԑ��� ����� ����� ���� �� ����'),
          (7,N'ReportSerghati', N'������� ����Ԑ��� ������� �����')
SET IDENTITY_INSERT Tbl_AccessType Off
