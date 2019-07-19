pipeline {
    agent none
    stages {
        stage('prep') {
            git url: 'https://github.com/topclassic/test-ci-cd.git'
        }
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            agent {
                docker { image 'node:9.0' }
            }
            steps {
                 sh 'npm install'
            }
        }
        // stage('Sonarqube') {
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
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
// node {
//     def myGradleContainer = docker.image('node:9.0')
//     myGradleContainer.pull()
//     stage('prep') {
//         git url: 'https://github.com/topclassic/test-ci-cd.git'
//         sh "${myGradleContainer} -v"
//     }
//     stage('sonarqube'){
//         echo 'Master...'
//         def SONAR_SCANNER  = tool name: 'sonar-scanner'
//         withSonarQubeEnv('sonar') {
//             sh "${SONAR_SCANNER}/bin/sonar-scanner -e -Dsonar.projectName=test-ci-cd -Dsonar.projectKey=test -Dsonar.sources=."
//         }
//         echo 'End Master...'
//     }
//     stage('sonar uat'){
//         echo 'UAT...'
//     }
// }