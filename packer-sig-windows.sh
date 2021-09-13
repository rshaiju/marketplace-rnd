export AZURE_SUBSCRIPTION_ID=
export AZURE_TENANT_ID=
export AZURE_CLIENT_ID=
export AZURE_CLIENT_SECRET=

az group create -n marketplace-rnd -l eastus

az sig create --gallery-name gallery101 -g marketplace-rnd

packer build -var location=eastus -var sig_gallery_resource_group=marketplace-rnd -var sig_gallery_name=gallery101 -var sig_image_name=win-webserver  -var sig_image_version=1.0.0 packer-sig-windows.json

