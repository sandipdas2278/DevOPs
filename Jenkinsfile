pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials(AKIAZI2LHXJZUMBXGEEN)
        AWS_SECRET_ACCESS_KEY = credentials(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)
    }

    stages {
        stage('Create_Infra') {
            steps {
                script {
                    // Run Terraform to create infrastructure
                    sh """
                    cd terraform
                    terraform init
                    terraform apply -auto-approve
                    """
                }
            }
        }
        stage('Deploy_Apps') {
            steps {
                script {
                // Run scripts to deploy applications
                    sh """
                    cd terraform
                    terraform apply -auto-approve -var 'frontend_script=frontend.sh' -var 'backend_script=backend.sh'
                    """
                }
            }
        }
        stage('Test_Solution') {
            steps {
                script {
                    // Output frontend IP and check if application is running
                    sh """
                    cd terraform
                    terraform output frontend_ip
                    FRONTEND_IP=\$(terraform output -raw frontend_ip)
                    curl http://\$FRONTEND_IP
                    """
                }
            }
        }
    }
}
