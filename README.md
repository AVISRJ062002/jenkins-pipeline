# Cloud CI/CD Pipeline Project

This repository contains a sample two-service application, a Jenkins pipeline,
and a single-node Docker stack for running Jenkins, SonarQube, Prometheus,
and Grafana on one EC2 instance.

## Repository Layout

- `jenkins/Jenkinsfile`: pipeline definition
- `services/service1`: Spring Boot sample service
- `services/service2`: Node.js sample service
- `docker-compose.yml`: deployment file for the application containers
- `single-node-stack/`: Docker Compose stack for Jenkins, SonarQube, Prometheus, and Grafana

## Default Service Ports

- Jenkins: `8080`
- SonarQube: `9000`
- Grafana: `3000`
- Prometheus: `9090`
- Service 1: `8081`
- Service 2: `8082`
