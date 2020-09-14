pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'building...'
        sh 'echo myDemo = $myDemo'
      }
    }

    stage('Test') {
      parallel {
        stage('Test') {
          agent { 
            docker 'openjdk:8-jdk-alpine' 
          }
          steps {
            echo 'testing ...'
            sh 'java -version'
          }
          agent { 
            docker 'openjdk:11-jdk-alpine' 
          }
          steps {
            echo 'testing ...'
            sh 'java -version'
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        echo 'deployin ...'
      }
    }

  }
}