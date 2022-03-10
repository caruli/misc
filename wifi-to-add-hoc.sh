
sudo cp /etc/network/adhoc-interfaces  /etc/network/interfaces
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
sudo systemctl status dhcpcd.service

