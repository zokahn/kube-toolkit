# Before beginning please load a UCP Client Certificate Bundle
# https://docs.docker.com/ee/ucp/user-access/cli

UCP_USERNAME=''
UCP_PASSWORD=''
UCP_FQDN='ucp.moby.com'
UCP_GRANT_ENDPOINT="https://${UCP_FQDN}/collectionGrants/system:serviceaccount:kube-system:tiller/kubernetesnamespaces/fullcontrol?type=grantobject"

# Create Tiller Service Account
kubectl create serviceaccount --namespace kube-system tiller

# Get UCP Authentication Token
AUTH_TOKEN=$(curl \
  --request POST \
  --silent \
  --insecure \
  --url "https://${UCP_FQDN}/auth/login" \
  --data "{ \"username\" : \"${UCP_USERNAME}\", \"password\" : \"${UCP_PASSWORD}\" } " | jq -r .auth_token)

# Create Grant
curl --request PUT \
  --url "${UCP_GRANT_ENDPOINT}" \
  --header 'accept: application/json' \
  --header 'Content-Type: application/json' \
  --header "Authorization: Bearer ${AUTH_TOKEN}"
