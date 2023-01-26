$ErrorActionPreference = "Stop"
$ServerName = "instance-1"


function UpdateSQLServerName([String]$Hostname)
{
 
try

  {
	$QueryToGetServerName = "Select COALESCE (@@SERVERNAME, SERVERPROPERTY ('ServerName'), SERVERPROPERTY ('MachineName') , SERVERPROPERTY ('InstanceName')) as ServerInstance"
	$ServerName = invoke-sqlcmd -query $QueryToGetServerName -ServerInstance $Hostname
	$ServerInstance = $ServerName.ServerInstance

	if ($Hostname -ne $ServerInstance ) {

		Write-Output "Changing the Server name on SQL server from: $ServerInstance to $Hostname"

		$changehostname = "sp_dropserver '$ServerInstance';
	 GO
	 sp_addserver '$Hostname', local;
	 GO"
		invoke-sqlcmd -ServerInstance $Hostname -Query $changehostname -Database master
        Start-Sleep -Seconds 2

        Write-Output "Restarting SQL Server"
		Restart-Service -Name MSSQLSERVER -Force
		Start-Sleep -Seconds 10
		Start-Service -Name SQLSERVERAGENT
    }
	Else {
		Write-Output "Server name on SQL Server $Hostname is already correct"
    
    }
    }
	catch
	{
		$msg = "Line {0}, Pos {1} - {2}" -f $_.InvocationInfo.ScriptlineNumber, $_.InvocationInfo.OffsetInLine, $_.Exception.Message;
		Write-Output $msg -Level Error;
		throw $_;
    }
}  

UpdateSQLServerName $ServerName
