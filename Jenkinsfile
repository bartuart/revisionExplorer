pipeline {
    environment {
		registry = "$DOCKER_REGISTRY/revisions"
		registryCredential = "docker-registry"
		dockerImage = ''
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
		
		stage('Put image into Nexus') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
    
		stage('Remove Unused docker image') {
			steps{
				sh "docker rmi $registry:test"
			}
		}
    }
}