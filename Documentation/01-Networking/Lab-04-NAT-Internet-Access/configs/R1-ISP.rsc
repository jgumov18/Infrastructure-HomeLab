# 2026-08-07 10:44:24 by RouterOS 7.21.5
# system id = R9ghipEuOtG
#
/interface ethernet
set [ find default-name=ether1 ] comment="Future Internet" \
    disable-running-check=no
set [ find default-name=ether2 ] comment="Transit -> R1-EDGE" \
    disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/ip address
add address=100.64.0.1/30 comment="Transit to R1-EDGE" interface=ether2 \
    network=100.64.0.0
/ip dhcp-client
add interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat comment="NAT to GNS3 Internet" \
    out-interface=ether1
/ip route
add comment="Enterprise Network Summary" dst-address=192.168.0.0/16 gateway=\
    100.64.0.2
add comment="Transit Network to R2" dst-address=10.0.0.0/30 gateway=\
    100.64.0.2
/system identity
set name=ISP-R1

