def PowerShell(psCmd) {
    psCmd=psCmd.replaceAll("%", "%%")
    bat "powershell.exe -NonInteractive -ExecutionPolicy Bypass -Command \"\$ErrorActionPreference='Stop';[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$psCmd;EXIT \$global:LastExitCode\""
get-pssnapin -Registered
Import-Module “sqlps” -DisableNameChecking**
}
pipeline {
        agent any
        stages {
             stage ('servername') {
                   steps {
                          PowerShell(". '.\\sql-servername.ps1'") 
                   }
              } 
             stage ('dropdatabase') {
                   steps {
                          PowerShell(". '.\\dropdatabase.ps1'") 
                   }
              }
           }
        }
