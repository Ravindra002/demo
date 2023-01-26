#def PowerShell(psCmd) {
#    psCmd=psCmd.replaceAll("%", "%%")
#    bat "powershell.exe -NonInteractive -ExecutionPolicy Bypass -Command \"\$ErrorActionPreference='Stop';[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$psCmd;EXIT \$global:LastExitCode\""

def job = env.JOB_BASE_NAME
def workspace = "C:\C:\ProgramData\Jenkins\.jenkins\workspace\${job}"
ws("${workspace}") {
        stage ("clone directory") {
                git 'https://github.com/Ravindra002/demo.git'
        }
        stage ("transferring a file") {
                withCredentials([usernamePassword(credentialsId: 'sql_credentials', passwordVariable: 'localuser-password', usernameVariable: 'localuser')]) {
                def result = PowerShell(returnStdout:true, script:'''
                $pipelineUser = $env:localuser
                $pipelinePass = $(env:localuser-password) | ConvertTo-SecureString -AsPlainText -Force
                $pipelineCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $pipelineUser, $pipelinePass
                $MySession = New-PSSession -ComputerName instance-1 -Credential $pipelineCredential
                Copy-Item -path "$env:workspace\powershell\" -Destination C:\ -ToSession $MySession -Verbose -Force
                }
                Remove-PSSession $MySession
                ''')
        echo result
        }
}
