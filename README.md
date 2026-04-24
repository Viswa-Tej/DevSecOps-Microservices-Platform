README.md

# 🚀 DevSecOps Microservices Platform

## 📌 Overview

This project demonstrates a **production-style DevSecOps pipeline** integrating Infrastructure as Code (IaC), containerization, orchestration, automation, and security.

It simulates how modern engineering teams build, secure, and deploy applications using industry-standard tools.

---

## 🧠 Architecture

```
GitHub → CI/CD Pipeline → Docker Build → Trivy Scan → Kubernetes Deploy → Monitoring
```

---

## ⚙️ Tech Stack

* **Cloud**: GCP (Terraform)
* **Containerization**: Docker
* **Orchestration**: Kubernetes (Minikube)
* **Infrastructure as Code**: Terraform
* **Configuration Management**: Ansible
* **CI/CD**: GitHub Actions
* **Security**: Trivy
* **Monitoring (ready)**: Prometheus, Grafana
* **Version Control**: GitHub

---

## 🚀 Project Phases

---

### 🔹 Phase 1: Containerization & Kubernetes

* Built Python microservice
* Dockerized application
* Deployed on Kubernetes (Minikube)
* Implemented:

  * Liveness & Readiness probes
  * NodePort service
  * Horizontal Pod Autoscaler (HPA)

#### ▶️ Run Locally

```bash
minikube start
eval $(minikube docker-env)
docker build -t devops-app:latest ./app
kubectl apply -f k8s/
minikube service devops-app
```

---

### 🔹 Phase 2: Infrastructure & Automation

#### Terraform (GCP)

* Created:

  * VPC
  * Subnet
  * Compute Instance

```bash
cd terraform
terraform init
terraform apply
```

#### Ansible (via Docker)

* Automated system configuration
* Executed Ansible using Docker (Windows workaround)

```bash
docker run --rm -it -v ${PWD}:/ansible -w /ansible \
williamyeh/ansible:alpine3 \
ansible-playbook -i inventory.ini playbook.yml
```

#### Key Learning

* Solved Docker volume mount issues on Windows
* Executed Linux-native tools (Ansible) using containers

---

### 🔹 Phase 3: CI/CD & DevSecOps

#### GitHub Actions Pipeline

* Trigger: `push to main`
* Steps:

  1. Checkout code
  2. Build Docker image
  3. Install Trivy
  4. Scan image for vulnerabilities
  5. Simulate deployment

#### Pipeline File

`.github/workflows/pipeline.yml`

#### Key Feature

```yaml
trivy image --exit-code 0 devops-app:latest
```

* Prevents pipeline failure while still reporting vulnerabilities

---

## 🔐 Security (DevSecOps)

* Integrated **Trivy** for container vulnerability scanning
* Learned:

  * Avoid hardcoded dependency versions
  * Use repo-based installation for stability
* Enabled **security-first CI/CD workflow**

---

## 🔍 Troubleshooting & Fixes

### 🐳 Docker (Windows)

* Fixed volume mount issue using:

  * PowerShell instead of Git Bash
  * Docker file sharing permissions

### ☸️ Kubernetes

* Fixed `ImagePullBackOff` using:

```yaml
imagePullPolicy: Never
```

### 🤖 Ansible

* Resolved:

  * YAML syntax errors
  * OS package manager mismatch (apt vs apk)
  * Inventory misconfiguration

### 🔐 CI/CD

* Fixed:

  * Trivy installation failure (404 error)
  * Pipeline failure due to exit codes
  * Node.js runtime warnings

---

## 📈 Key Learnings

* End-to-end DevSecOps workflow
* CI/CD pipeline debugging
* Infrastructure provisioning with Terraform
* Configuration automation with Ansible
* Container orchestration with Kubernetes
* Security integration using Trivy
* Cross-platform DevOps challenges (Windows vs Linux)

---

## 🎯 Future Improvements

* Push Docker images to Docker Hub
* Deploy to real Kubernetes cluster (GKE)
* Add Helm charts
* Implement secrets management
* Integrate monitoring stack (Prometheus + Grafana)
* Add alerting system

---

## 👨‍💻 Author

**Viswa Teja**

---

## ⭐ Final Note

This project demonstrates **real-world DevOps + DevSecOps practices**, including debugging production-like issues across multiple tools and environments.
