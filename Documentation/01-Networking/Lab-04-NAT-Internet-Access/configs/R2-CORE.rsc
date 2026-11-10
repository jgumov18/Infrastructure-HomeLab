# 2026-08-07 10:42:44 by RouterOS 7.21.5
# system id = 3s5DNSFTmwB
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface vlan
add interface=ether2 name=vlan10-mgmt vlan-id=10
add interface=ether2 name=vlan20-servers vlan-id=20
add interface=ether2 name=vlan30-users vlan-id=30
add interface=ether2 name=vlan40-guest vlan-id=40
add interface=ether2 name=vlan99-native vlan-id=99
/ip pool
add name=POOL-VLAN30 ranges=192.168.30.100-192.168.30.200
add name=POOL-VLAN10 ranges=192.168.10.100-192.168.10.200
add name=POOL-VLAN20 ranges=192.168.20.100-192.168.20.200
add name=POOL-VLAN40 ranges=192.168.40.100-192.168.40.200
/ip dhcp-server
add address-pool=POOL-VLAN30 interface=vlan30-users lease-time=1d name=\
    DHCP-VLAN30
add address-pool=POOL-VLAN10 interface=vlan10-mgmt lease-time=1d name=\
    DHCP-VLAN10
add address-pool=POOL-VLAN20 interface=vlan20-servers lease-time=1d name=\
    DHCP-VLAN20
add address-pool=POOL-VLAN40 interface=vlan40-guest lease-time=1d name=\
    DHCP-VLAN40
/ip address
add address=192.168.10.1/24 comment="Management Gateway" interface=\
    vlan10-mgmt network=192.168.10.0
add address=192.168.20.1/24 comment="Servers Gateway" interface=\
    vlan20-servers network=192.168.20.0
add address=192.168.30.1/24 comment="Users Gateway" interface=vlan30-users \
    network=192.168.30.0
add address=192.168.40.1/24 comment="Guest Gateway" interface=vlan40-guest \
    network=192.168.40.0
add address=192.168.99.1/24 comment="Native VLAN Gateway" interface=\
    vlan99-native network=192.168.99.0
add address=10.0.0.2/30 comment="Transit to R1-EDGE" interface=ether1 \
    network=10.0.0.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=192.168.10.0/24 dns-server=8.8.8.8 gateway=192.168.10.1
add address=192.168.20.0/24 dns-server=8.8.8.8 gateway=192.168.20.1
add address=192.168.30.0/24 dns-server=8.8.8.8 gateway=192.168.30.1
add address=192.168.40.0/24 dns-server=8.8.8.8 gateway=192.168.40.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add comment="Default Route to R1-EDGE" dst-address=0.0.0.0/0 gateway=10.0.0.1

