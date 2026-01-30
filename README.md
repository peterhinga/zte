# ZTE f609

## AIM: Convert one of the LAN ports in ZTE f609 router to WAN port.

## Introduction
I have one of this fibre routers in my case its ZTE F609 which lacks a WAN port and has been collecting dust in my shelf.So I have been 
thinking of putting it to good use( as a secondary router) but this required me purchasing a Netlink HTB-1100S 10/100M Single-mode Fiber Optic Ethernet MEdia Converter
which is the average price of a new router....yeah it won't make sense in me buying it.Finally I got an Idea is it possible to convert a LAN port into WAN ?.This led me
to a lot of googling where some websites mentioned something like changing the vlan of a LAN port to 0 which my router i couldn't seem to find these settings.

## Requirements
<ol>
  <li>Shell access to the router on ZTE f609 this is present login details are root:Zte521</li>
  <li>brctl, ip and ifconfig binaries in the router</li>
  <li>Source of internet for this I used my laptop running pop os</li>
  <li>Coffee</li>
</ol>

## <b>NOTE<n> 
This code was written specifically for ZTE f609 it may require you to tweak it a little bit and also if the router reboots changes are lost.

##Instructions

```
# clone the repository
git clone https://github.com/peterhinga/zte
# transfer the script file in the router folder to your router
chmod +x routerConfig.sh
# run the script
./routerConfig.sh
```
upon running the script
<ol>
  <li>Make sure you modify the GATEWAY in the script.</li>
  <li>type the LAN port you want to configure to WAN e.g eth0, eth1, or ethX</li>
  <li>Type an IP to be assigned to the router</li>
</ol>
On your linux laptop set the etherent connection to be shared to other computers and plug the cable to the lan port which you modified with script.

## Contributions
Contributions are welcome just do a PR.
