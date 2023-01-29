pipeline {
agent any
	environment () {
		domain_creds = credentials('sql_credentials') 
	}
     stages {
        stage('Copying files') {
	    steps {
                script {
	$pipelineCred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($domain_creds_USR, $domain_creds_PSW)
	$mySession = New-PSSession -ComputerName sql-server2 -Credential  $pipelineCred
	Invoke-Command -Session $mySession -ScriptBlock { write-output "Invoking sqlserverupdare.ps1 on $env:ComputerName"
	C:/Users/domain-admin/Desktop/sqlserverupdate.ps1 -Verbose
	}
	Remove-PSSession $mySession
	''')
	echo result	
}
}
}
}
}

