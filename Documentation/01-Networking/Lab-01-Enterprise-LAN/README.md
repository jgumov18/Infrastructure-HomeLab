# Lab 01 - Enterprise LAN Design

## Skills Covered

- Enterprise Network Design
- VLAN Planning
- IP Addressing
- Network Architecture
- Enterprise Topology Design

## Overview

This lab documents the design phase of the Infrastructure HomeLab project.

Before configuring any devices, the enterprise network was carefully designed following industry best practices. The goal was to create a scalable, secure, and modular infrastructure that can be expanded with additional services such as DHCP, NAT, OSPF, Docker, Kubernetes, and Infrastructure Automation.

---

# Objectives

- Design the enterprise network topology.
- Define the role of every network device.
- Create a scalable VLAN architecture.
- Prepare the infrastructure for future services.
- Build an enterprise-ready foundation.

---

# Enterprise Topology

> **Screenshot:** `screenshots/01-Full-Topology.png`

*(Insert the GNS3 topology screenshot here.)*

---

# Network Architecture

The network follows a hierarchical enterprise model.

```
                   Internet
                      │
                  R3 (ISP)
                      │
                 R1 (EDGE)
                      │
                 R2 (CORE)
                      │
                 SW1 (CORE)
                 /         \
        SW2 (ACCESS)   SW3 (ACCESS)
          │                 │
       Client PCs       Client PCs

                Ubuntu Server
```

---

# Device Roles

| Device | Role |
|----------|----------------------------|
| R3-ISP | Simulated Internet Provider |
| R1-EDGE | Enterprise Edge Router |
| R2-CORE | Core Router |
| SW1-CORE | Core Layer 2 Switch |
| SW2-ACCESS | Access Layer Switch |
| SW3-ACCESS | Access Layer Switch |
| Ubuntu Server | Infrastructure Server |
| PC01-PC10 | Enterprise Clients |

---

# VLAN Design

| VLAN | Name | Purpose |
|------|--------------|---------------------------|
| 10 | Management | Network device management |
| 20 | Servers | Infrastructure servers |
| 30 | Users | Client workstations |
| 40 | Guest | Guest devices |
| 99 | Native | Native VLAN for trunk links |

---

# IP Addressing Plan

| VLAN | Network | Gateway |
|------|----------------|----------------|
| VLAN10 | 192.168.10.0/24 | 192.168.10.1 |
| VLAN20 | 192.168.20.0/24 | 192.168.20.1 |
| VLAN30 | 192.168.30.0/24 | 192.168.30.1 |
| VLAN40 | 192.168.40.0/24 | 192.168.40.1 |
| VLAN99 | 192.168.99.0/24 | 192.168.99.1 |

---

## Design Decisions

- Separate Management, Server, User and Guest traffic.
- Use a dedicated Core Router.
- Use Core and Access switching layers.
- Reserve VLAN99 as the Native VLAN.
- Design the network for future scalability.

# Design Decisions

Several design decisions were made before implementation:

- Separate user, server, guest, and management traffic using VLANs.
- Use a dedicated Core Router for Layer 3 routing.
- Separate Core and Access switching layers.
- Reserve VLAN99 as the Native VLAN.
- Use a modular architecture to simplify future expansion.

---

# Technologies Planned

Networking

- MikroTik RouterOS
- VLAN
- IEEE 802.1Q
- Layer 2 Switching
- Inter-VLAN Routing
- DHCP
- NAT
- Static Routing
- OSPF

Linux & DevOps

- Ubuntu Server
- Docker
- Kubernetes
- Git
- GitHub
- Python
- Ansible

---

# Lessons Learned

A well-designed network significantly reduces implementation complexity.

Planning the topology, VLAN structure, IP addressing, and device roles before configuration makes troubleshooting easier and allows the infrastructure to scale without major redesign.

---

# Next Lab

**Lab 02 – Enterprise VLAN Switching**

In the next lab the logical network design will be implemented by configuring:

- Bridge interfaces
- VLAN Filtering
- Trunk Ports
- Access Ports
- Tagged/Untagged traffic
- PVID
- Enterprise Layer 2 Switching

---

**Status:** ✅ Completed