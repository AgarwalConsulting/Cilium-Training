# Setup for Cilium

## Local K8s using Minikube

Simple and straightforward, single node cluster using `minikube` (`brew install minikube`)!

Make sure you have `minikube version` of `>= v1.12.1`.

### Start the k8s cluster

```bash
make k8s-minikube-start
```

Depending on your net speed, this can take a while.

Note: If this fails due to memory issue and you are using Docker for Mac/Windows, try resizing the memory of the Docker VM. You can access this from `Preferences > Resources > Advanced` and change the memory to a higher value (`> 4 GiB`).

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
