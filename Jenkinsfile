pipeline {
  agent {
      docker {
          image 'openjdk:8'
      }
  }
  environment {
    NODE_PATH = "/var/jenkins_home"
  }
  stages {
    stage('Build') {
        steps {
            sh 'apk add maven'
        }
    }
    stage('Test') {
      steps {
        wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'agent-server.hailstone.io', port: '10010']) {
          sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/iast-ci.sh | sh'
          sh 'chmod +x run_with_iast.sh'
          sh 'sudo ./run_with_iast.sh'
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