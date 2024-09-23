pipeline {
    agent any
    tools { 
        nodejs "NODEJS" 
    }
    stages {
        stage('Build') {
            steps {
                bat 'npm install'
                bat 'npm run build' // Adjust if you have a specific build script
            }
        }
        stage('Deliver') {
            steps {
                bat 'jenkins\\scripts\\deliver.bat'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                bat 'jenkins\\scripts\\kill.bat'
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
