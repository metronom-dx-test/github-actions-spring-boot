FROM openjdk:8-jre-alpine

COPY artifact/* /opt/

CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/opt/demo-0.0.1-SNAPSHOT.jar"]