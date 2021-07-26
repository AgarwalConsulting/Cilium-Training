# Commands

Some command references, to be used during training...

```bash
## IP

ip addr

ip link

ip netns list

## Bridge

bridge vlan

brctl show

## BPF

bpftool net

## Networking Analyzing

iptables-save

ip route

iptables --list

tshark --color -i <brxxx> -d udp.port=8472,vxlan -f "port 8472" # For analyzing VXLAN packets
```
