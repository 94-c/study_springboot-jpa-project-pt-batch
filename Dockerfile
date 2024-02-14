FROM eclipse-temurin:17

# 빌드 결과물을 복사
COPY app.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java","-jar","app.jar"]
