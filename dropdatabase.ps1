$SqlServer    = 'SQL-SERVER' # SQL Server instance (HostName\InstanceName for named instance)
$Database     = 'test'      # SQL database to connect to 
$SqlAuthLogin = 'ravi'          # SQL Authentication login
$SqlAuthPw    = 'Freak@502'     # SQL Authentication login password
#drop database
Try{
     Invoke-Sqlcmd -ServerInstance $SqlServer -U $SqlAuthLogin -P $SqlAuthPw -Query "Drop database $Database;"
}Catch{
      Write-Output 'Failed to delete database'
}