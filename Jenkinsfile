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
          sh 'export MAVEN_OPTS=-agentlib=${PWD}agent_nodejs_linux64'
          sh 'export IASTAGENT_LOGGING_STDERR_ENABLED=true'
          sh 'export IASTAGENT_LOGGING_STDERR_LEVEL=info'
          sh 'mvn --batch-mode test'
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