#! /bin/sh

#curl -sSL https://s3.us-east-2.amazonaws.com/app.veracode-iast.io/java/agent-java-linux64.tar.gz -o java.zip
#tar xvf java.zip

export MAVEN_OPTS=-agentlib:agent_java_linux64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PWD}
export PATH=${PATH}:${PWD}
mvn --batch-mode test
