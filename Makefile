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
	vagrant ssh -c "sudo su -"

vagrant-tssh:
	vagrant ssh -c "cd /labs && sudo tmux a -t basevm || sudo tmux new -s basevm"

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
	helm install -n kube-system -f devops/cilium/values.yaml cilium cilium/cilium --version 1.10.3

helm-update-cilium:
	helm upgrade -n kube-system -f devops/cilium/values.yaml cilium cilium/cilium --version 1.10.3

helm-uninstall-cilium:
	helm remove -n kube-system cilium

install-cilium:
	cilium install

uninstall-cilium:
	cilium uninstall

test-cilium-setup:
	cilium status --wait
	cilium connectivity test

build-and-push-image:
	docker build -t agarwalconsulting/debian10:latest .
	docker push agarwalconsulting/debian10:latest

analyze-vxlan:
	tshark --color -i eth0 -d udp.port=8472,vxlan -f "port 8472"

deploy-rv-store:
	ls ./examples/03-rvstore/*.yaml | xargs -n 1 kubectl apply -f

remove-rv-store:
	ls ./examples/03-rvstore/*.yaml | xargs -n 1 kubectl delete -f

deploy-prom-graf:
	kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/v1.10/examples/kubernetes/addons/prometheus/monitoring-example.yaml

remove-prom-graf:
	kubectl delete -f https://raw.githubusercontent.com/cilium/cilium/v1.10/examples/kubernetes/addons/prometheus/monitoring-example.yaml

k8s-pf-grafana-ui:
	kubectl -n cilium-monitoring port-forward service/grafana --address 0.0.0.0 --address :: 3000:3000

k8s-pf-hubble-ui:
	kubectl port-forward -n kube-system svc/hubble-ui --address 0.0.0.0 --address :: 12000:80

k8s-pf-hubble-relay:
	kubectl port-forward -n kube-system svc/hubble-relay --address 0.0.0.0 --address :: 4245:80
