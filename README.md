# kube-toolkit
Set of YAML files to get stuff done or tested in k8s

A work in progress. While i learn kubernetes i am saving neat yaml files in this repo. The way to interact with Kube is via yaml files, it is where ability is formulated. The learning curve of kubernetes includes understanding these yaml and what they reprasent.
Formulating correct resources via yaml files, while very literal and distinct, very hard and sometimes confusing. Kubernetes resources formulated in a single yaml file often use, reference, extend other resources. It takes a set of different yaml files to create a set of resources.

# Base
To apply these yaml files you need a working Kubernetes installation. Docker Enterprise Edition Platform 2.0 (Docker EE) was used as a base as it carries a full kubernetes implementation. Using the community edition is fine too! Docker for Mac is excellent, it will also give you kubernetes! Minikube is also great as a base although it has different implementations of certain base resources. The more detailed and dependand the resources in the yaml files get, the more varied the results will be on diffent platforms. It will always work on Docker EE.

More info here:

[Docker EE](https://docs.docker.com/ee/)

[Docker CE](https://docs.docker.com/install/)

[Docker for Mac](https://docs.docker.com/docker-for-mac/)

[Minikube](https://kubernetes.io/docs/setup/minikube/)

You can also apply the resources in this repo to test play around on a instant live platform:
[Play with Kubernetes ](https://labs.play-with-k8s.com/)


# Structure
The different directories in this repo reprasent different categories of resources right now there is:

- Compute
- Storage
- Networking

This project is in innitial state. Resources will be added over time as my familiarity with Kubernetes increases.

# Help is welcome
You are invited to help extend the repo with new resources. Detailed with full comments and explaination. It is not about getting resources applied in Kubernetes! It is all about playing around with the resources and how they are expressed in the yaml files.

Comments and help is welcome, just add to the project of email me
bart.vandenheuvel@docker.com
