# Docker Enterprise Edition specific files

## Create grant
Manages grants in Docker EE via API calls


## Get Bundle
When working on via the CLI, you need to authenticate yourself to the Docker EE masters. This is done by downloading a bundle of files consisting of TLS certificates, environment files and others. Without the bundle it is really hard to get authentication going.

A good procedure is to log in to the UCP console and go to the user profile where 'Downloading a client bundle' is an option.
Another option is to kick-off a script that requests the client authentication bundle via API calls via curl, then unzipping the result.
Implemented as get-bundle.sh
Based on https://docs.docker.com/ee/ucp/user-access/cli/#client-certificates-for-administrators
