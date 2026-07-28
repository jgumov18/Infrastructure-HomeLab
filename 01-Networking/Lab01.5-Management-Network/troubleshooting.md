# Troubleshooting

## Problem

Ubuntu Desktop could not reach Ubuntu Server over SSH.

---

## Root Cause

The Ubuntu Desktop host was not connected to the same Layer 2 network as the lab devices.

---

## Investigation

The following components were verified:

- SSH service
- IP addressing
- DHCP server
- Routing
- GNS3 Cloud configuration
- TAP interface
- Ethernet Switch

---

## Resolution

1. Created a TAP interface.
2. Added the TAP interface to the GNS3 Cloud node.
3. Connected the Cloud node to the Ethernet Switch.
4. Obtained an IP address from the MikroTik DHCP server.
5. Verified SSH connectivity.

---

## Verification

```bash
ping 192.168.10.199

ssh gjgumov@192.168.10.199
```