pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Java Application') {
            steps {
                script {
                    // Build your Java application (e.g., compile and package it into a JAR file)
                    sh 'javac Main.java'
                    sh 'jar -cvf my-java-app.jar   .'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "ashraf313/my-java-app"
                    def dockerfile = "Dockerfile"

                    // Build the Docker image
                    sh "docker build -t ${imageName} -f ${dockerfile} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    def imageName = "ashraf313/my-java-app"

                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASS')]) {
                        sh "docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASS"
                    }

                    // Push the Docker image to Docker Hub
                    sh "docker push ${imageName}"
                }
            }
        }
    }
}

