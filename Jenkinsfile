pipeline {
    agent any
    tools { 
        nodejs "NODEJS" 
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'npm install'
                bat 'npm run build' // Adjust if you have a specific build script
            }
        }
        stage('Deliver') {
            steps {
                powershell 'jenkins\\scripts\\deliver.ps1'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                powershell 'jenkins\\scripts\\kill.ps1'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
