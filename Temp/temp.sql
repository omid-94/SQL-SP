SELECT * FROM sys.sysconfigures s
----------
SELECT * FROM sys.sysdatabases s
EXEC sp_helpdb
----------
select * from sys.syslogins;
------------
select * from sys.sysusers;
-----Resource DB-------
SELECT SERVERPROPERTY('ResourceVersion');  
SELECT SERVERPROPERTY('ResourceLastUpdateDateTime');  
SELECT OBJECT_DEFINITION(OBJECT_ID('sys.objects'));  
SELECT * FROM sys.sysaltfiles
