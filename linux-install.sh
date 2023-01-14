#! /bin/bash
if [ -d "/etc/NetworkManager/dispatcher.d" ]
then
	sudo cp autologin /etc/NetworkManager/dispatcher.d
	sudo chown root:root /etc/NetworkManager/dispatcher.d/autologin
	sudo chmod +x /etc/NetworkManager/dispatcher.d/autologin
	sudo systemctl restart NetworkManager
elif [ -d "/etc/network/if-up.d" ]
then
	sudo cp autologin.sh /etc/network/if-up.d
	sudo chown root:root /etc/network/if-up.d/autologin
	sudo chmod +x /etc/network/if-up.d/autologin
	/etc/init.d/network-manager restart
fi
