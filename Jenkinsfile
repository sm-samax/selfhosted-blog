pipeline {
    agent any 
    stages {
        stage("verify tools") {
            steps {
                sh '''
                docker version
                docker compose version
                curl --version
                jq --version
                '''
            }
        }
    }
}