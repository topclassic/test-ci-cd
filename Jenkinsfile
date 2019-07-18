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
            def sonarqubeScannerHome = tool name: 'sonar-scanner'
            steps {
                withSonarQubeEnv('sonar') {
                    sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.projectName=test-ci-cd"
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