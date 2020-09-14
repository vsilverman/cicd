pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'building...'
        sh 'echo myDemo = $myDemo'
        sh './get-plugins.sh'
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