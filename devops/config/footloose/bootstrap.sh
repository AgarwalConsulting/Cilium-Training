#!/bin/sh

docker network create footloose-cluster-cilium

# make sure we have an up-to-date image for the footloose nodes
docker pull agarwalconsulting/debian10:latest

footloose -c ./devops/config/footloose/multi-node.yaml create

# set up k3s on node0 as the master
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node0 -- "INSTALL_K3S_EXEC='--flannel-backend=none --no-flannel' ./cilium-k3s.sh"

# # get the token from node0
export k3stoken=$(footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node0 -- cat /var/lib/rancher/k3s/server/node-token)

# # set up k3s on node1 and node2 with the token from node0
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node1 -- "env INSTALL_K3S_SKIP_DOWNLOAD=true env K3S_URL=https://cilium-node0:6443 env K3S_TOKEN=$k3stoken /root/install-k3s.sh"
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node2 -- "env INSTALL_K3S_SKIP_DOWNLOAD=true env K3S_URL=https://cilium-node0:6443 env K3S_TOKEN=$k3stoken /root/install-k3s.sh"

# Sharing the /sys/fs/bpf directory between nodes with the host Docker VM is turning out to be a challenge on Mac/Windows!
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node0 -- "sudo mount bpffs -t bpf /sys/fs/bpf"
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node1 -- "sudo mount bpffs -t bpf /sys/fs/bpf"
footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node2 -- "sudo mount bpffs -t bpf /sys/fs/bpf"

footloose -c ./devops/config/footloose/multi-node.yaml ssh root@cilium-node0 -- "kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.8/install/kubernetes/quick-install.yaml"
