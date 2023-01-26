def job = env.JOB_BASE_NAME
def workspace = "C:/ProgramData/Jenkins/.jenkins/workspace/${job}"
ws("${workspace}") {
        stage ("clone directory") {
                git 'https://github.com/Ravindra002/demo.git'
        }
        stage ("transferring a file") {
                def result = powershell(returnStdout:true, script:'''
                remote = [:]
                remote.name = "instance-1"
                remote.host = "10.0.0.11"
                remote.allowAnyHosts = true
                remote.failOnError = true
                withCredentials([usernamePassword(credentialsId: 'sql_credentials', passwordVariable: 'localuser-password', usernameVariable: 'localuser')]) {
                        remote.user = $env:localuser
                        remote.password = $(env:localuser-password) | ConvertTo-SecureString -AsPlainText -Force
}
                $pipelineUser = $env:localuser
                $pipelinePass = 
                $pipelineCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $pipelineUser, $pipelinePass
                $MySession = New-PSSession -ComputerName 10.0.0.11 -Credential $pipelineCredential
                Copy-Item -path "$env:workspace/sqlserverupdate.ps1" -Destination C:/jenkins-copied-files/sqlserverupdate.ps1 -ToSession $MySession -Verbose -Force
                Remove-PSSession $MySession
                ''')
        echo result
        }
}

}
