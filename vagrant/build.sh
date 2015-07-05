#!/usr/bin/env bash

sudo apt-get update --fix-missing
sudo apt-get install -y language-pack-en

sudo locale-gen es_ES.utf8
sudo locale-gen

sudo rm -f /var/lib/mongodb/mongod.lock

sudo chsh -s /bin/bash vagrant