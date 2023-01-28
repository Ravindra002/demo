pipeline {
agent any
     stages {
        stage('Copying files') {
	    steps {
                script {
                    def sqlservers = ['sql-server2', 'sql-server']
                    for (sqlserver in sqlservers) {
			withCredentials([usernamePassword(credentialsId: 'domain_credentials', passwordVariable: 'domain_pass', usernameVariable: 'domain_user')]) {
    def result = powershell (returnStdout :true, script:'''
	$pipelineUser = $env:domain_user
	$pipelinePass = $($env:domain_pass) | ConvertTo-SecureString -AsPlainText -Force
	$pipelineCred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $pipelineUser $pipelinePass
	$mySession = New-PSSession -ComputerName sqlserver -Credential $pipelineCred
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
}
}
