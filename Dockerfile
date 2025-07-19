FROM openjdk:17
COPY target/HelloWord-0.0.1-SNAPSHOT.jar HelloWord.jar
ENTRYPOINT ["java", "-jar", "HelloWord.jar"]