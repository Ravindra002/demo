pipeline {
        agent any
        stages {
             stage ('dropdatabase') {
                   steps {
                         bat 'pwsh sql-server.ps1'
                   }
              }     
           }
        }
