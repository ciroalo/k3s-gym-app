# Kubernetes

Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications. Kubernetes provides you with a framework to run distributed systems resiliently. It takes care of scaling and failover for your application, provides deployment patterns, and more.


## Installing minikube
Because Kubernetes has a very high need of resources, sometimes it's complicated, even impossible, to replicate the whole system. For that we can use minikube. Minikube is a k8s platform that lets you create a single node that will act as the master and the worker. In this node you can test actual code. 

To install minikube, follow the steps of this [page](https://minikube.sigs.k8s.io/docs/start/)

### Observation
To make your life easier, you can add the following to your shell config:

```bash
alias kubectl="minikube kubectl --"
```

For additional insight into your cluster state, minikube bundles the Kubernetes Dashboard, allowing you to get easily acclimated to your new environment:

```bash
minikube dashboard
```