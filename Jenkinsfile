pipeline {
    agent {
        label 'master'
    }
 
    stages {
        stage ('git clone') {
            steps {
                echo "=============build=============="
                
                   sh 'docker build .'
                
            }
        }   
    }

 
}
