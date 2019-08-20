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
          sh 'apt-get install bzip2'
          sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/iast-ci.sh | sh'
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