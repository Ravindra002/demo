def job = env.JOB_BASE_NAME
def workspace = "~/workspace/${env.JOB_BASE_NAME}"
pipeline {
agent any
     stages {
		stage('Clone git') {
			steps {
				git branch: 'main',
				url: 'https://github.com/Ravindra002/demo.git'
			}
		}
        stage('Get the SysInfo') {
			steps {
				script {
				withCredentials([usernamePassword(credentialsId: 'domain_credentials', passwordVariable: 'Pass', usernameVariable: 'User')]) {
                def result = powershell(returnStdout :true, script:''' 
				$nodes = Get-Content -Path "$env:workspace/serverList.txt"
				foreach($node in $nodes) {
				$Username = $env:User 
                		$Password = $($env:Pass) | ConvertTo-SecureString -AsPlainText -Force
				$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($Username, $Password)
				$mySession = New-PSSession -ComputerName $node -Credential $Cred
				Invoke-Command -Session $mySession -ScriptBlock {Get-ComputerInfo -Property "OsName" | Format-Table } 
				}
				''')
				echo result	
				}
			}
		}
	}
}
}
