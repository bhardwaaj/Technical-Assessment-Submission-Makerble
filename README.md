# DevOps Coding Assessment: open-flights (Rails + PostgreSQL)

This project demonstrates a full DevOps workflow for deploying the [open-flights](https://github.com/zayneio/open-flights) Ruby on Rails app with PostgreSQL using Docker, Kubernetes, ArgoCD (GitOps), and Tekton (CI/CD pipeline).

---

## Prerequisites
- **Docker Desktop** (with Kubernetes enabled) or **Minikube**
- **kubectl**
- **Git**
- **ArgoCD** (see [argocd/README.md](./argocd/README.md))
- **Tekton Pipelines & Dashboard** (see [tekton/README.md](./tekton/README.md))

---

## Step 1: Docker Compose (Local Dev)

1. Build and run the app and database:
   ```sh
   docker-compose up --build
   ```
2. Access the app at [http://localhost:3000](http://localhost:3000)

---

## Step 2: Kubernetes Deployment

1. Make sure your Kubernetes cluster is running (Docker Desktop or Minikube).
2. Apply the manifests:
   ```sh
   kubectl apply -f k8s/
   ```
3. Enable Ingress (if using Minikube):
   ```sh
   minikube addons enable ingress
   minikube tunnel
   ```
4. Add to your hosts file:
   ```
   <cluster-ip> openflights.local
   ```
5. Access the app at [http://openflights.local](http://openflights.local)

---

## Step 3: GitOps with ArgoCD

1. Deploy ArgoCD (see [argocd/README.md](./argocd/README.md)).
2. Push all manifests to your private GitHub repo.
3. Configure ArgoCD to access your repo and apply the manifests in the `argocd` directory.
4. Access the ArgoCD UI to manage and sync your app.

---

## Step 4: CI/CD with Tekton

1. Install Tekton Pipelines and Dashboard (see [tekton/README.md](./tekton/README.md)).
2. Create your Docker Hub secret and apply the pipeline manifests in the `tekton` directory.
3. Use the Tekton Dashboard to manually run and monitor the pipeline.

---

## Directory Structure
- `rails-app/` - Source code for the Rails app
- `k8s/` - Kubernetes manifests
- `argocd/` - ArgoCD GitOps configuration ([README](./argocd/README.md))
- `tekton/` - Tekton pipeline and resources ([README](./tekton/README.md))

---

## Notes
- Do **not** commit any real secrets or credentials.
- For more details on each step, see the README in each subdirectory.
- For troubleshooting, see the official docs for [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) and [Tekton](https://tekton.dev/docs/). 