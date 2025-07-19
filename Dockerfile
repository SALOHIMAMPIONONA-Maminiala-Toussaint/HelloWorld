FROM openjdk:17
COPY target/HelloWorld-00.1-SNAPSHOT.jar HelloWord.jar
ENTRYPOINT ["java", "-jar", "HelloWord.jar"]