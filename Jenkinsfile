def job = env.JOB_BASE_NAME
def workspace = "~/workspace/${env.JOB_BASE_NAME}"
ws("${workspace}") {
stage ("Clone Directory") {
git 'https://github.com/Ravindra002/demo.git'
}
pipeline {
    agent any
    stages {
        stage('Copying files') {
                script {
                    def sqlservers = ['sql-server2', 'sql-server', 'jenkins-server']
                    for (sqlserver in sqlservers) {
			withCredentials([usernamePassword(credentialsId: 'sql_credentials', passwordVariable: 'localuser-password', usernameVariable: 'localuser')]) {
    def result = powershell (returnStdout :true, script:'''
	$pipelineUser = $env:localuser
	$pipelinePass = $env:(localuser-password) | ConvertTo-SecureString -AsPlainText -Force
	$pipelineCred = New-Object System.Management.Automation.PSCredential -ArgumentList $pipelineUser $pipelinePass
	$mySession = New-PSSession -ComputerName $sqlserver -Credential SpipelineCred
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
