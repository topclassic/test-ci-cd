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
                def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
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