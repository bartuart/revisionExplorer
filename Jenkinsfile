pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t 10.0.0.201:5000/revisionExplorer:v01 .'
            }
        }
    }
}