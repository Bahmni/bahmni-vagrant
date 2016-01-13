#ATLAS_TOKEN env variable needs to be set before running this command
packer push -name 'bahmni-team/bahmni' -var 'BAHMNI_PRODUCT_VERSION=0.78' template.json
