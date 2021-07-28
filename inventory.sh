#!/bin/bash

#Description: Inventory System
#Author: Stephanie
#Date: 7/28/2021

##Check the OS version

os=$(cat /etc/*release | head -1)
echo " The OS version is ${os} "

sleep 1

#Check the memory size

mem=$(free -m | grep Mem | awk '{print$2}')
echo "The total memory size is ${mem}"

sleep 1

##The size of the hard drive

hd=$(lsblk | grep disk | awk '{print$4}')
echo "The hard disk drive size is ${hd}"

sleep 1

#The cpu speed

cp_sp=$(lscpu | grep "CPU MHZ" | awk '{print$3}')
echo "The cpu speed is ${cp_sp} MHz"

sleep 1

#The kernel version

knv=$(uname -r | awk -F '{print$1}')
echo "The kernel version is ${knv}"

sleep 1

#Check the number of bits

echo "The system has $(arch | awk -F_ '{print$2}') bits"

sleep 1

#The hostname

echo "The hostname is $HOSTNAME"

#The ip address

ip=$(ip address show dev enp0s3 | grep inet | head -1 | awk '{print$2}')
echo " The ip address is ${ip} "

sleep 1

#All open ports

echo "Here are all the opened port
$(ss -tulpn | grep LISTEN)"

sleep 1

#The DNS

echo "The DNS address is
$(cat /etc/resolv.conf | grepnameserver)"

sleep 1

#Check the manufacturer
echo " The manufacturer is $(dmidecode -t system | grep Manufacturer | awk '{print$2}')

sleep 1

#Virtual or physical system

echo " This is a $(dmidecode -t system | grep Family | awk '{print$2,$3}') "

sleep 1

#The mac address

echo "The system mac address is $(ip address show dev enps03 | grep ether | awk '{print$2}')"

sleep 1
exit 0


