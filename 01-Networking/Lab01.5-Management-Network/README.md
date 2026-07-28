# Lab 01.5 – Building a Management Network

## Overview

The goal of this lab is to build a dedicated management network that allows the Ubuntu Desktop host to securely manage devices running inside the GNS3 topology.

This management network becomes the foundation for all future networking, Linux, Docker, Kubernetes and automation labs.

---

# Technologies Used

- Ubuntu Desktop
- Ubuntu Server
- MikroTik CHR
- GNS3
- Ethernet Switch
- Cloud Node
- TAP Interface
- DHCP
- SSH

---

# Objectives

- Connect Ubuntu Desktop to the GNS3 topology
- Configure a management network
- Obtain an IP address using DHCP
- Verify SSH connectivity
- Prepare the infrastructure for future labs

---

# Network Topology

```
                 Internet
                     │
                   NAT
                     │
             MikroTik ether1
                     │
             MikroTik ether2
                     │
             Ethernet Switch
      ┌──────────────┼──────────────┐
      │              │              │
 Ubuntu Server      VPCS       Cloud (tap0)
                                    │
                             Ubuntu Desktop
```

---

# Verification

```bash
ping 192.168.10.1

ssh gjgumov@192.168.10.199
```

Expected result:

- Successful SSH login
- Ubuntu Desktop can manage all devices inside the lab

---

# Lessons Learned

- Difference between Layer 2 and Layer 3
- Purpose of TAP interfaces
- GNS3 Cloud node
- DHCP troubleshooting
- SSH verification
- Enterprise management network design

---

# Next Lab

➡️ Lab 02 – Enterprise VLAN Fundamentals