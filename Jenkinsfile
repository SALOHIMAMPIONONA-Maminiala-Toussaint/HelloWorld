pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'JDK 17'
    }

    environment {
        DOCKER_IMAGE = 'mampionona2000/helloworld:1.0.0'
    }

    stages {

        stage('Verify Docker') {
            steps {
                bat 'docker --version'
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
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'jenkins-docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    bat "docker push %DOCKER_IMAGE%"
                }
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
    }
}
