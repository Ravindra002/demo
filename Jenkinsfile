pipeline {
        agent any
        environment {
            SQL_CREDS=credentials('sql_credentials')
        }
        stages {
             stage ('dropdatabase') {
                   steps {
                         bat(script:'''
                                    Invoke-SqlCmd -U $SQL_CREDS_USR -P $SQL_CREDS_PSD -ServerInstance sql-server\SQLEXPRESS -Query "Drop database test;"
                                 ''')
              }     
           }
        }
