#!/usr/bin/env bash
set -ex

EB_VERSION="2.6.4"
EB_BASE="AWS-ElasticBeanstalk-CLI-${EB_VERSION}"

sudo pip install boto

if ! [ -d /home/ubuntu/${EB_BASE} ]; then
  wget https://s3.amazonaws.com/elasticbeanstalk/cli/${EB_BASE}.zip
  unzip ${EB_BASE}.zip
fi

sudo ln -fs /home/ubuntu/${EB_BASE}/eb/linux/python2.7/eb /home/ubuntu/bin/
sudo ln -fs /home/ubuntu/${EB_BASE}/AWSDevTools/Linux/AWSDevTools-RepositorySetup.sh /home/ubuntu/bin/
