install-macos:
	./setup/cilium/macos.sh
	./setup/hubble/macos.sh

install-linux:
	./setup/cilium/linux.sh
	./setup/hubble/linux.sh

k8s-kind-create:
	kind create cluster --config devops/config/kind/multi-node.yaml

k8s-kind-create-debug:
	kind create cluster --config devops/config/kind/multi-node.yaml
	./devops/config/kind/setup.sh

k8s-kind-default-cni-create:
	kind create cluster --config devops/config/kind/multi-node-default.yaml
	./devops/config/kind/setup.sh

kind-ssh-control:
	docker exec -it kind-control-plane bash

kind-ssh-node0:
	docker exec -it kind-worker bash

kind-ssh-node1:
	docker exec -it kind-worker2 bash

kind-ssh-node2:
	docker exec -it kind-worker3 bash

vagrant-kind-ssh-control:
	vagrant ssh -c "sudo docker exec -it kind-control-plane bash"

vagrant-kind-ssh-node0:
	vagrant ssh -c "sudo docker exec -it kind-worker bash"

vagrant-kind-ssh-node1:
	vagrant ssh -c "sudo docker exec -it kind-worker2 bash"

vagrant-kind-ssh-node2:
	vagrant ssh -c "sudo docker exec -it kind-worker3 bash"

kind-load-cilium-image:
	docker pull cilium/cilium:v1.8.10
	kind load docker-image cilium/cilium:v1.8.10

k8s-kind-delete:
	kind delete cluster --name kind

k8s-minikube-start:
	minikube start --cni=cilium --memory=4096 # Only available for minikube >= v1.12.1
	minikube ssh -- sudo mount bpffs -t bpf /sys/fs/bpf

k8s-minikube-stop:
	minikube stop

vagrant-setup:
	vagrant plugin install vagrant-vbguest

vagrant-up:
	vagrant up

vagrant-ssh:
	vagrant ssh -c "cd /labs && sudo tmux a -t basevm -c || sudo tmux new -s basevm"

vagrant-down:
	vagrant halt

k8s-footloose-create:
	./devops/config/footloose/bootstrap.sh

k8s-footloose-delete:
	footloose stop -c ./devops/config/footloose/multi-node.yaml
	footloose delete -c ./devops/config/footloose/multi-node.yaml
	docker network rm footloose-cluster-cilium

footloose-ssh-node0:
	footloose ssh -c ./devops/config/footloose/multi-node.yaml root@cilium-node0

footloose-ssh-node1:
	footloose ssh -c ./devops/config/footloose/multi-node.yaml root@cilium-node1

footloose-ssh-node2:
	footloose ssh -c ./devops/config/footloose/multi-node.yaml root@cilium-node2

helm-repo-add:
	helm repo add cilium https://helm.cilium.io/

helm-install-cilium:
	helm install cilium cilium/cilium --version 1.10.3 --namespace kube-system

install-cilium:
	cilium install

test-cilium-setup:
	cilium status --wait
	cilium connectivity test

build-and-push-image:
	docker build -t agarwalconsulting/debian10:latest .
	docker push agarwalconsulting/debian10:latest

analyze-vxlan:
	tshark --color -i eth0 -d udp.port=8472,vxlan -f "port 8472"