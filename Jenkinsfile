pipeline {
        agent any
        environment {
                SQL_CREDS=credentials('sql_credentials')
        }
        stages {
             stage ('dropdatabase') {
                   steps {
                         bat 'pwsh invoke-sqlcmd -ServerInstance "sql-server" -U $SQL_CREDS_USR -P $SQL_CREDS_PSD -Query "Drop database test;"'
                   }
              }     
           }
        }
