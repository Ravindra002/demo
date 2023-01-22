pipeline {
        agent any
        stages {
             stage ('dropdatabase') {
                   steps {
                         sh 'pwsh sql-servername.ps1'
                   }
              }     
           }
        }
