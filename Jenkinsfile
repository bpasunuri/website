pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'
    }
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout from any branch
                    checkout scm
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image (if needed)
                    docker.build("bpasunuri/webapp")
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push Docker image to Docker Hub (if needed)
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        docker.image("bpasunuri/webapp").push()
                    }
                }
            }
        }
        
        stage('Trigger Test Job') {
            steps {
                script {
                    // Trigger downstream test job
                    build job: 'Test', wait: false
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
