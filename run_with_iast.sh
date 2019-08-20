#! /bin/sh
export MAVEN_OPTS=-agentlib=${PWD}/agent_nodejs_linux64
export IASTAGENT_LOGGING_STDERR_LEVEL=info
export IASTAGENT_LOGGING_STDERR_ENABLED=true 
mvn --batch-mode test