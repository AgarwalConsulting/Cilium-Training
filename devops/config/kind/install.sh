#!/usr/bin/env bash

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget bridge-utils tshark tcpdump ngrep jq silversearcher-ag-el less bpfcc-tools bpftool
