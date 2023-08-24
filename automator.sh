#!/bin/bash

function unisoft {
        echo Install unisoft
	apt update && apt install -y screenfetch htop ncdu mc lnav iotop iftop python3-pip nscd \
	p7zip-rar p7zip-full bash-completion net-tools
}

function hypersoft {
        echo Install hypersoft
        apt update && apt install -y install qemu-kvm qemu-utils libvirt-daemon-system libvirt-clients \
	bridge-utils cpu-checker libvirt-daemon-driver-storage-zfs
}

function hardsoft {
        echo Install soft for hardware systems
        apt update && apt install -y lm-sensors smartmontools
}

function configssh {
        echo change ssh config
        sed -i -e 's/^.\{0,3\}PasswordAuthentication.\{2,6\}$/PasswordAuthentication no/' /etc/ssh/sshd_config
	sed -i -e 's/^.\{0,3\}PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
	systemctl restart sshd.service
}

while true; do
	read -p 'Chooce what you want. Type number
	1. Install standart soft for all systems
	2. Install soft for kvm hypervisor
	3. Install soft for hardware systems
	4. Change ssh config (disabple pass auth and disable root auth)
	5. exit
	' choice

	case $choice in
		1 ) unisoft ;;
		2 ) hypersoft;;
		3 ) hardsoft;;
		4 ) configssh;;
		5 ) exit;;
		6 ) exit;;
		* ) echo "Please type your choice";;
	esac
done


