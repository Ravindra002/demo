pipeline {
        agent any
  stages {
    stage ('version') {
      steps {
          sh 'pwsh --version'
              stage ('drop the database') {
                      steps {
                                sh 'pwsh sql-servername.ps1'
                      }
              }
      }
    }
  }
}
