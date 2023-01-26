def job = env.JOB_BASE_NAME
def workspace = "C:\.ProgramData\Jenkins\.jenkins\workspace\${job}"
ws("${workspace}") {
        stage ("clone directory") {
                git 'https://github.com/Ravindra002/demo.git'
        }
        stage ("transferring a file") {
                withCredentials([usernamePassword(credentialsId: 'sql_credentials', passwordVariable: 'localuser-password', usernameVariable: 'localuser')]) {
                def result = powershell(returnStdout:true, script:'''
                $pipelineUser = $env:localuser
                $pipelinePass = $(env:localuser-password) | ConvertTo-SecureString -AsPlainText -Force
                $pipelineCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $pipelineUser, $pipelinePass
                $MySession = New-PSSession -ComputerName instance-1 -Credential $pipelineCredential
                Copy-Item -path "$env:workspace\powershell\sqlserverupdate.ps1" -Destination C:\jenkins-copied-files\sqlserverupdate.ps1 -ToSession $MySession -Verbose -Force
                }
                Remove-PSSession $MySession
                ''')
        echo result
        }
}
