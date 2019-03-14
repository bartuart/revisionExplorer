pipeline {
    agent any
	
	environment {
		registry = "$DOCKER_REGISTRY"
		image = 'revisions'
		dockerTag = 'test'
		registryCredential = 'docker-registry'
		dockerImageFullName = "$registry/$image:$dockerTag"
		dockerImage = ''
	}
	
    stages {
        
		stage('Cloning Git') {
			steps {
				git 'https://github.com/bartuart/revisionExplorer.git'
			}
		}
		
		stage('Building image') {
			steps{
				script {
					dockerImage = docker.build dockerImageFullName 
				}
			}
		}
		
		stage('Put image into Nexus') {
			steps{
				script {
					docker.withRegistry( "https://"+ registry, registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
    
		stage('Remove Unused docker image') {
			steps{
				sh "docker rmi $dockerImageFullName"
			}
		}
		
		stage('Hello test'){
			agent { label 'linux' }
			steps{
				sh 'echo Hello Hello'
			}
		}
    }
}