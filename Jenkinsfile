pipeline {
    agent any
    stages {
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/nvsblmike/Reddit-Project.git'
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
                            sh 'terraform destroy -var-file=variables.tfvars -auto-approve'
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
