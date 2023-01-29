pipeline {
agent any
	environment () {
		domain_creds = credentials('sql_credentials') 
	}
     stages {
        stage('Copying files') {
	    steps {
                script {
	$mySession = New-PSSession -ComputerName 10.0.0.11 -Credential  $pipelineCred
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

