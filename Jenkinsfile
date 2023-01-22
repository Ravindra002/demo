pipeline {
        agent any
        stages {
             stage ('dropdatabase') {
                   steps {
                          PowerShell(". '.sql-servername.ps1'") 
                   }
              }     
           }
        }
