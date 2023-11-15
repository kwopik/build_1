pipeline {
    agent any
 triggers { pollSCM('* * * * *') }
    stages {
        stage ('git clone') {
            steps {
                script {
                    git clone https://github.com/kwopik/build_1.git
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Сборка Docker-образа
                    dockerImage = docker.build('simple-flask-app', '.')

                    // Сохранение Docker-образа в Docker Hub (опционально)
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Запуск Docker-контейнера
                    docker.run('simple-flask-app', '-p 5000:5000')
                }
            }
        }

        stage('Test') {
            steps {
                // Здесь можно добавить шаги тестирования вашего приложения
                // Например, curl для проверки, что приложение работает
                sh 'curl http://127.0.0.1:5000/'
            }
        }
    }

    post {
        always {
            // Всегда остановить контейнер, даже если что-то пошло не так
            script {
                docker.image('simple-flask-app').stop()
                docker.image('simple-flask-app').remove()
            }
        }
    }
}
