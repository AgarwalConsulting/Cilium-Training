# K8s Networking, Observability and Security with Cilium – 2 Days + 1 Day (Advanced)

## Prerequisites

- Participants should have some working knowledge on Linux OS commands
- Familiarity with Docker networking
- Good experience with Kubernetes
- Some networking Familiarity

## Audience

- This course is designed for
  - System Administrators
  - DevOps Engineers
  - Network Engineers
  - SREs
  - Cloud Engineers
  - Security Engineers

## Objectives

- Learn about Cilium and its design
- Understand Network Policies of K8s for inter-pod connectivity
- Securing K8s with Cilium
- Integrate Cilium with Istio
- Setting up L3-L7 Network policies

## Course Outline

### Day 1

- Need for Cilium

  - Features offered

- Introduction to Cilium

  - Install the Cilium CLI
  - Cluster Setup
  - Install Cilium
  - Installing Cilium with Helm Charts
  - Validating Installation

- Component Overview

  - Cilium Agent
  - Cilium Client
  - Operator
  - Hubble
  - Data Agent

- Networking with cilium

  - eBPF Datapath
  - Routing with VXLAN
  - IP Address Management (IPAM)

    - Cluster Scope
    - Kubernetes Host Scope
    - Cilium Container Networking Control Flow

- Network Security with cilium

  - `NetworkPolicy`
  - `CiliumNetworkPolicy`
  - `CiliumClusterwideNetworkPolicy`
  - `Allow` and `Deny` Policies

### Day 2

- Layer 3 policy

  - Label Based
  - Services Based

- Layer 4 Policy

  - Limit ingress/egress ports
  - Labels-dependent Layer 4 rule
  - CIDR-dependent Layer 4 Rule

- Layer 7 policy

  - HTTP Path based

- Observability with cilium

  - Cilium Metrics
  - Event monitoring with metadata
  - Policy decision tracing
  - Metrics export via Prometheus
  - Introduction to Hubble
  - Hubble Configuration
  - Setting up Hubble Metrics with Grafana

- Troubleshooting

  - Component & Cluster Health
  - Observing flows of Pods
  - Checking cluster connectivity health
  - Monitoring Datapath State
  - Policy Troubleshooting

### Day 3 (Only for Advanced course)

- Cilium Istio integration

  - Istio Architecture
  - How integration works
  - Install Cilium-Istioctl
  - Deploying Sample app
  - Cilium’s L3-L7 network security policies
  - Istio’s service route rules

- Advanced Networking with Cilium

  - Using `kube-router` to run BGP
  - Expose the `Cilium etcd` to other clusters
  - Establish connections between clusters
  - `Pod` connectivity between clusters
  - Kubernetes without `kube-proxy`

- Exploring Bandwidth Manager

  - TCP congestion control algorithm
  - Traffic control queueing discipline
  - Limitations

- Cilium Multi-Cluster

  - What is ClusterMesh
  - Use cases of ClusterMesh
  - Setting up the Control plane

    - Requirements
    - Architecture

  - Pod IP Routing

    - Tunneling mode
    - Direct-routing mode
    - Hybrid-routing mode

- Service Discovery in Multi-Cluster
- Multi-cluster network policy

## Machine Requirements

- Minimum Specs
  - 16 GB RAM
  - 8-core i7 or higher
- Any OS (MacOS, Windows or Linux)

## Pre Setup

- Install `docker`
- Install `kubectl`
- Install `helm`
- Install `kind`

We will be using a [`kind` based](https://docs.cilium.io/en/v1.10/gettingstarted/kind/) kubernetes cluster to setup our environment.
