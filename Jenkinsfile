pipeline {
    agent { label 'master' }
	
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
		
		stage('Deploy APP into Kubernetes Cluster'){
			agent { label 'linux' }
			steps{
				//sh 'docker login 10.0.0.201:5000 -u admin -p NexusTest && kubectl get nodes'
				//sh "docker login $registry -u admin -p NexusTest && docker pull $dockerImageFullName && kubectl run revisions --image=$dockerImageFullName --port=3000"
				
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: registryCredential,
					usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
						sh 'echo uname=$USERNAME pwd=$PASSWORD'
					}
					
				git 'https://github.com/bartuart/revisionExplorer.git'
			}
		}
    }
}