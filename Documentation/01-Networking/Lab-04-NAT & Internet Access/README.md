# Lab 04 – NAT & Internet Access

## Overview

In this lab, I implemented Internet connectivity for the Enterprise network by introducing an Edge Router, an ISP Router, Static Routing, Default Routes, and Source NAT (Masquerade).

The objective was not only to configure NAT, but also to understand how packets travel from an internal client to the Internet and back, while following a realistic Enterprise network architecture.

---

## Objectives

- Build an Enterprise Edge topology
- Configure an ISP Router
- Configure an Edge Router
- Create transit networks between routers
- Configure Static Routes
- Configure Default Routes
- Configure Route Summarization
- Configure Source NAT (Masquerade)
- Provide Internet access to Enterprise clients
- Verify end-to-end connectivity
- Perform troubleshooting and packet flow analysis

---

## Network Topology

```

Internet
│
GNS3 NAT Node
│
ISP-R1
100.64.0.1/30
│
100.64.0.2/30
R1-EDGE
10.0.0.1/30
│
10.0.0.2/30
R2-CORE
│
Enterprise VLANs
│
PC Clients

```

---

## IP Addressing

| Device | Interface | IP Address |
|----------|-----------|------------|
| ISP-R1 | ether1 | DHCP |
| ISP-R1 | ether2 | 100.64.0.1/30 |
| R1-EDGE | ether1 | 100.64.0.2/30 |
| R1-EDGE | ether2 | 10.0.0.1/30 |
| R2-CORE | ether1 | 10.0.0.2/30 |
| VLAN10 | Gateway | 192.168.10.1/24 |
| VLAN20 | Gateway | 192.168.20.1/24 |
| VLAN30 | Gateway | 192.168.30.1/24 |
| VLAN40 | Gateway | 192.168.40.1/24 |
| VLAN99 | Gateway | 192.168.99.1/24 |

---

## Routing Design

### R2-CORE

Configured:

- Connected Routes
- Default Route pointing to R1-EDGE

```

0.0.0.0/0
↓
10.0.0.1

```

---

### R1-EDGE

Configured:

- Connected Routes
- Static Routes for all Enterprise VLANs
- Default Route pointing to ISP-R1

```

192.168.10.0/24 → 10.0.0.2
192.168.20.0/24 → 10.0.0.2
192.168.30.0/24 → 10.0.0.2
192.168.40.0/24 → 10.0.0.2
192.168.99.0/24 → 10.0.0.2

```

Default Route

```

0.0.0.0/0
↓
100.64.0.1

```

---

### ISP-R1

Configured:

- Connected Routes
- Enterprise Route Summary

```

192.168.0.0/16
↓
100.64.0.2

```

Transit Network

```

10.0.0.0/30
↓
100.64.0.2

```

Internet Default Route obtained via DHCP.

---

## NAT Configuration

### R1-EDGE

Configured Source NAT using Masquerade.

```

chain=srcnat
action=masquerade
out-interface=ether1

```

Purpose:

Translate all Enterprise private IP addresses before leaving the Enterprise network.

---

### ISP-R1

Since this lab uses the GNS3 NAT Node, an additional Masquerade rule was required.

```

chain=srcnat
action=masquerade
out-interface=ether1

```

This configuration enables Internet access inside the GNS3 laboratory environment.

> Note:
>
> In a real ISP environment, the ISP router would **not** perform NAT for customer traffic. The second NAT rule exists only because GNS3 NAT Node requires it.

---

## Packet Flow

```

PC1
192.168.30.x
│
▼
R2-CORE
│
▼
R1-EDGE
│
Source NAT
│
▼
ISP-R1
│
Masquerade (Lab Environment)
│
▼
Internet

```

---

## Verification

Successfully verified:

- R2 → R1 connectivity
- R1 → ISP connectivity
- ISP → Internet connectivity
- Default Routing
- Static Routing
- NAT Translation
- DHCP Address Assignment
- PC1 Internet Access

Successful test:

```

PC1 > ping 8.8.8.8

```

Result:

```

Success

```

---

## Troubleshooting Process

During the lab several issues were identified and resolved:

- Missing Static Routes
- Missing Transit Route on ISP-R1
- Missing Default Route
- Missing NAT rule on ISP-R1
- DHCP lease expiration on VPCS client
- Internet connectivity verification

The troubleshooting process followed a structured approach by validating:

1. Layer 1 Connectivity
2. Layer 3 Connectivity
3. Routing
4. NAT
5. DHCP
6. End-to-End Connectivity

---

## Files

### Configurations

- configs/R2-CORE.rsc
- configs/R1-EDGE.rsc
- configs/ISP-R1.rsc

---

### Screenshots

- Topology
- ISP IP Addresses
- ISP Routing Table
- ISP DHCP Client
- ISP NAT
- R1 IP Addresses
- R1 Routing Table
- R1 NAT
- R2 IP Addresses
- R2 Routing Table
- R2 DHCP Leases
- PC1 IP Configuration
- PC1 Internet Connectivity

---

## Knowledge Gained

After completing this lab I can:

- Explain Enterprise Edge architecture
- Configure Static Routing
- Configure Default Routes
- Configure Route Summarization
- Configure Source NAT (Masquerade)
- Explain packet flow through multiple routers
- Troubleshoot routing problems
- Troubleshoot NAT issues
- Verify Internet connectivity
- Build an Enterprise Internet Edge using MikroTik RouterOS

---

# Interview Questions

### What is NAT?

Network Address Translation (NAT) translates private IP addresses into public IP addresses, allowing internal devices to access external networks while conserving public IPv4 addresses.

---

### What is Source NAT (SNAT)?

Source NAT modifies the source IP address of outgoing packets before they leave the internal network.

---

### What is Masquerade?

Masquerade is a dynamic form of Source NAT that automatically uses the IP address assigned to the outgoing interface. It is commonly used when the WAN IP address is obtained dynamically.

---

### Why is NAT configured on the Edge Router?

The Edge Router represents the boundary between the private Enterprise network and the external network. All outbound traffic passes through it before reaching the ISP.

---

### What is a Default Route?

A Default Route (0.0.0.0/0) tells the router where to forward traffic when no more specific route exists.

---

### Why were Static Routes required?

Static Routes allow the Edge Router to reach all internal VLAN networks located behind the Core Router.

---

### What is Route Summarization?

Route Summarization combines multiple smaller routes into a single larger route, reducing routing table size and simplifying route management.

---

### Why was Double NAT required in this lab?

Double NAT was necessary because the GNS3 NAT Node provides Internet connectivity through an additional private network. This requirement is specific to the laboratory environment and would not normally exist in a real ISP deployment.

---

### What is Connection Tracking?

Connection Tracking is a RouterOS feature that monitors active network sessions and allows NAT and Firewall rules to correctly process return traffic.

---

### How would you troubleshoot a client that cannot access the Internet?

1. Verify Layer 1 connectivity.
2. Check IP addressing.
3. Verify Default Gateway.
4. Check Routing Tables.
5. Verify NAT configuration.
6. Test connectivity hop-by-hop.
7. Validate Internet access from the Edge Router.
8. Check DHCP configuration if the client has no IP address.

---

## Conclusion

This lab introduced the complete Enterprise Internet Edge architecture using MikroTik RouterOS.

The implementation covered routing, NAT, Internet connectivity, and systematic troubleshooting while following networking best practices used in real Enterprise environments.