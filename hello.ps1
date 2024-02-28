$RemoteComputer = "192.168.1.9"
$ComputerName = (Get-WmiObject -Class Win32_ComputerSystem -ComputerName $RemoteComputer).Name
Write-Host "Computer name for $RemoteComputer $computerName"


#Read more: https://www.sharepointdiary.com/2020/10/how-to-get-the-computer-name-in-powershell.html#ixzz8T0aYWubY
