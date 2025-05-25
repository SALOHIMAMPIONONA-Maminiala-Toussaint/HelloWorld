pipeline {
    agent any

    tools {
        maven 'Maven_3.9.9' // Nom de l'installation Maven dans Jenkins
        jdk 'JDK_17'         // Adapte à ta version Java (par ex. Java 17)
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SALOHIMAMPIONONA-Maminiala-Toussaint/HelloWorld.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
