#!/bin/bash

install_mvn(){
	wget http://www.us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
	tar xzf apache-maven-3.3.9-bin.tar.gz -C /opt
	ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn
	rm -rf apache-maven-3.3.9-bin.tar.gz
	echo 'export M2_HOME=/opt/apache-maven-3.3.9' >> ~/.bashrc 
}

install_utils(){
	yum -y install git
}

install_nodejs(){
	curl -sL https://rpm.nodesource.com/setup | bash -
	yum install -y nodejs
}

install_ruby(){
    yum install -y which tar
    curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL get.rvm.io | bash -s stable
    . /etc/profile.d/rvm.sh
    rvm install 2.0.0
    rvm use 2.0.0
}

install_mvn
install_utils
install_nodejs
install_ruby