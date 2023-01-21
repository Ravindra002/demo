# Load the SMO assembly 
[void][reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo"); 
$ServerName = "sql-server\sqlexpress"

#Get a server object which corresponds to the **default** instance 
$srv = New-Object -TypeName Microsoft.SqlServer.Management.SMO.Server $ServerName

Try{
    invoke-sqlcmd -ServerInstance "$ServerName" -U ravi -P Freak@502 -Query "Drop database test;"
}Catch{
      Write-Output 'Failed to delete database'
}
