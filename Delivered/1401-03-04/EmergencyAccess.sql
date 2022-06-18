/*--------------<SysObject>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_SysObj WHERE SysObjId = 37) 
	INSERT INTO Tbl_SysObj (SysObjId , SysObj) VALUES (37 ,N'������ ������� ���')
ELSE
	UPDATE Tbl_SysObj SET SysObj=N'������ ������� ���'WHERE SysObjId = 37
GO
/*--------------</SysObject>----------------------*/

/*-------------------------------------------------------------------------------------------------------------------------------*/
/*--------------<Access 01: EmergencyBaseInfo>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_FormObject WHERE FormObjectId = 4000) 
	INSERT INTO Tbl_FormObject (FormObjectId,Tag,PersianTag,SysObjId) VALUES (4000,N'EmergencyBaseInfo',N'������� ��� � ����� ������� ����',37)
ELSE
	UPDATE Tbl_FormObject SET Tag=N'EmergencyBaseInfo',PersianTag=N'������� ��� � ����� ������� ����',SysObjId=37 WHERE FormObjectId=4000
GO

IF NOT EXISTS (SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId = 4000)
	INSERT Tbl_FormObjectApplication (FormObjectApplicationId,ApplicationId,FormObjectId) VALUES (4000,1,4000)
ELSE
	UPDATE Tbl_FormObjectApplication SET FormObjectApplicationId = 4000,ApplicationId = 1,FormObjectId = 4000 WHERE FormObjectApplicationId = 4000
GO
/*--------------</Access>-----------------------------------*/
/*--------------<Access 02: EmergencyRepeatPlan>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_FormObject WHERE FormObjectId = 4001) 
	INSERT INTO Tbl_FormObject (FormObjectId,Tag,PersianTag,SysObjId) VALUES (4001,N'EmergencyRepeatPlan',N'������� ʘ��� ������ ������',37)
ELSE
	UPDATE Tbl_FormObject SET Tag=N'EmergencyRepeatPlan',PersianTag=N'������� ʘ��� ������ ������',SysObjId=37 WHERE FormObjectId=4001
GO

IF NOT EXISTS (SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId = 4001)
	INSERT Tbl_FormObjectApplication (FormObjectApplicationId,ApplicationId,FormObjectId) VALUES (4001,1,4001)
ELSE
	UPDATE Tbl_FormObjectApplication SET FormObjectApplicationId = 4001,ApplicationId = 1,FormObjectId = 4001 WHERE FormObjectApplicationId = 4001
GO
/*--------------</Access>-----------------------------------*/
/*--------------<Access 03: EmergencyMonitoringNewPlanSave>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_FormObject WHERE FormObjectId = 4002) 
	INSERT INTO Tbl_FormObject (FormObjectId,Tag,PersianTag,SysObjId) VALUES (4002,N'EmergencyMonitoringNewPlanSave',N'������� ����� � ����� ������ ������',37)
ELSE
	UPDATE Tbl_FormObject SET Tag=N'EmergencyMonitoringNewPlanSave',PersianTag=N'������� ����� � ����� ������ ������',SysObjId=37 WHERE FormObjectId=4002
GO

IF NOT EXISTS (SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId = 4002)
	INSERT Tbl_FormObjectApplication (FormObjectApplicationId,ApplicationId,FormObjectId) VALUES (4002,1,4002)
ELSE
	UPDATE Tbl_FormObjectApplication SET FormObjectApplicationId = 4002,ApplicationId = 1,FormObjectId = 4002 WHERE FormObjectApplicationId = 4002
GO
/*--------------</Access>-----------------------------------*/
  /*--------------<Access 04: EmergencyMonitoringNewPlanConfirm>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_FormObject WHERE FormObjectId = 4003) 
	INSERT INTO Tbl_FormObject (FormObjectId,Tag,PersianTag,SysObjId) VALUES (4003,N'EmergencyMonitoringNewPlanConfirm',N'������� ����� ������ ������ � ����� ������',37)
ELSE
	UPDATE Tbl_FormObject SET Tag=N'EmergencyMonitoringNewPlanConfirm',PersianTag=N'������� ����� ������ ������ � ����� ������',SysObjId=37 WHERE FormObjectId=4003
GO

IF NOT EXISTS (SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId = 4003)
	INSERT Tbl_FormObjectApplication (FormObjectApplicationId,ApplicationId,FormObjectId) VALUES (4003,1,4003)
ELSE
	UPDATE Tbl_FormObjectApplication SET FormObjectApplicationId = 4003,ApplicationId = 1,FormObjectId = 4003 WHERE FormObjectApplicationId = 4003
GO
/*--------------</Access>-----------------------------------*/
/*--------------<Access 05: EmergencyMonitoringChangeState>----------------------*/
IF NOT EXISTS (SELECT * FROM Tbl_FormObject WHERE FormObjectId = 4004) 
	INSERT INTO Tbl_FormObject (FormObjectId,Tag,PersianTag,SysObjId) VALUES (4004,N'EmergencyMonitoringChangeState',N'������� ����� ����� ������ ������',37)
ELSE
	UPDATE Tbl_FormObject SET Tag=N'EmergencyMonitoringChangeState',PersianTag=N'������� ����� ����� ������ ������',SysObjId=37 WHERE FormObjectId=4004
GO

IF NOT EXISTS (SELECT * FROM Tbl_FormObjectApplication WHERE FormObjectApplicationId = 4004)
	INSERT Tbl_FormObjectApplication (FormObjectApplicationId,ApplicationId,FormObjectId) VALUES (4004,1,4004)
ELSE
	UPDATE Tbl_FormObjectApplication SET FormObjectApplicationId = 4004,ApplicationId = 1,FormObjectId = 4004 WHERE FormObjectApplicationId = 4004
GO
/*--------------</Access>-----------------------------------*/