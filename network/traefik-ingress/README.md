# NGINX Ingress controller for Kubernetes (managed by Docker EE)

Traefik is also opted via Stefan Trimborn. This is an implementation based on: https://success.docker.com/article/how-to-configure-traefik-as-a-layer-7-ingress-controller-for-kubernetes and https://docs.traefik.io/user-guide/kubernetes/



The files in this folder are material to experiment with. To erect a meaningful Traefik controller based on traefik technology. You need to stand up ingress rules for your app as well.

## Sample application
You create a sample application using a deployment, associated with a service.
This will create two webservers, both with their own sample content. It will serve it up on a ip address on the kubernetes platform. However these addresses are NOT reachable from outside nodes, they are only available inside the kubernetes deployment.

You could add a nodeport or add a ingress controller which directs traffic from the public ip of the master to the services. This based on ingress rules we set later.

```
kubectl create -f app-deployment.yaml -f app-service.yaml
```

## Traefik Namespace
It pays to have the Traefik objects running in their own namespace. There will be a load balancer service and other moving parts.
The namespace we create is called: ingress-traefik

```
kubectl create -f traefic-namespace.yaml
```

## Create service account and rolebinding
For Traefik to operate the Kube api, it needs access. The Traefik page speaks of two ways of allowing this: Via namespace-specific RoleBindings or a single, global ClusterRoleBinding. In their example they go for the global Cluser Rolebinding. The Docker page proposes manual steps in the UCP webUI. For this particular implementation we go for the Traefik proposed steps.

This is done through this rolebinding:
```
kubectl create -f cluster-rolebinding.yaml
```

## Deploy the Traefik objects
The Traefik talks about creating Traefik objects with a Deployment or a DaemonSet. The Docker page speaks only of the Deployment option.
There are some significant differences between using Deployments and DaemonSets:

- The Deployment has easier up and down scaling possibilities. It can implement full pod lifecycle and supports rolling updates from Kubernetes 1.2. At least one Pod is needed to run the Deployment.
- The DaemonSet automatically scales to all nodes that meets a specific selector and guarantees to fill nodes one at a time. Rolling updates are fully supported from Kubernetes 1.7 for DaemonSets as well.

This particular implementation is rather experimental and we will stick with a Deployment.

note: the Traefik docs describe running the objects in the kube-system namespace. In these yaml files the services and most other objects are deployed in the namespace: ingress-traefik

```
kubectl create -f traefik-deployment.yaml
```

- Service account
- Deployment Controller
  - single replica based in the image: traefik
- service
  - publishing the default http backend port 80
  - publishing the admin http console on port 8080

You can now check the deployment either by checking the default end-point or the admin console. First you need to check where you can reach these services:

```
kubectl get svc --namespace ingress-traefik
```
You can check the name of the service here, next we describe the service to find out the port numbers. These will be unique to your deployment:

```
kubectl describe service traefik-ingress-service --namespace ingress-traefik | grep NodePort
Type:                     NodePort
NodePort:                 web  34738/TCP
NodePort:                 admin  34245/TCP
```
Append this port to the public ip of your master, for me this is:

```
172.28.128.11:34738
172.28.128.11:34245
```


## Ingress routing rules! host based
We need to create routing rules, now that the Igress controller components are deployed. With these rules we allow outside requests to reach services in the cluster.

note: make sure you changed dns or updates your hosts file so the named based requests get somewhere:

```
kubectl create -f app-ingress.yaml
```


## Ingress routing rules! path based
```
kubectl create -f app-ingress-path.yaml
```
