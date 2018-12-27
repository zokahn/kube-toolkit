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








Create NGINX Ingress Controller
``` kubectl create namespace ingress ```
Create a namespace for the ingress controller entities to live in

## Create backend deployment and service
``` kubectl create -f default-backend-deployment.yaml -f default-backend-service.yaml -n=ingress ```

## Create configmap items for this service
``` kubectl create -f nginx-ingress-controller-config-map.yaml -n=ingress ```

## create nginx controller roles applied to the service account
``` kubectl create -f nginx-ingress-controller-roles.yaml -n=ingress ```

## Create the actual controller
``` kubectl create -f nginx-ingress-controller-deployment.yaml -n=ingress ```
