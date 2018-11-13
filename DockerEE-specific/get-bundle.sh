# needs jq and therefor epel
# needs unzip

# change FQDN in your servername

UCP_FQDN=<UCP FQDN>
AUTHTOKEN=$(curl -sk -d '{"username":"admin","password":"adminadmin"}' \
    https://${UCP_FQDN}/auth/login | jq -r .auth_token)
alias ucp-api='curl -k -H "Authorization: Bearer $AUTHTOKEN"'
ucp-api https://${UCP_FQDN}/api/clientbundle -o bundle.zip
unzip bundle.zip
eval "$(<env.sh)"
