pipeline {
    agent any
    tools { 
        nodejs "NODEJS" 
    }
    stages {
        stage('Build') {
            steps {
                bat '''
                    echo Starting build...
                    npm install
                    npm run build
                    if %ERRORLEVEL% NEQ 0 (
                        echo Build failed!
                        exit /B %ERRORLEVEL%
                    )
                    echo Build completed successfully.
                '''
            }
        }
        stage('Deliver') {
            steps {
                bat '''
                    echo Starting delivery...
                    jenkins\\scripts\\deliver.bat
                    if %ERRORLEVEL% NEQ 0 (
                        echo Delivery failed!
                        exit /B %ERRORLEVEL%
                    )
                '''
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                bat '''
                    echo Killing processes...
                    jenkins\\scripts\\kill.bat
                    if %ERRORLEVEL% NEQ 0 (
                        echo Failed to kill processes!
                        exit /B %ERRORLEVEL%
                    )
                    echo Processes killed successfully.
                '''
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
