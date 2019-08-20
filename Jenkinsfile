pipeline {
  agent any
  environment {
    NODE_PATH = "/var/jenkins_home"
  }
  stages {
    stage('Test') {
      steps {
        wrap([$class: 'VeracodeInteractiveBuildWrapper', location: 'docker', port: '10010']) {
          sh "export MAVEN_OPTS=-agentlib=$PWD/agent_nodejs_linux64"
          sh "export IASTAGENT_LOGGING_STDERR_ENABLED=true"
          sh "export IASTAGENT_LOGGING_STDERR_LEVEL=info"
          sh "mvn test"
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