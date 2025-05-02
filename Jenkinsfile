pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'myapp-image'
        CONTAINER_NAME = 'myapp'
    }
    
    stages {
        stage('Nettoyage Workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage('Checkout depuis Git') {
            steps {
                git branch: 'main', url: 'https://github.com/FredLuc12/projet-Devops.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}", ".")
                }
            }
        }
        
        stage('Nettoyage Docker') {
            steps {
                script {
                    sh """
                        docker rm -f ${CONTAINER_NAME} || true
                        docker image rm ${CONTAINER_NAME} || true
                    """
                }
            }
        }
        
        stage('Rebuild & Deploy Container') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}", ".")  // Correction ici
                    sh """
                        docker run -d --name ${CONTAINER_NAME} -p 8081:80 ${IMAGE_NAME}
                    """
                }
            }
        }
        
        stage('Afficher IP Conteneur') {
            steps {
                script {
                    sh "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${CONTAINER_NAME}"
                }
            }
        }
    }
}
