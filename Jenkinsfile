pipeline {
    agent any
    tools {nodejs "NODEJS"}
    stages {
        stage('Build') {
            steps {
                bat 'start /B npm run build'
            }
        }
        stage('Deliver') {
            steps {
                bat 'chmod -R +rwx ./jenkins/scripts/deliver.bat'
                bat 'chmod -R +rwx ./jenkins/scripts/kill.bat'
                bat './jenkins/scripts/deliver.bat'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                bat './jenkins/scripts/kill.bat'
            }
        }
    }
}

