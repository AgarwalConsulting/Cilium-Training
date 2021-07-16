# Cilium

Cilium is open source software for transparently securing the network connectivity between application services deployed using Linux container management platforms like Docker and Kubernetes.

## Local Setup

```bash
make k8s-kind-create kind-load-cilium-image helm-repo-add helm-install-cilium
```

### Test the setup

```bash
make test-cilium-setup
```
