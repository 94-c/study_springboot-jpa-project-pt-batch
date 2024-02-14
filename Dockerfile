# 첫 번째 단계: Gradle 빌드 수행
FROM adoptopenjdk/openjdk17 AS builder
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootJar

# 두 번째 단계: 실행 가능한 JAR 파일을 별도의 이미지 레이어로 복사
FROM adoptopenjdk/openjdk17
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
VOLUME /tmp
