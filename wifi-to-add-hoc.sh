
sudo cp /etc/network/adhoc-interfaces  /etc/network/interfaces
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
sudo systemctl status dhcpcd.service
sudo ifconfig wlan0 192.168.1.1 up
#sudo reboot
