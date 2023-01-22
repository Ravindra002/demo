pipeline {
        agent any
        stages {
             stage ('dropdatabase') {
                   steps {
                         bat 'pwsh sql-servername.ps1'
                   }
              }     
           }
        }
