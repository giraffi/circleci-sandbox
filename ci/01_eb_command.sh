#!/usr/bin/env bash
set -ex

EB_VERSION="2.6.4"
EB_BASE="AWS-ElasticBeanstalk-CLI-${EB_VERSION}"
HOME=${HOME:-/home/ubuntu}

sudo pip install boto

mkdir -p ${HOME}/awstools
cd $HOME/awstools

if ! [ -d ${HOME}/awstools/${EB_BASE} ]; then
  wget https://s3.amazonaws.com/elasticbeanstalk/cli/${EB_BASE}.zip
  unzip ${EB_BASE}.zip
fi

sudo ln -fs ${HOME}/awstools/${EB_BASE}/eb/linux/python2.7/eb ${HOME}/bin/
sudo ln -fs ${HOME}/awstools/${EB_BASE}/AWSDevTools/Linux/AWSDevTools-RepositorySetup.sh ${HOME}/bin/
