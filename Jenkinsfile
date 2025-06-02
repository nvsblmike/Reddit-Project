pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[
                            url: 'https://github.com/nvsblmike/Reddit-Project.git',
                            credentialsId: 'github-PAT'
                        ]]
                    ])
                }
            }
        }
        stage('Initializing Terraform'){
            steps {
                withAWS(credentials: 'aws-key', region: 'us-east-1') {
                dir('EKS-TF') {
                    script {
                        sh 'terraform init'
                    }
                }
                }
            }
        }
        stage('Validating Terraform'){
            steps {
                withAWS(credentials: 'aws-key', region: 'us-east-1') {
                dir('EKS-TF') {
                    script {
                        sh 'terraform validate'
                    }
                }
                }
            }
        }
        stage('Terraform Plan'){
            steps {
                withAWS(credentials: 'aws-key', region: 'us-east-1') {
                dir('EKS-TF') {
                    script {
                        sh "terraform plan -var-file=${params.'File-Name'}"
                    }
                }
                }
            }
        }
        stage('Creating/Destroying EKS Cluster'){
            steps {
                withAWS(credentials: 'aws-key', region: 'us-east-1') {
                        dir('EKS-TF'){
                            sh 'terraform $action -var-file=variables.tfvars -auto-approve'
                        }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}