# Setup for Cilium

## Local K8s using Minikube

Simple and straightforward, single node cluster using `minikube`.

### Pre-setup macOS (minikube)

```bash
brew install minikube kubernetes-cli
```

Make sure you have `minikube version` of `>= v1.12.1`.

### Start the k8s cluster

```bash
make k8s-minikube-start
```

Depending on your net speed, this can take a while.

Note: If this fails due to memory issue and you are using Docker for macOS/Windows, try resizing the memory of the Docker VM. You can access this from `Preferences > Resources > Advanced` and change the memory to a higher value (`> 4 GiB`).

### Test cilium setup

```bash
make test-cilium-setup
```

Then, make sure all the pods start:

```bash
kubectl get pods -n cilium-test -w
```

### Stop the k8s cluster

```bash
make k8s-minikube-stop
```

## Local K8s using Kind

### Pre-setup macOS (kind)

```bash
brew install kind kubernetes-cli helm
```

### Start the kind cluster

```bash
make k8s-kind-create
```

### Install Cilium using helm

Add the repo and pre-load the cilium image:

```bash
make helm-repo-add kind-load-cilium-image
```

Install the chart:

```bash
make helm-install-cilium
```

Validate the installation using:

```bash
kubectl -n kube-system get pods --watch
```

### Test the setup

Deploy the test resources:

```bash
make test-cilium-setup
```

Make sure all the pods start:

```bash
kubectl get pods -n cilium-test -w
```

Clean up the resources:

```bash
make cleanup-test
```

### Stop the kind cluster

```bash
make k8s-kind-delete
```

## Local K8s using Footloose/K3s

### Pre-setup macOS (Footloose)

```bash
brew install weaveworks/tap/footloose kubernetes-cli
```

### Pre-setup others (Footloose)

Please follow the setup guide for your environment [here](https://github.com/weaveworks/footloose#install).

### Start the docker based "VMs"

```bash
make k8s-footloose-create
```

### Setup k3s and mount `bpf` directory & install Cilium

```bash
make k8s-footloose-setup
```

### Stop the docker based "VMs" & clean up

```bash
make k8s-footloose-delete
```
