README.md


# 🚀 DevSecOps Microservices Platform (Phase 1)

## 📌 Overview
This project demonstrates a production-style DevOps setup using:
- Docker (containerization)
- Kubernetes (deployment & orchestration)
- Prometheus (monitoring-ready metrics endpoint)
- Minikube (local cluster)

---

## 🧠 Architecture
- Python microservice with health + metrics endpoints
- Dockerized application
- Kubernetes Deployment with:
  - Liveness & Readiness probes
  - Horizontal Pod Autoscaler (HPA)
- Service exposed via NodePort

---

## ⚙️ Tech Stack
- Docker
- Kubernetes
- Python
- Minikube
- Prometheus (metrics endpoint ready)

---

## ▶️ How to Run

### 1. Start Minikube
```bash
minikube start
2. Use Minikube Docker
eval $(minikube docker-env)
3. Build Image
docker build -t devops-app:latest ./app
4. Deploy to Kubernetes
kubectl apply -f k8s/
5. Access Application
minikube service devops-app
🚨 Troubleshooting
ImagePullBackOff Fix
imagePullPolicy: Never
🎯 Key Learnings
Debugged ImagePullBackOff in Kubernetes
Worked with local container registry (Minikube)
Implemented health checks and auto-scaling
Built production-like deployment structure
📈 Future Improvements
Terraform (GCP infra)
CI/CD pipeline
Security scanning (Trivy)
Observability stack (Prometheus + Grafana)
👨‍💻 Author

Viswa Teja