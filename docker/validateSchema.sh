#!/usr/bin/env sh

set +x
set -e

cd /mnt/docker/
pip3 install virtualenv
virtualenv refenv
source refenv/bin/activate
pip3 install -r requirements.txt
python3 testSchema.py
deactivate
