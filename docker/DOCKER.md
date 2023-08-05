# Docker 


## Install Docker

First things first, we need to have docker installed in the computer. If you don't have it installed it before hand, you will need to follow the next commands.  

### Uninstall conflicting packages

```bash
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```


### Set up the repository
Update the apt package index and install packages to allow apt to use a repository over HTTPS:  
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

Add Docker’s official GPG key:  
```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Use the following command to set up the repository:
```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update the apt package index:
```bash
sudo apt-get update
```


### Install Docker Engine

To install the latest version run:  
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Verify that the Docker Engine installation is successful by running the hello-world image.

```bash
sudo docker run hello-world
```

This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

With this we will have succesfully installe docker.