pipeline {
  agent any
  stages {
    stage('Build') {
        agent {
        docker {
            image 'maven:3-alpine'
        }
    }
      steps {
        echo 'building...'
        sh 'mvn -v'
      }
    }

    stage('Test') {
      steps {
        echo 'testing ...'
      }
    }

    stage('Deploy') {
      steps {
        echo 'deployin ...'
      }
    }

  }
}