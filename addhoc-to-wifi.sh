
sudo cp /etc/network/wifi-interfaces  /etc/network/interfaces
sudo systemctl enable dhcpcd.service
sudo systemctl start  dhcpcd.service
sudo systemctl status dhcpcd.service
sudo ifconfig wlan0 10.3.141.50 up
