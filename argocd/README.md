# ArgoCD GitOps Configuration

This directory contains ArgoCD configuration and application manifests for deploying the open-flights Rails app using GitOps.

## Files
- `application.yaml`: Defines the ArgoCD Application for the open-flights app. Update the `repoURL` to your private GitHub repository.
- `argocd-cm.yaml`: ArgoCD ConfigMap for general configuration.
- `argocd-rbac-cm.yaml`: ArgoCD RBAC ConfigMap for admin access.

## Usage

### 1. Deploy ArgoCD to Your Cluster
Follow the [official ArgoCD installation guide](https://argo-cd.readthedocs.io/en/stable/getting_started/) or run:

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 2. Configure Access to Your Private Repo
Create a Kubernetes secret in the `argocd` namespace with your GitHub credentials (username and personal access token):

```
kubectl create secret generic github-creds \
  --from-literal=username=<your-github-username> \
  --from-literal=password=<your-personal-access-token> \
  -n argocd
```

Then, register the repo with ArgoCD (see [docs](https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/)).

### 3. Apply ArgoCD Configs
```
kubectl apply -n argocd -f argocd/
```

### 4. Access ArgoCD UI
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Then visit [https://localhost:8080](https://localhost:8080) in your browser.

---
For more, see the [ArgoCD documentation](https://argo-cd.readthedocs.io/en/stable/). 