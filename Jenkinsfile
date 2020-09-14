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