pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9' // Nom de l'installation Maven dans Jenkins
        jdk 'JDK 17'         // Adapte à ta version Java (par ex. Java 17)
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
    }
}
