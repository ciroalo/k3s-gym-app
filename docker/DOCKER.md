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

## Run Docker without sudo
If you don't want to preface the `docker` command with sudo, create a Unix group called `docker` and add users to it. When the Docker Daemon starts, it creates a Unix sock accesible by members of the `docker` group. On some Linux distributions, the system automatically does it for you. In that case there's no need for you to manually create the group.

To create the `docker` group and add your user:
1. Create the docker group:
```bash
sudo groupadd docker
```

2. Add your user to the `docker` group:
```bash
sudo usermod -aG docker $USER
```

3. Log out and log back in for changes to be instated or run the following command:
```bash
newgrp docker
```

4. Verify that is working with the following command from before:
```bash
docker run hello-world
```

## Publishing image to Docker Hub
After building our first image `simple-flask-app` we are able to share it on Docker Hub. Docker Hub is a
service that provides a repository for storing and sharing Docker images. This will be later useful
when selecting the image in yaml file.

If you don't have an account, you can create a [Docker ID](https://hub.docker.com/signup) for free if you 
don't have one.

### Create a new repository
To push an image, first you need to create a repository on Docker Hub for it.

1. Sign up or Sign in to Docker Hub.

2. Select the **Create Repository** button. 

3. For the repo name, use the same you were using for your docker image. Make sure the visibility is `Public`.

4. Click the **create** button.


### Push the image

1. Login to the Docker Hub through the terminal using the command.
```bash
docker login -u <user-name>
```

2. User the `docker tag` command to give the `simple-flask-app` image a new name. Because my docker username is **ciroalonso** in my case it looks like this.

```bash
docker tag simple-flask-app ciroalonso/simple-flask-app
```

3. Push the image to the repository.

```bash
docker push ciroalonso/simple-flask-app
```

And with this we will have the image available in the cloud.
You can also add a tag to do version control, in our case, because we didn't add a version, it will have the `latest` tag, which is the tag by default.


### Port Binding
An application inside a container runs in an isolated Docker network. At the same time, when you create or run a container, the container doesn't expose any of it's port to the outside world by default. We need to expose the container por to the host using the `--publish` or `-p` flag, with the format `-p <host_port>:<container_port>` to make a port available to services outside of Docker. This creates a firewall rule in the host, mapping a container port to a port on the DOcker host to the outside world.

In the case of the `simple-flask-app`, because the default port for Flask is 5000, we are exposing the port 5000 in the Docker container, and then mapping the Docker port 5000 to our port 9000 in the following command.

```bash
docker run -p 9000:5000 simple-flask-app
```

Now we can access the `simple-flask-app` by accessing *localhost:9000* in our computer browser.

It's standard to use the same port on your host as container is using, but it's not requiered.