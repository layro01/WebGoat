pipeline {
  agent {
      docker {
          image 'maven:3.6.1-jdk-8'
      }
  }
  stages {
    stage('Build') { 
      steps {
        sh 'mvn clean compile'
      }
    }
    stage('Test') {
      steps {
        wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'agent-server.veracode-iast.io', port: '10010']) {
          sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/iast-ci.sh | sh'
          sh 'mvn test'
        }
      }
    }
    stage('Deploy') { 
      steps {
        sh 'echo mvn install would run here...'
      }
    }
  }
}
