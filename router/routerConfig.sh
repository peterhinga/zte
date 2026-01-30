#!/bin/sh
# change these. especially GATEWAY
DNS_SERVER="8.8.8.8"
GATEWAY="10.42.0.1"

echo "Based on the output chose a lan interface to convert into wan" 

# checks interfaces under bridge
brctl show

echo "Enter a lan interface e.g eth0:"

read interface

echo "$interface has been chosen"

# remove interface from bridge

brctl delif br0 $interface

# bring interface down and clear ip
ifconfig $interface down

echo "Assign ip: if gateway is $GATEWAY it will be something like 10.42.0.2"
read ipUse

# configuring a static ip to the new wan 
ifconfig $interface $ipUse netmask 255.255.255.0 up

# Delete an existing route 
ip route del default

#adding a new route
ip route add default via $GATEWAY dev $interface

# verify the route 
ip route show

# setting DNS
echo "nameserver 10.42.0.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# enable ip forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# enabling nat with some iptable s
iptables -t nat -A POSTROUTING -o $interface -j MASQUERADE
iptables -A FORWARD -i br0 -o $interface -j ACCEPT
iptables -A FORWARD -i $interface -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT
