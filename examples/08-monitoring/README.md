# Monitoring

## TL;DR - Quick setup

```bash
make uninstall-cilium helm-install-cilium deploy-prom-graf
```

## Setup

Remove cilium CLI installation:

```bash
make uninstall-cilium
```

Install cilium via helm:

```bash
make helm-install-cilium
```

Install example prometheus and grafana:

```bash
make deploy-prom-graf
```

Port forward to local:

```bash
make k8s-pf-grafana-ui
```

Access the UI at http://localhost:3000.
