pipeline {
        agent any
  stages {
    stage ('version') {
      steps {
          bat 'pwsh --version'
      }
    }
    stage ('dropdatabase') {
      steps {
          bat 'pwsh sql-servername.ps1'
      }
    }
  }
}
