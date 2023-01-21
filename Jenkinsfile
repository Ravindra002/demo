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
          bat 'powershell.exe sql-servername.ps1'
      }
    }
  }
}
