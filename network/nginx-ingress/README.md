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






The ingress controller as possible in Docker EE 2.0. [see here on the Docker site](https://docs.docker.com/ee/ucp/kubernetes/layer-7-r)
- ingress-namespace.yaml

FIXME: This is a manual step, find out how to yaml this.
  Create a grant
  The default service account that’s associated with the ingress-nginx namespace needs access to Kubernetes resources, so create a grant with Restricted Control permissions.

  1. From UCP, navigate to the Grants page, and click Create Grant.
  2.  Within the Subject pane, select Service Account. For the Namespace select ingress-nginx, and select default for the Service Account. Click Next.
  3. Within the Role pane, select Restricted Control, and then click Next.
  4. Within the Resource Set pane, select the Type Namespace, and select the Apply grant to all existing and new namespaces toggle.
  5. Click Create.


- ingress-nginx.yaml

* a simple HTTP server, named default-http-backend,
* an ingress controller, named nginx-ingress-controller, and
* a service that exposes the app, named ingress-nginx.

Check your deployment from the CLI
From the command line, confirm that the deployment is running by using curl with the URL that’s shown on the details pane of the ingress-nginx service.

curl -I http://<ucp-ip>:<ingress port>/
This command returns the following result.

HTTP/1.1 404 Not Found
Server: nginx/1.13.8
Test the server’s health ping service by appending /healthz to the URL.

curl -I http://<ucp-ip>:<ingress port>/healthz
This command returns the following result.

HTTP/1.1 200 OK
Server: nginx/1.13.8
