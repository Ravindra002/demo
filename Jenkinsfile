pipeline {
        agent any
  stages {
    stage ('version') {
      steps {
          sh 'pwsh --version'
      }
    }
    stage ('dropdatabase') {
      steps {
          sh 'pwsh sql-servername.ps1'
      }
    }
  }
}
