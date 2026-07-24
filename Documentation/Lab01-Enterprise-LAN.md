# Lab 01 - Enterprise LAN with MikroTik CHR

## Overview

In this lab, I built a small enterprise-style LAN using MikroTik CHR inside GNS3. The network provides DHCP services, routing, NAT and Internet access for all connected devices.

---

## Objectives

- Build a routed LAN
- Configure DHCP
- Configure NAT
- Verify Internet connectivity
- Practice MikroTik RouterOS

---

## Lab Topology

```text
Internet
    │
 GNS3 NAT
    │
MikroTik CHR
    │
Ethernet Switch
├── Ubuntu Server
├── PC1
└── PC2
```

---

## Environment

| Component | Technology |
|-----------|------------|
| Host OS | Ubuntu 24.04 Desktop |
| Virtualization | VMware Workstation |
| Network Emulator | GNS3 |
| Router | MikroTik CHR |
| Server | Ubuntu Server |
| Clients | VPCS |

---

## IP Addressing

| Device | Address |
|---------|---------|
| MikroTik LAN | 192.168.10.1/24 |
| DHCP Pool | 192.168.10.100-200 |
| Ubuntu Server | DHCP |
| PC1 | DHCP |
| PC2 | DHCP |

---

## Configuration

### WAN

- DHCP Client on ether1

### LAN

- IP Address: 192.168.10.1/24
- Interface: ether2

### DHCP

Configured DHCP Server with automatic IP assignment.

### NAT

Configured masquerade rule to allow Internet access.

---

## Verification

Successfully verified:

- DHCP leases
- Internet connectivity
- Default Gateway
- NAT
- Routing

---

## Skills Practiced

- IPv4 Networking
- DHCP
- NAT
- Routing
- MikroTik RouterOS
- Enterprise LAN Design
- Basic Troubleshooting

---

## Commands Used

```routeros
/ip address print
/ip route print
/ip dhcp-server lease print
/ip firewall nat print
```

---

## Result

Successfully built an enterprise LAN with Internet connectivity for all devices.

---

## Next Lab

Linux Administration
