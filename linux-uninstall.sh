#! /bin/bash
if [ -d "/etc/NetworkManager/dispatcher.d" ]
then
	sudo rm /etc/NetworkManager/dispatcher.d/autologin
elif [ -d "/etc/network/if-up.d" ]
then
	sudo rm /etc/network/if-up.d/autologin
fi
