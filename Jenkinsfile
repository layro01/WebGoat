pipeline {
  agent any
  environment {
    NODE_PATH = "/var/jenkins_home"
  }
  stages {
    stage('Build') { 
      steps {
        sh 'whoami'
        sh 'dir'
        sh 'uname -all'
        sh 'apt-get install java-1.8.0-openjdk-devel.x86_64'
        sh 'wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo'
        sh 'sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo'
        sh 'apt-get install -y apache-maven'
      }
    }
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