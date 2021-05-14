FROM mcr.microsoft.com/java/jre:11-zulu-alpine
WORKDIR /app
RUN addgroup -S demo-group && adduser -S demo-user -G demo-group
USER demo-user:demo-group
EXPOSE 8123 48123
ARG JAR_FILE=/build/libs/ktor-demo-app-a-*-all.jar
COPY ${JAR_FILE} ./app.jar
ENTRYPOINT ["java","-jar","./app.jar"]
