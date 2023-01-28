pipeline {
agent any
     stages {
        stage('Copying files') {
	    steps {
                script {
                    def sqlservers = ['sql-server2', 'sql-server', 'jenkins-server']
                    for (sqlserver in sqlservers) {
			withCredentials([usernamePassword(credentialsId: 'domain_credentials', passwordVariable: 'domain-pass', usernameVariable: 'domain-user')]) {
    def result = powershell (returnStdout :true, script:'''
	$pipelineUser = $env:domain-user
	$pipelinePass = $env:(domain-pass) | ConvertTo-SecureString -AsPlainText -Force
	$pipelineCred = New-Object System.Management.Automation.PSCredential -ArgumentList $pipelineUser $pipelinePass
	$mySession = New-PSSession -ComputerName sqlserver -Credential SpipelineCred
	copy-item -path "$env:workspace/sqlserverupdate.ps1" -Destination d:/sqlserverupdate.ps1 -ToSession $mySession -Verbose - Force
	Remove-PSSession $mySession
    ''')
	
}
}
}
}
}
}
}
