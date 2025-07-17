# Utilise une image JDK officielle
FROM openjdk:17-jdk-slim

# Crée un répertoire dans le conteneur
WORKDIR /app

# Copie le fichier JAR généré dans le conteneur
COPY target/HelloWord-0.0.1-SNAPSHOT.jar app.jar

# Commande d’exécution
CMD ["java", "-jar", "app.jar"]

