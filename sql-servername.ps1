$sqlserver = '10.0.0.10'
$database = 'test'
Try{
    invoke-sqlcmd -ServerInstance "$sql-server" -U ravi -P Freak@502 -Query "Drop database $database;"
}Catch{
      Write-Output 'Failed to delete database'
}
