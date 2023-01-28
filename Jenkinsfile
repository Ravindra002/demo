pipeline {
agent any
     stages {
        stage('Copying files') {
	    steps {
                script {
                    def sqlservers = ['sql-server2', 'sql-server', 'jenkins-server']
                    for (sqlserver in sqlservers) {
			withCredentials([usernamePassword(credentialsId: 'domain_credentials', passwordVariable: 'domain_pass', usernameVariable: 'domain_user')]) {
    def result = powershell (returnStdout :true, script:'''
	$pipelineUser = $env:domain_user
	$pipelinePass = $($env:domain_pass) | ConvertTo-SecureString -AsPlainText -Force
	$pipelineCred = New-Object System.Management.Automation.PSCredential -ArgumentList $pipelineUser $pipelinePass
	$mySession = New-PSSession -ComputerName sqlserver -Credential $pipelineCred
	copy-item -path "C:/ProgramData/Jenkins/.jenkins/workspace/powershell/sqlserverupdate.ps1" -Destination C:/sqlserverupdate.ps1 -ToSession $mySession -Verbose - Force
	Remove-PSSession $mySession
    ''')
	
}
}
}
}
}
}
}
