FROM eclipse-temurin:17

# JAR 파일 경로
ARG JAR_FILE=target/*.jar

# 빌드 결과물을 복사
COPY ${JAR_FILE} app.jar

EXPOSE 8081

ENTRYPOINT ["java","-jar","app.jar"]