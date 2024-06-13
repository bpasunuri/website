pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'
    }
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout from the 'develop' branch
                    checkout([$class: 'GitSCM',
                              branches: [[name: '*/develop']],
                              userRemoteConfigs: [[url: 'https://github.com/bpasunuri/website.git']]])
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("bpasunuri/webapp")
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        docker.image("bpasunuri/webapp").push()
                    }
                }
            }
        }
        
        stage('Trigger Test Job') {
            when {
                branch 'develop'
            }
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
