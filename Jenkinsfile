pipeline{
    agent any
    stages{
        stage('Hello'){
            steps{
                echo "Hello world"
            }
        }
        stage('checkout code'){
            steps{
                git branch: 'main', url: 'https://github.com/shaulicohenr/python-demo'           
                sh "ls -la"
            }
        }
        stage('docker build'){
            steps{
                sh "docker build -t shaulicohenr/python-demo:1.0.3 ."
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push shaulicohenr/python-demo:1.0.3
                    '''
                }
            }
        }
        stage("Docker Run"){
            steps{
                sh 'docker run shaulicohenr/python-demo:1.0.3'
            }
        }
    }
}
