# 2026-08-07 10:43:30 by RouterOS 7.21.5
# system id = VcyVyglMg7N
#
/interface ethernet
set [ find default-name=ether1 ] comment="WAN -> Internet" \
    disable-running-check=no
set [ find default-name=ether2 ] comment="LAN -> R2-CORE" \
    disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/ip address
add address=10.0.0.1/30 comment="Transit to R2" interface=ether2 network=\
    10.0.0.0
add address=100.64.0.2/30 comment="WAN to ISP-R1" interface=ether1 network=\
    100.64.0.0
/ip dhcp-client
add interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat comment="NAT to ISP" out-interface=ether1
/ip route
add comment="Management VLAN" dst-address=192.168.10.0/24 gateway=10.0.0.2
add comment="Servers VLAN" dst-address=192.168.20.0/24 gateway=10.0.0.2
add comment="Users VLAN" dst-address=192.168.30.0/24 gateway=10.0.0.2
add comment="Guest VLAN" dst-address=192.168.40.0/24 gateway=10.0.0.2
add comment="Native VLAN" dst-address=192.168.99.0/24 gateway=10.0.0.2
add comment="Default Route to ISP" dst-address=0.0.0.0/0 gateway=100.64.0.1
/system identity
set name=R1-EDGE

