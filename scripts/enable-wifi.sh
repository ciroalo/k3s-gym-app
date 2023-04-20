# Instlal net tools
sudo apt install net-tools

#determine if the kernel even recognizes the WIFI interface
nmcli d

#Is WIFI on? Should be default
ncmli r wifi on

#Connect
nmcli d wifi connect WIFI-NAME password PASSWOR