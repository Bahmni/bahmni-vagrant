#!/bin/bash

setup_repos() {
    yum install -y wget
    sudo wget https://bintray.com/bahmni/rpm/rpm -O /etc/yum.repos.d/bintray-bahmni-rpm.repo
}

install_bahmni-installer() {
    yum install -y bahmni-installer-$BAHMNI_VERSION
}

setup_ansible_configs() {
echo "
timezone: UTC
implementation_name: default
selinux_state: disabled
" > /etc/bahmni-installer/setup.yml
}

config_services() {
    sudo service openerp stop
    sudo service bahmni-erp-connect stop
    sudo service bahmni-reports stop

    chkconfig openerp off
    chkconfig bahmni-reports off
    chkconfig bahmni-erp-connect off
}

if [[ -z $BAHMNI_VERSION ]]; then
    echo "The variable BAHMNI_VERSION is not set. Aborting installation. Please set this variable before executing the script."
    exit 1
fi

setup_repos
install_bahmni-installer
setup_ansible_configs
sudo bahmni install
config_services
yum install -y dkms
