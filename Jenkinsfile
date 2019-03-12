pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker login 10.0.0.201:5000 -u admin -p NexusTest'
				sh 'docker build -t 10.0.0.201:5000/revisions:v01 .'
				sh 'docker push 10.0.0.201:5000/revisions:v01'
				sh 'docker logout 10.0.0.201:5000'
            }
        }
    }
}