pipeline {
  agent {
      docker {
          image 'maven:3.6.1-jdk-8-slim'
      }
  }
  environment {
    NODE_PATH = "/var/jenkins_home"
  }
  stages {
    stage('Test') {
      steps {
        wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'agent-server.hailstone.io', port: '10010']) {
          sh 'apt-get update && apt-get install -y bzip2 unzip'
          sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/java/java.zip -o java.zip'
          sh 'unzip java.zip '
          sh 'chmod +x run_with_iast.sh'
          sh './run_with_iast.sh'
        }
      }
    }
    stage('Deploy') { 
      steps {
        sh 'echo mvn deploy would run here...'
      }
    }
  }
}