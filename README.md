# Cilium

Cilium is open source software for transparently securing the network connectivity between application services deployed using Linux container management platforms like Docker and Kubernetes.

## Local Setup

First add the repo,

```bash
make helm-repo-add
```

Next, setup a local cluster:

```bash
make k8s-kind-create kind-load-cilium-image
```

Make sure the cilium pods have started, successfully:

```bash
kubectl get pods --all-namespaces -l k8s-app=cilium
```

Next, install the chart,

```bash
make helm-install-cilium
```

### Test the setup

```bash
make test-cilium-setup
```
