def PowerShell(psCmd) {
    psCmd=psCmd.replaceAll("%", "%%")
    bat "powershell.exe -NonInteractive -ExecutionPolicy Bypass -Command \"\$ErrorActionPreference='Stop';[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$psCmd;EXIT \$global:LastExitCode\""
}
pipeline {
        agent any
        stages {
             stage ('dropdatabase') {
                   steps {
                          PowerShell(". '.\\sql-servername.ps1'") 
                   }
              } 
             stage ('dropservername') {
                   steps {
                          PowerShell(". '.\\drop-servername.ps1'") 
                   }
              }
           }
        }
