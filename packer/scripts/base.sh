#!/bin/bash

setup_repos() {
    yum install -y wget
    sudo wget https://bintray.com/bahmni/rpm/rpm -O /etc/yum.repos.d/bintray-bahmni-rpm.repo
}

install_bahmni_installer() {
    yum install -y bahmni-installer-${BAHMNI_VERSION}
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

if [[ -z ${BAHMNI_VERSION} ]]; then
    echo "The variable BAHMNI_VERSION is not set. Aborting installation. Please set this variable before executing the script."
    exit 1
fi

if [[ -z ${ANSIBLE_VERSION} ]]; then
    echo "The variable ANSIBLE_VERSION is not set. Aborting installation. Please set this variable before executing the script."
    exit 1
fi

cleanup_mrs_markers(){
   mysql -uroot -ppassword openmrs -e "delete from markers"
}

setup_repos
install_bahmni_installer
setup_ansible_configs
sudo bahmni -i local -av ${ANSIBLE_VERSION} install
cleanup_mrs_markers
config_services
