pipeline {
    agent any
    triggers {
        githubPush()
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/abhilashkalathil/terraform-jenkins-demo.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init -no-color'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -no-color'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -no-color'
            }
        }
    }
    post {
        always {
            sh 'terraform output -no-color'
            cleanWs()
        }
    }
}

