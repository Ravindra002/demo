$Database     = 'test'      # SQL database to connect to 
$SqlAuthLogin = 'ravi'          # SQL Authentication login
$SqlAuthPw    = 'Freak@502'     # SQL Authentication login password
#drop database

$sqlservers = Get-Content -Path "C:\Users\ravi\Desktop\sql-servers.txt"
Foreach($server in $sqlservers) {
Invoke-Sqlcmd -ServerInstance $server -U $SqlAuthLogin -P $SqlAuthPw -Query "Drop database $Database;"
}

