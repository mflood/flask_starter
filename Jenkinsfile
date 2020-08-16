pipeline {
  agent any
  stages {
    stage('Unit tests') {
      steps {
        sh '''
        cd app/
        ./setup.sh
        ./run_tests.sh
        '''
      }
    }
  }
}
