#ATLAS_TOKEN env variable needs to be set before running this command
packer push -name 'bahmni-team/bahmni' template_rendered.json
rm template_rendered.json
