pipeline {
  agent any
  environment {
    NODE_PATH = "/var/jenkins_home"
  }
  stages {
    stage('Build') { 
      steps {
        sh 'apk add openjdk8'
        sh 'apk add maven'
      }
    }
    stage('Test') {
      steps {
        wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'agent-server.hailstone.io', port: '10010']) {
          sh 'curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/iast-ci.sh | sh'
          sh 'export MAVEN_OPTS="-agentlib=${PWD}/agent_nodejs_linux64" && export IASTAGENT_LOGGING_STDERR_ENABLED="true" && mvn --batch-mode test'
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