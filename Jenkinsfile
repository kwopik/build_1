properties ([disableConcurrentBuilds()])
pipeline {
    agent {
        label 'master'
    }
  triggers { pollSCM('* * * * *') }
    stages {
        stage ('docker build') {
            steps {
                echo "=============build=============="
                
                   sh 'docker build -t simple-flask-app:latest .'
                
            }
        }   
          stage ('docker run') {
            steps {
                echo "=============run=============="
                
                   sh 'docker run -d --name flasktest -p 5000:5000 simple-flask-app '
                
            }
        }
          stage ('docker test') {
            steps {
                echo "=============test=============="
                script {
                   def curlResult = sh(script: 'curl -I http://127.0.0.1:5000', returnStatus: true)
                    echo "curl Result: ${curlResult}"
                echo "!!!!!!!!!!!!!success!!!!!!!!!!!!!!!!"
                }
            }
        }
                 stage ('docker kill') {
            steps {
                echo "=============kill=============="
                sh 'docker kill flasktest'
            }
        }
    }

 
}
