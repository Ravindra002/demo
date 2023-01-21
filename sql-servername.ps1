$sqlserver = 'sql-server\SQLEXPRESS'
$database = 'test'
Try{
    SQLCMD -U ravi -P Freak@502 -ServerInstance "$sqlserver" -Query "Drop database $database;"
}Catch{
      Write-Output 'Failed to delete database'
}
