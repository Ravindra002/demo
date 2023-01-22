$SqlServer    = 'SQL-SERVER' # SQL Server instance (HostName\InstanceName for named instance)
$Database     = 'test'      # SQL database to connect to 
$SqlAuthLogin = 'ravi'          # SQL Authentication login
$SqlAuthPw    = 'Freak@502'     # SQL Authentication login password
# query to show changes
$Query = '
SELECT @@SERVERNAME AS [ServerName]
    , des.login_name
    , DB_NAME()   AS [DatabaseName]
    , dec.net_packet_size
    , @@LANGUAGE  AS [Language]
    , des.program_name
    , des.host_name
FROM sys.dm_exec_connections dec
JOIN sys.dm_exec_sessions des ON dec.session_id = des.session_id
WHERE dec.session_id = @@SPID
'

# sql authentication without database name
 Invoke-Sqlcmd -ServerInstance $SqlServer -U $SqlAuthLogin -P $SqlAuthPw -Query $Query | Format-Table

#drop database
Try{
     Invoke-Sqlcmd -ServerInstance $SqlServer -U $SqlAuthLogin -P $SqlAuthPw -Query "Drop database $Database;"
}Catch{
      Write-Output 'Failed to delete database'
}
