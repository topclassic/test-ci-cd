pipeline {
    agent any
    stages {
        stage('prep'){
            steps {
                git url: 'https://github.com/topclassic/test-ci-cd.git'
                sh 'git checkout UAT'
                sh 'git pull'
            } 
        }
        stage('Test') {
            agent {
                docker { image 'node:9.0' }
            }
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('Build'){
            steps{
                script {
                    docker.withRegistry('https://registry.gitlab.com','DOCKER_REGISTRY') {
                        docker.build("registry.gitlab.com/topchotipat/test-connect-sonar").push('UAT')
                    }
                }   
            }
        }
    }
}
        // stage('Sonarqube') {
        // when { tag "release-*" }
        //     environment {
        //         SONAR_SCANNER  = tool name: 'sonar-scanner'
        //     }
        //     steps {
        //         withSonarQubeEnv('sonar') {
        //             sh "${SONAR_SCANNER}/bin/sonar-scanner -e -Dsonar.projectName=test-ci-cd -Dsonar.projectKey=test -Dsonar.sources=."
        //         }
        //         timeout(time: 60, unit: 'SECONDS') {
                    
        //             if(waitForQualityGate().status != 'OK'){
        //                 error "Pipeline aborted due to quality gate failure: ${qg.status}"
        //             }
        //         }
        //     }
        // }