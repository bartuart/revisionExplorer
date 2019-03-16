pipeline {
    agent { label 'master' }
	
	environment {
		registry = "$DOCKER_REGISTRY"
		image = 'revisions'
		dockerTag = "test_${currentBuild.number}"
		registryCredential = 'docker-registry'
		dockerImageName = "$registry/$image"
		dockerImageFullName = "$dockerImageName:$dockerTag"
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
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: registryCredential,
					usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
						sh 'kubectl get secrets | grep "revisions-reg-key" || kubectl create secret docker-registry revisions-reg-key --docker-server="https://$registry" --docker-username="$USERNAME" --docker-password="$PASSWORD"'
					}
					
				git 'https://github.com/bartuart/revisionExplorer.git'
				
				sh 'kubectl apply -f kube-deployments/deployment-test.yml'
				
				sh 'kubectl apply -f kube-deployments/service-test.yml'
				
				sh 'kubectl --record deployment.apps/revisions-test set image deployment.v1.apps/revisions-test revisions-test="$dockerImageFullName"'
			}
		}
    }
}