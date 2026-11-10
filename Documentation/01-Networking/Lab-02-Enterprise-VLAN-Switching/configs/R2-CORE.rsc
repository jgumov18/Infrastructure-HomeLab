# ============================================
# Infrastructure HomeLab
# Lab 02 - Enterprise VLAN Switching
# Device: R2-CORE
# Platform: MikroTik RouterOS CHR
# ============================================

# Configuration Export





# 2026-08-02 13:09:29 by RouterOS 7.21.5
# system id = 3s5DNSFTmwB
#
/interface ethernet set [ find default-name=ether1 ] disable-running-check=no
/interface ethernet set [ find default-name=ether2 ] disable-running-check=no
/interface ethernet set [ find default-name=ether3 ] disable-running-check=no
/interface ethernet set [ find default-name=ether4 ] disable-running-check=no
/interface ethernet set [ find default-name=ether5 ] disable-running-check=no
/interface ethernet set [ find default-name=ether6 ] disable-running-check=no
/interface ethernet set [ find default-name=ether7 ] disable-running-check=no
/interface ethernet set [ find default-name=ether8 ] disable-running-check=no
/interface vlan add interface=ether2 name=vlan10-mgmt vlan-id=10
/interface vlan add interface=ether2 name=vlan20-servers vlan-id=20
/interface vlan add interface=ether2 name=vlan30-users vlan-id=30
/interface vlan add interface=ether2 name=vlan40-guest vlan-id=40
/interface vlan add interface=ether2 name=vlan99-native vlan-id=99
/ip pool add name=pool1 ranges=192.168.10.100-192.168.10.200
/ip dhcp-server add address-pool=pool1 interface=ether2 name=dhcp1
/ip address add address=192.168.10.1/24 comment="Management Gateway" interface=vlan10-mgmt network=192.168.10.0
/ip address add address=192.168.20.1/24 comment="Servers Gateway" interface=vlan20-servers network=192.168.20.0
/ip address add address=192.168.30.1/24 comment="Users Gateway" interface=vlan30-users network=192.168.30.0
/ip address add address=192.168.40.1/24 comment="Guest Gateway" interface=vlan40-guest network=192.168.40.0
/ip address add address=192.168.99.1/24 comment="Native VLAN Gateway" interface=vlan99-native network=192.168.99.0
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=192.168.10.0/24 dns-server=8.8.8.8 gateway=192.168.10.1
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether1

