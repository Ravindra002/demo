pipeline {
        agent any
        environment {
            SQL_CREDS=credentials('sql_credentials')
        }
        stages {
             stage ('dropdatabase') {
                   steps {
                         bat(script:'''
                                    $sqlserver =  new-object Microsoft.SqlServer.Management.Smo.Server( 'sql-server\sqlexpress')
                                    Invoke-SqlCmd -U $SQL_CREDS_USR -P $SQL_CREDS_PSD -ServerInstance $sqlserver -Query "Drop database test;"
                                 ''')
              }     
           }
        }
