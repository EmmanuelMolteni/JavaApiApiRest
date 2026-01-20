# ===== Build stage =====
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests
RUN mv target/*.jar app.jar


# ===== Runtime stage =====
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/app.jar app.jar

# Usuario no root
RUN useradd -r -s /bin/false runtime
USER runtime

# Railway inyecta PORT
ENTRYPOINT ["sh", "-c", "java -Dserver.port=$PORT -jar app.jar"]
