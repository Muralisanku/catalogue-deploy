pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    // environment {
    //     packageVersion = ''
    //     nexusURL = '172.31.1.211:8081'
    // }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    parameters {
         string(name: 'version', defaultValue: '', description: 'what is the artifact version?')
         string(name: 'environment', defaultValue: 'dev', description: 'what is the environment?')
    }

    stages {
        stage('Print version') {
            steps {
                sh """
                    echo "version: ${params.version}"
                    echo "environment: ${params.environment}"
                """
            }
        }
        stage('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                    cd terraform
                    terraform init -var-file=${params.environment}/${params.environment}/.tfvars -var="app_version="${params.version}"
                """
            }
        }

    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        failure {
            echo 'this runs when pipeline is failed, used to send some alerts'
        }
        success {
            echo 'I will say Hello when pipeline is success'
        }
    }
}