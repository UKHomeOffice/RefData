#!/usr/bin/env bash

export USER=$(whoami)

if [[ ! ${USER} -eq "root" ]]
then
  echo ${PRIVATE_KEY} | base64 -d > /home/${USER}/.ssh/id_rsa
  chmod 400 /home/${USER}/.ssh/id_rsa
else
  echo ${PRIVATE_KEY} | base64 -d > /root/.ssh/id_rsa
  chmod 400 /root/.ssh/id_rsa
fi

echo "User is: $USER"
