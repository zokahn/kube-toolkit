# NGINX Ingress controller for Kubernetes (managed by Docker EE)

As scavanged via Stefan Trimborn; 
https://akomljen.com/kubernetes-nginx-ingress-controller/

The files in this folder are material to experiment with. To erect a ingress controller based on NGINX technology. You need to stand up ingress rules for your app as well.

## Sample application
``` kubectl create -f app-deployment.yaml -f app-service.yaml ```

You create a sample application using a deployment, associated with a service.

## Create NGINX Ingress Controller
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


