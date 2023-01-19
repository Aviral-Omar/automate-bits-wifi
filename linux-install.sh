#! /bin/bash
if [ -d "/etc/NetworkManager/dispatcher.d" ]; then
	sudo cp autologin-linux /etc/NetworkManager/dispatcher.d
	sudo chown root:root /etc/NetworkManager/dispatcher.d/autologin-linux
	sudo chmod +x /etc/NetworkManager/dispatcher.d/autologin-linux
	sudo systemctl restart NetworkManager
elif [ -d "/etc/network/if-up.d" ]; then
	sudo cp autologin-linux /etc/network/if-up.d
	sudo chown root:root /etc/network/if-up.d/autologin-linux
	sudo chmod +x /etc/network/if-up.d/autologin-linux
	sudo systemctl restart systemd-networkd
fi
