pipeline {
    agent { label 'Jenkins-Slave' }

    environment {
        IMAGE_NAME = 'hari1479/tindog'
        TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/Hari979/Tindog.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "Building Docker image..."
                docker build -t $IMAGE_NAME:$TAG .
                '''
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "Logging in to Docker Hub..."
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

                    echo "Pushing image..."
                    docker push $IMAGE_NAME:$TAG

                    docker logout
                    '''
                }
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                echo "Stopping old container if exists..."
                docker rm -f tindog-container || true

                echo "Running new container..."
                docker run -d --name tindog-container -p 8081:80 $IMAGE_NAME:$TAG
                '''
            }
        }
    }
}
