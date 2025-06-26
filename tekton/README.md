# Tekton Pipeline for open-flights

This directory contains Tekton pipeline and resource manifests for building and pushing the open-flights Docker image using Kaniko.

## Files
- `pipeline.yaml`: Defines the pipeline to clone the repo, build the image with Kaniko, and push to Docker Hub.
- `pipeline-run.yaml`: Example PipelineRun to trigger the pipeline.
- `dockerhub-secret.yaml`: Template for Docker Hub credentials secret (required for Kaniko to push images).

## Setup

1. **Install Tekton Pipelines and Dashboard**
   - See: https://tekton.dev/docs/getting-started/

2. **Install Kaniko and git-clone ClusterTasks**
   - Kaniko: https://hub.tekton.dev/tekton/task/kaniko
   - git-clone: https://hub.tekton.dev/tekton/task/git-clone

3. **Create Docker Hub Secret**
   - Edit `dockerhub-secret.yaml` and fill in your Docker Hub username and password/token.
   - Apply the secret:
     ```
     kubectl apply -f tekton/dockerhub-secret.yaml
     ```

4. **Apply Pipeline and Run**
   - Apply the pipeline and run manifests:
     ```
     kubectl apply -f tekton/pipeline.yaml
     kubectl apply -f tekton/pipeline-run.yaml
     ```

5. **Use Tekton Dashboard**
   - Access the dashboard to manually start or monitor the pipeline:
     ```
     kubectl port-forward svc/tekton-dashboard -n tekton-pipelines 9097:9097
     ```
   - Open [http://localhost:9097](http://localhost:9097) in your browser.

---
For more, see the [Tekton documentation](https://tekton.dev/docs/). 