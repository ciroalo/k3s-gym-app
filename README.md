# k3s-gym-app

This application is a test application to understand kubernetes.

Contents
---
  * [Preface](#preface)
  * [Server](#server)
  * [Configurar .gitignore](#gitignore)
  

<div id='preface'/>

Preface
---
One of the most important things for this project is to create a server.

Then creating and application that will help me get track of my gym status.

Create a k3s cluster to run the application.

Track information of the nodes and cluster.


<div id='server'/>

Server
---
For cable:
```bash
ssh ciro@192.168.1.136
```
For wifi:
```bash
ssh ciro@192.168.1.53
```
ciro:usuario

I created a server from and old laptop I had laying around. Specs:

![screenfetch](imgs/screenfetch.png)

It had a broken battery, and sometimes in my house power goes out. So one of the important things to take into accont is how to instantly run the application again just by connecting the power to the server.

At first it had Windows 8 OS, but for the purpose of this app, i deleted it and run Ubuntu Server 22.

### Installing dependencies
Because i was stupid, i didnt install docker at the start where it asks you if you want it pre-installed, but i declined.
So in this case, i am gonna give the commands i used to download docker.

```bash
sudo apt-get update
```
```bash
sudo apt install docker.io
```
```bash
sudo snap install docker
```

And now if we run the command
```bash
docker --version
```
we should be able to see the version of the docker we are running.


### Turn on wifi:

To turn on wifi first we have to check if we have a Wi-Fi interface card. For this, we run the commando:
```bash
ls -l /sys/class/net
```

![wifi-interface](imgs/wifi-interface.png)  
Wi-Fi interface cards start with the letter w. In this case, the Wi-Fi interface card name is *wlo1*.

Now we have to change the wifi configuration file, but first we are gonna make a copy of the original just in case things go wrong we can revert to the original state.

```bash
$ sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-install-config.original.yaml
```
Here we can check that it was created correctly. 
![ls-config-file](/imgs/ls-config-file.png)

To change the file we use:
```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

Now interchange the info with this template.
```yaml
network:
 version: 2 
 wifis:
   wlo1:
     access-points:
       Mywifi1:
         password: yourpassword1
       Mywifi2:
         password: yourpassword2
     dhcp4: true
```
OBS: Be careful with the indentation, in yaml indentation are 2 spaces.

Reboot and you should be able to see the ip of the wifi card.

### Desable default lid actions
Because i dont want the lapton open all the time in my living room, i am gonna disable the lid functions that shutdown, or suspend the system after the lid is closed. To change that we are gonna need to run the following commands on the server:
```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
```bash
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
```
# Replace whatever values of following to "ignore"
HandleHibernateKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

The only thing left to do is to restart the system
```bash
systemctl restart systemd-logind
```


### Creating virtual machines
To create the virtual machines in the server, we are gonna use `Multipass`. Multipass is a lightweight VM manager for linux, etc. 
Since it supports metadata for cloud-init, you can simulate a small cloud deployment on your laptop or workstation. The installation is pretty easy.

```bash
sudo snap install multipass
```