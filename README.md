# Project Title: Automated CI/CD Pipeline with AWS EKS, Jenkins, and Docker

## Overview

This project demonstrates the implementation of a robust CI/CD pipeline using a suite of modern DevOps tools and practices. The pipeline integrates infrastructure as code, continuous integration, continuous delivery, security scanning, and monitoring, providing a comprehensive solution for automated deployments to AWS EKS.

## Project Overview

The project uses Terraform to provision infrastructure on AWS, including EKS and EC2 instances. Ansible is employed to install and configure Docker, Jenkins, SonarQube, and Nexus on the EC2 instances. The Java Spring Boot application source code is managed in GitHub, and Jenkins is used for continuous integration and continuous delivery.

Key features of the pipeline include:

- **Infrastructure as Code**: Terraform for AWS resource provisioning.
- **Configuration Management**: Ansible for installing and configuring necessary tools.
- **CI/CD**: Jenkins for automating the build, test, and deployment processes.
- **Static Code Analysis**: SonarQube for code quality checks.
- **Security Scanning**: Trivy for container image security.
- **Artifact Management**: Nexus for storing build artifacts.
- **Containerization**: Docker for packaging applications.
- **Orchestration**: AWS EKS for managing Kubernetes clusters.
- **Deployment**: ArgoCD for GitOps-based continuous delivery.
- **Monitoring**: Prometheus and Grafana for monitoring and alerting.

## Technologies Used

- **Terraform**
- **Ansible**
- **AWS EKS**
- **EC2**
- **Jenkins**
- **SonarQube**
- **Nexus**
- **Docker**
- **GitHub**
- **Maven**
- **Trivy**
- **ArgoCD**
- **Prometheus**
- **Grafana**
