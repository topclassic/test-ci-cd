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
            environment {
                SONAR_SCANNER  = tool name: 'sonar-scanner'
            }
            steps {
                withSonarQubeEnv('sonar') {
                    sh "${SONAR_SCANNER}/bin/sonar-scanner -e -Dsonar.projectName=test-ci-cd -Dsonar.projectKey=test -Dsonar.sources=."
                }
                timeout(time: 60, unit: 'SECONDS') {
                    waitForQualityGate abortPipeline: true
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