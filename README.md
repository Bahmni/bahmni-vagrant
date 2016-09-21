# bahmni-vagrant

Management of Vagrant box using Packer.  Out-Of-The-Box bahmni on CentOS 6.8


# Vagrant / Virtual Box Setup for Bahmni

Please follow the steps mentioned in this document on wiki to setup Bahmni Vagrant Box on your machine:
[Bahmni Vagrant Box Setup](https://bahmni.atlassian.net/wiki/display/BAH/Bahmni+Virtual+Box)


# Understanding Packer (For Developers)

Packer is a tool provided by Hashicorp, for creating a Vagrant box out of template VMs. This repository
contains Packer code for creating Bahmni vagrant boxes. For more details on understanding Packer please
read: https://www.packer.io/intro/

In Bahmni's case, we invoke Packer command with reference to file: [template.json](packer/template.json).
It uses a CentOS VM as reference, and then runs appropriate scripts, including installing Bahmni and dev tools, etc.

_Note: Packer runs on Bahmni CI server in pipeline "Release_To_Public" (manually triggered stage). One must trigger this stage after having marked relevant RPMs as "published" on bintray, so that when Packer runs, it picks up the LATEST published RPMs from bintray._
