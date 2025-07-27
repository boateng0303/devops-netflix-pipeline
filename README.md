# 🚀 Secure Netflix Web App on AWS

## 📘 Overview

This project demonstrates the complete deployment of a **secure, containerized Netflix-like web application** on **Amazon Web Services (AWS)** using a **fully automated DevSecOps pipeline**. It progresses from Terraform-based infrastructure provisioning to full EKS-based application deployment, including observability and security integrations.

---

## 🎯 Project Objectives

- Deploy a scalable, secure web application on Amazon EKS.
- Automate infrastructure and application lifecycle using **Terraform** and **GitHub Actions**.
- Enable observability with **Prometheus** and **Grafana**.
- Integrate security tools like **Trivy** and **SonarCloud**.
- Configure **email alerting via Amazon SES**.
- Apply **modular, reusable, and production-grade infrastructure patterns** following **DevSecOps** principles.

---

## 🛠️ Tools & Technologies Used

| Category             | Tools & Services                         |
|----------------------|------------------------------------------|
| Infrastructure       | Terraform, AWS VPC, IAM                  |
| Container Orchestration | Amazon EKS, Kubernetes               |
| CI/CD                | GitHub Actions                           |
| Container Registry   | Amazon ECR                               |
| Monitoring           | Prometheus, Grafana, AWS CloudWatch      |
| Security             | Trivy, SonarCloud, IAM, Network Policies |
| Email Alerts         | Amazon SES                               |
| Networking           | AWS Load Balancer Controller, VPC        |
| Storage              | Amazon EBS, ECR                          |

---

## 📦 Terraform Modularization

To ensure maintainability and scalability, the infrastructure is modularized into:

- **VPC Module**: Handles networking (subnets, NAT, security groups).
- **EKS Module**: Manages the Kubernetes cluster, node groups, and monitoring setup.
- **ECR Module**: Creates private container registry with lifecycle policies.
- **IAM Module**: Defines roles and service account permissions.
- **Security Groups Module**: Controls network traffic at resource level.

### ✳️ Why Modularize?

- Reusable across environments (dev, staging, prod).
- Easier testing, scaling, and maintenance.
- Clean, declarative, and composable IaC.
- Facilitates collaboration and version control.

---

## 🔄 CI/CD Pipeline – GitHub Actions

### Pipeline Stages:

1. **Build**: Docker image built on push to `main`.
2. **Test**: Linting, unit tests, and static code analysis (SonarCloud).
3. **Scan**: Container vulnerability scanning with Trivy.
4. **Push**: Docker image pushed to ECR.
5. **Deploy**: Kubernetes manifests applied to EKS.
6. **Alert**: Notifications sent via Amazon SES for pipeline failures.

### ✅ Benefits of GitHub Actions

- Seamless GitHub integration
- Flexible, event-driven workflows (YAML-based)
- Secure use of secrets and environment variables
- Scalable and cost-effective automation

---

## 🧱 AWS Architecture

### 🔐 Networking

- **VPC**: Custom or default with public/private subnets.
- **Internet Gateway & NAT Gateway**: Internet access and NAT translation.
- **Security Groups**: Firewall rules for EC2, EKS, and ALB.

### 💻 Compute & Storage

- **EKS**: Fully managed Kubernetes control plane.
- **EC2 Node Groups**: Worker nodes to run the app.
- **ECR**: Docker image storage with scanning and lifecycle rules.
- **EBS**: Persistent volumes for stateful workloads.

### 📈 Monitoring & Security

- **CloudWatch**: Logging and metrics.
- **AWS Load Balancer Controller**: Ingress for Kubernetes.
- **IAM Roles & Policies**: Granular permission model.

---

## 📊 Observability

- **Prometheus**: Metrics scraping via Helm.
- **Grafana**: Dashboards for:
  - CPU/memory usage
  - Pod/deployment status
  - HTTP latency, error rates
  - EKS node metrics
- **CloudWatch Logs**: Centralized application and infrastructure logs.

---

## 🔐 Security Best Practices

- **Trivy**: CI-integrated container image scanning.
- **SonarCloud**: Static analysis for maintainability and vulnerabilities.
- **IAM Roles for Service Accounts (IRSA)**: Secure pod-to-AWS service access.
- **RBAC & Network Policies**: Kubernetes-level access control.
- **Amazon SES**: Sends email alerts on failures.
- **Private Subnets**: EKS nodes are not exposed publicly.
- **Security Groups**: Minimal, specific access ports and IP ranges.

---

## 📡 Key AWS Services Integration

| AWS Service | Purpose |
|-------------|---------|
| **EKS** | Run Kubernetes workloads |
| **ECR** | Store and scan Docker images |
| **SES** | Send email notifications |
| **CloudWatch** | Monitor logs and metrics |
| **Load Balancer Controller** | Expose apps via ALB |
| **EBS CSI Driver** | Provide persistent volumes |
| **VPC CNI** | Enable native networking for pods |

---

## 📚 Key Learnings

- Mastered **Terraform modules** and **AWS provider configurations**.
- Built a **production-ready EKS cluster** with complete DevSecOps tooling.
- Gained hands-on experience with **GitOps**, CI/CD pipelines, and Helm.
- Integrated **security scanning and alerting** into automated deployments.
- Developed robust observability with Grafana, Prometheus, and CloudWatch.

---

## 💸 Cost Optimization

- **Spot Instances**: Used for non-critical EKS workloads.
- **GP3 Volumes**: Cheaper storage with performance scaling.
- **ECR Lifecycle Policies**: Cleanup unused images.
- **CloudWatch Retention**: Log lifecycle management.

---

## 🏁 Final Notes

This project is a **real-world simulation of a DevSecOps workflow on AWS**. It brings together cloud infrastructure, security, automation, and application deployment in a modular, scalable, and secure fashion.

Whether you're preparing for a cloud role or building enterprise-ready systems, this repository reflects **production-grade architecture** and **best practices** across the board.

---


## 🔗 Contact

For feedback, suggestions, or collaboration, feel free to open an issue or pull request.

---
