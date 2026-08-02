# ============================================
# Infrastructure HomeLab
# Lab 02 - Enterprise VLAN Switching
# Device: SW2-ACCESS
# Platform: MikroTik RouterOS CHR
# ============================================

# Configuration Export







# 2026-08-02 13:38:54 by RouterOS 7.21.5
# system id = iqzlDqueM0L
#
/interface bridge add comment="SW2 Layer2 Bridge" name=bridge-LAN vlan-filtering=yes
/interface ethernet set [ find default-name=ether1 ] disable-running-check=no
/interface ethernet set [ find default-name=ether2 ] disable-running-check=no
/interface ethernet set [ find default-name=ether3 ] disable-running-check=no
/interface ethernet set [ find default-name=ether4 ] disable-running-check=no
/interface ethernet set [ find default-name=ether5 ] disable-running-check=no
/interface ethernet set [ find default-name=ether6 ] disable-running-check=no
/interface ethernet set [ find default-name=ether7 ] disable-running-check=no
/interface ethernet set [ find default-name=ether8 ] disable-running-check=no
/interface bridge port add bridge=bridge-LAN interface=ether1
/interface bridge port add bridge=bridge-LAN interface=ether2 pvid=30
/interface bridge port add bridge=bridge-LAN interface=ether3 pvid=30
/interface bridge port add bridge=bridge-LAN interface=ether4 pvid=30
/interface bridge port add bridge=bridge-LAN interface=ether5 pvid=30
/interface bridge port add bridge=bridge-LAN interface=ether6 pvid=30
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1 vlan-ids=10
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1 vlan-ids=20
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1 vlan-ids=40
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1 vlan-ids=99
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1 untagged=ether2,ether3,ether4,ether5,ether6 vlan-ids=30
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1

