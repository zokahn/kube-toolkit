# Compute 
This section contains Kubernetes resources expressed as yaml files of the category Storage


# Description of files

## NFS based volume

- pv-nfs.yaml

This file contains the resource Persistant Volume. It declares the volume based on NFS and lists the NFS server and share.

- pvc-nfs.yaml

This file contains the claim to the Persistant Volume, pods reference this claim to mount it. It is a way to have a durable mount point without using details as NFS server and share just the claim.

- pod-nfs-vol.yaml
This is simple pod, based on Centos 7. It will start and loop a text to stdout with a timestamp. This time it will consume the NFS Share via the claim, that used the Persistant Volume.
The effect is that the pod will mount the nfs share on the described mount point. It will need the NFS mount ability, if NFS client files are missing from the image NFS mount will fail and you will find evidence of it in the logs.
 
 
