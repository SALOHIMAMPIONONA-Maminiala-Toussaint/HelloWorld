FROM openjdk:17
COPY target/HelloWorld-00.1-SNAPSHOT.jar HelloWorld.jar
ENTRYPOINT ["java", "-jar", "HelloWorld.jar"]