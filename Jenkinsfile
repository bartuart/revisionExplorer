pipeline {
    environment {
		registry = "$DOCKER_REGISTRY/revisions"
		registryCredential = "docker-registry"
		dockerImage = registry + ":test"
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
					docker.build dockerImage
				}
			}
		}
		
		stage('Put image into Nexus') {
			steps{
				script {
					docker.withRegistry( registry, registryCredential ) {
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