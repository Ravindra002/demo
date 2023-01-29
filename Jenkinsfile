pipeline {
agent any
     	stages {
        	stage('Copying files') {
			steps {
                		def result = powershell (returnStdout :true, script:''' 
                		$Password = $env:Password | ConvertTo-SecureString -AsPlainText -Force
				$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($env:User, $Password)
				$mySession = New-PSSession -ComputerName $env:Computer -Credential $Cred
				copy-item -path C:/ProgramData/Jenkins/.jenkins/workspace/powershell/sqlserverupdate.ps1 -Destination C:/Users/domain-admin/Desktop/sqlserverupdate.ps1 -ToSession $mySession -Verbose - Force
				Remove-PSSession $mySession
				''')
				echo result	
			}
		}
		stage('Update SQL SERVERNAME') {
			steps {
                		def result = powershell (returnStdout :true, script:'''
                		$Password = $env:Password | ConvertTo-SecureString -AsPlainText -Force
				$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($env:User, $Password)
				$mySession = New-PSSession -ComputerName $env:Computer -Credential $Cred
				Invoke-Command -Session $mySession -ScriptBlock { write-output "Invoking sqlserverupdate.ps1 on $env:ComputerName"
				. C:/Users/domain-admin/Desktop/sqlserverupdate.ps1 -Verbose
				}
				Remove-PSSession $mySession
				''')
				echo result	
			}
		}
	}
}
}
