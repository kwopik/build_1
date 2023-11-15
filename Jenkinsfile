pipeline {
    agent {
        label 'master'
    }
 
    stages {
        stage ('docker build') {
            steps {
                echo "=============build=============="
                
                   sh 'docker build .'
                
            }
        }   
          stage ('docker run') {
            steps {
                echo "=============run=============="
                
                   sh 'docker run -d -p 5000:5000 simple-flask-app'
                
            }
        }
          stage ('docker test') {
            steps {
                echo "=============test=============="
                
                   sh 'curl http://127.0.0.1:5000/'
                
            }
        }
    }

 
}
