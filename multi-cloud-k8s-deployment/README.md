# HawkTech

## Overview
This project automates the provisioning and deployment of Kubernetes clusters on both AWS (EKS) and GCP (GKE) using Terraform. It also deploys a sample microservice using Helm, along with a centralized monitoring stack (Prometheus & Grafana).

## Tech Stack
- Infrastructure as Code (IaC): Terraform
- Cloud Platforms: AWS (EKS), GCP (GKE)
- Kubernetes Package Management: Helm
- CI/CD Tools: GitHub Actions
- Monitoring & Logging: Prometheus, Grafana
- Security: Role-based access control (RBAC), TLS Encryption

## Features
- Automated Kubernetes Cluster Deployment (AWS EKS & GCP GKE)
- Microservices Deployment with Helm
- Multi-Cloud Configuration with Terraform
- Centralized Monitoring (Prometheus & Grafana)
- Secure & Scalable Architecture

## Architecture Diagram
 ![Architecture](https://github.com/user-attachments/assets/493df048-1795-47f0-939a-c94a377f5986)



# Setup Instructions
## Prerequisites
- Terraform Installed
- AWS CLI & GCP SDK configured
- kubectl & Helm installed

## Clone the Repository
git clone https://github.com/balag91/multi-cloud-k8s-deployment.git

## Deploy AWS EKS Cluster
```
cd multi-cloud-k8s-deployment
cd terraform/aws
terraform init
terraform apply -auto-approve
```
## Deploy GCP GKE Cluster
```
cd ../gcp
terraform init
terraform apply -auto-approve
```

## Deploy Microservice
```
kubectl config use-context aws-eks
helm install microservice ./helm/microservice-chart
```
```
kubectl config use-context gcp-gke
helm install microservice ./helm/microservice-chart
```

## Monitoring & Logging
Deploy Prometheus & Grafana
```
kubectl apply -f monitoring/prometheus-grafana.yaml
```

## Access Grafana Dashboard:
```
kubectl port-forward svc/grafana 3000:3000
Open http://localhost:3000 in your browser.
```
- Folder Structure
```
multi-cloud-k8s-deployment/
│── terraform/
│   ├── aws/
│   ├── gcp/
│── helm/
│   ├── microservice-chart/
│── monitoring/
│── README.md
```

## Author & Contact
- Name: HawkTech
- LinkedIn: LinkedIn Profile
- GitHub:  GitHub Profile
- Email: email@example.com