# Compute 
This section contains Kubernetes resources expressed as yaml files of the category Network


# Description of directories and files

## ingres
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
