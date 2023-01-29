pipeline {
agent any
     stages {
        stage('Copying files') {
			steps {
				script {
                		def result = powershell (returnStdout :true, script:''' 
                		$Password = $env:Password | ConvertTo-SecureString -AsPlainText -Force
				$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($env:User, $Password)
				$mySession = New-PSSession -ComputerName $env:Computer -Credential $Cred
				Copy-Item -path 'd:/Jenkins/sqlserverupdate.ps1' -Destination c:/Users/domain-admin/Desktop/sqlserverupdate.ps1 -ToSession $mySession -Verbose - Force
				Remove-PSSession $mySession
				''')
				echo result	
			}
		}
	}
			stage('Update SQL SERVERNAME') {
			steps {
				script {
                		def result = powershell (returnStdout :true, script:'''
                		$Password = $env:Password | ConvertTo-SecureString -AsPlainText -Force
				$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($env:User, $Password)
				$mySession = New-PSSession -ComputerName $env:Computer -Credential $Cred
				Invoke-Command -Session $mySession -ScriptBlock { write-output "Invoking sqlserverupdate.ps1 on $env:ComputerName"
				. c:/Users/domain-admin/Desktop/sqlserverupdate.ps1 -Verbose
				}
				Remove-PSSession $mySession
				''')
				echo result	
			}
		}
	}
}
}
