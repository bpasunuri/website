pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'bpasunuri/webapp'
        GITHUB_REPO = 'https://github.com/bpasunuri/website.git'
        DOCKER_REGISTRY_CREDENTIALS = 'docker-hub-credentials' // Update with your Jenkins Docker Hub credentials ID
        BRANCH_NAME = "${env.BRANCH_NAME ?: 'master'}" // Default to 'master' if not provided
    }

    stages {
        stage('Pull Code and Build Docker Image') {
            steps {
                script {
                    // Clone the GitHub repository
                    git branch: "${BRANCH_NAME}", url: "${GITHUB_REPO}"
                    // Build the Docker image
                    def image = docker.build(DOCKER_IMAGE)
                    // Push the Docker image to Docker Hub
                    withDockerRegistry([credentialsId: DOCKER_REGISTRY_CREDENTIALS, url: '']) {
                        image.push()
                    }
                }
            }
        }

        stage('Test and Deploy') {
            when {
                anyOf {
                    branch 'master'
                    branch 'develop'
                }
            }
            steps {
                script {
                    if (BRANCH_NAME == 'master') {
                        build job: 'Test'
                        build job: 'Prod'
                    } else if (BRANCH_NAME == 'develop') {
                        build job: 'Test'
                    } else {
                        echo "No downstream jobs triggered for branch: ${BRANCH_NAME}"
                    }
                }
            }
        }
    }
}
