#$SqlServer    = 'SQL-SERVER' # SQL Server instance (HostName\InstanceName for named instance)
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
$sqlservers = Get-Content -Path "C:\Users\ravi\Desktop\sql-servers.txt"
Foreach($server in $sqlservers) {
Invoke-Sqlcmd -ServerInstance $server -U $SqlAuthLogin -P $SqlAuthPw -Query $Query | Format-Table
}
