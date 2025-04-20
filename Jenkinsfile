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
            withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'your-aws-credentials-id',  // Replace with your Jenkins credential ID
                accessKeyVariable: 'aws_access_key',
                secretKeyVariable: 'aws_secret_key'
            ]]) {
                sh '''
                    terraform plan -no-color \
                        -var="aws_access_key=${AWS_ACCESS_KEY_ID}" \
                        -var="aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
            '''
            }
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

