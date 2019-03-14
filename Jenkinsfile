pipeline {
    environment {
		registry = "$DOCKER_REGISTRY/revisions"
		registryCredential = "docker-registry"
	}
	
	agent any
    stages {
        
		stage('Cloning Git') {
			steps {
				git 'https://github.com/bartuart/revisionExplorer.git'
			}
		}
		
		stage('Building image') {
			steps{
				script {
					docker.build registry + ":test"
				}
			}
		}
		
		
		/* stage('Build') {
            steps {
                sh 'docker login 10.0.0.201:5000 -u admin -p NexusTest'
				sh 'docker build -t 10.0.0.201:5000/revisions:v01 .'
				sh 'docker push 10.0.0.201:5000/revisions:v01'
				sh 'docker logout 10.0.0.201:5000'
            }
        } */
    }
}