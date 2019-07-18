pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
         stage('Sonarqube') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'mvn clean package sonar:sonar'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}