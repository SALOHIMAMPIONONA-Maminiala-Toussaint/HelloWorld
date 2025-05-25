pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
        jdk 'JDK 17'
    }

   

    stages {
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

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('sonarqube-token')  // Ton ID d'identifiants Jenkins
            }
            steps {
                withSonarQubeEnv('SonarQube Local') {   // Le nom de ton installation SonarQube dans Jenkins Configure System
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
