#!/usr/bin/env bash

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y bridge-utils tshark tcpdump ngrep jq silversearcher-ag-el
