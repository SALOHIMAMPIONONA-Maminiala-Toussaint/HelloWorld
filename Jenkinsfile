pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'JDK 17'
    }

    environment {
    DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe'
    CRED_HELPER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
    DOCKER_IMAGE = 'mampionona2000/helloworld:1.0.0'
    PATH = "${env.CRED_HELPER_PATH};${env.PATH}"
}

    stages {

        stage('Verify Docker') {
            steps {
                bat '"%DOCKER_PATH%" --version'
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/SALOHIMAMPIONONA-Maminiala-Toussaint/HelloWorld.git'
            }
        }

        stage('Build') {
    steps {
        bat 'mvn clean install'
        bat 'dir target'
    }
}


       

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('sonarqube-token')
            }
            steps {
                withSonarQubeEnv('SonarQube Local') {
                    bat "mvn sonar:sonar -Dsonar.login=%SONAR_TOKEN%"
                }
            }
        }

        stage('Package') {
            steps {
                bat 'mvn package'
            }
        }

		stage('Docker Build') {
    steps {
        
        bat 'dir target\\*.jar' 
        bat '"%DOCKER_PATH%" build -t %DOCKER_IMAGE% .'
    }
}
stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'jenkins-docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat '"%DOCKER_PATH%" login -u %DOCKER_USER% -p %DOCKER_PASS%"'
                    bat '"%DOCKER_PATH%" push %DOCKER_IMAGE%'
                }
            }
        }
    }
}
