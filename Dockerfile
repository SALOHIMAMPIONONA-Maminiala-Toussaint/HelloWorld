FROM openjdk:17
COPY HelloWorld.jar HelloWorld.jar
ENTRYPOINT ["java", "-jar", "HelloWorld.jar"]
