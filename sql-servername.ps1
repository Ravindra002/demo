function SqlQuery($server, $database, $query)
{
 $connection = New-Object System.Data.SqlClient.SqlConnection
 $connection.ConnectionString = "Server=$server;Database=$database;Integrated Security=True;"
 $connection.Open()
 $command = $connection.CreateCommand()
 $command.CommandText = $query
 $result = $command.ExecuteReader()
 $table = new-object “System.Data.DataTable”
 $table.Load($result)
 $connection.Close()
 return $table
}

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
Sqlquery $SqlServer -U $SqlAuthLogin -P $SqlAuthPw "$Query" | Format-Table
