# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "debian/buster64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./", "/labs"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "3072"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vagrant.plugins = ["vagrant-vbguest"]

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    # Install the latest version of tools
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude bridge-utils python2.7 python-setuptools apt-transport-https ca-certificates curl wget time software-properties-common python3-pip virtualenv python3-setuptools gnupg gnupg-agent tcpdump ngrep tshark silversearcher-ag-el bpfcc-tools ipython fzf vim dnsutils jq golang-go git libpcap0.8 libpcap0.8-dev

    # Install and configure docker
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io
    systemctl enable docker

    # Install kind
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    mv ./kind /some-dir-in-your-PATH/kind

    # Install footloose
    curl -Lo footloose https://github.com/weaveworks/footloose/releases/download/0.6.3/footloose-0.6.3-linux-x86_64
    chmod +x footloose
    mv footloose /usr/local/bin/

    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    # Install cilium cli
    curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz{,.sha256sum}
    sha256sum --check cilium-linux-amd64.tar.gz.sha256sum
    sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
    rm cilium-linux-amd64.tar.gz{,.sha256sum}

    # Install hubble cli
    export HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt)
    curl -L --remote-name-all https://github.com/cilium/hubble/releases/download/$HUBBLE_VERSION/hubble-linux-amd64.tar.gz{,.sha256sum}
    sha256sum --check hubble-linux-amd64.tar.gz.sha256sum
    sudo tar xzvfC hubble-linux-amd64.tar.gz /usr/local/bin
    rm hubble-linux-amd64.tar.gz{,.sha256sum}

    # Pull image for footloose
    docker pull agarwalconsulting/debian10:latest
  SHELL
end
