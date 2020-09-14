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
      agent { 
        docker {
          image 'openjdk:7-jdk-alpine'
        } 
      }
      steps {
        echo 'testing ...'
        sh 'java -version'
      }
    }

    stage('Deploy') {
      steps {
        echo 'deployin ...'
      }
    }

  }
}