$InstanceIP   = '10.0.0.10' # SQL Server Name
$SqlServer    = '10.0.0.10' # SQL Server instance (HostName\InstanceName for named instance)
$Database     = 'test'      # SQL database to connect to 
$SqlAuthLogin = 'ravi'            # SQL Authentication login
$SqlAuthPw    = 'Freak@502'     # SQL Authentication login password
$Query1 = '
sp_helpserver
select @@servername
'
$Query2 = '
sp_dropserver 'sql-server'
go
sp_addserver 'testing','local'
go
'
#Get the existing servername
Invoke-Sqlcmd -ServerInstance $SqlServer -U $SqlAuthLogin -P $SqlAuthPw -Query $Query1

#Change the servername
Invoke-Sqlcmd -ServerInstance $SqlServer -U $SqlAuthLogin -P $SqlAuthPw -Query $Query2

#Restart the SQL Service
Invoke-Command -Computername $InstanceIP -Scriptblock {Stop-Service -Name 'MSSQL$SQLEXPRESS'}
Invoke-Command -Computername $InstanceIP -Scriptblock {Start-Service -Name 'MSSQL$SQLEXPRESS'}