# ============================================
# Infrastructure HomeLab
# Lab 02 - Enterprise VLAN Switching
# Device: SW1-CORE
# Platform: MikroTik RouterOS CHR
# ============================================

# Configuration Export







# 2026-08-02 13:38:04 by RouterOS 7.21.5
# system id = Qo/EiYP4DyK
#
/interface bridge add comment="Main Layer2 Bridge" name=bridge-LAN vlan-filtering=yes
/interface ethernet set [ find default-name=ether1 ] disable-running-check=no
/interface ethernet set [ find default-name=ether2 ] disable-running-check=no
/interface ethernet set [ find default-name=ether3 ] disable-running-check=no
/interface ethernet set [ find default-name=ether4 ] disable-running-check=no
/interface ethernet set [ find default-name=ether5 ] disable-running-check=no
/interface ethernet set [ find default-name=ether6 ] disable-running-check=no
/interface ethernet set [ find default-name=ether7 ] disable-running-check=no
/interface ethernet set [ find default-name=ether8 ] disable-running-check=no
/interface bridge port add bridge=bridge-LAN interface=ether1
/interface bridge port add bridge=bridge-LAN interface=ether2
/interface bridge port add bridge=bridge-LAN interface=ether3
/interface bridge port add bridge=bridge-LAN interface=ether4
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1,ether2,ether3,ether4 vlan-ids=10
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1,ether2,ether3,ether4 vlan-ids=20
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1,ether2,ether3,ether4 vlan-ids=30
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1,ether2,ether3,ether4 vlan-ids=40
/interface bridge vlan add bridge=bridge-LAN tagged=bridge-LAN,ether1,ether2,ether3,ether4 vlan-ids=99
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1

