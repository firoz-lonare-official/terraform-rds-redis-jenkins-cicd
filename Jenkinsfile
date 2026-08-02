pipeline {

    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                git 'YOUR_GITHUB_REPO_URL'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve Terraform Apply?'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
