cat <<'EOF' > Jenkinsfile

pipeline {
    agent any

    environment {
        DEPLOY_SCRIPT = 'scripts/deploy.sh'
        SSH_CRED_ID = 'git'                // The Jenkins SSH credential ID
        REMOTE_USER = 'ubuntu'             // EC2 username
        REMOTE_HOST = '35.171.158.80'      // EC2 public IP
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📥 Cloning repo...'
                checkout scm
            }
        }

        stage('Deploy over SSH') {
            steps {
                echo "🚀 Deploying to remote server via SSH"
                sshagent(credentials: ["${SSH_CRED_ID}"]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} 'bash -s' < ${DEPLOY_SCRIPT}
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment pipeline completed successfully.'
        }
        failure {
            echo '❌ Deployment pipeline failed.'
        }
    }
}
EOF
