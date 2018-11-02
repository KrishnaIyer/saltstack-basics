#!/bin/bash

ROOT=$(pwd)

echo "Setting up master machine..."
cd $ROOT/machines/master
vagrant up
echo "Setting up minion machines..."
cd $ROOT/machines/minions/1
vagrant up
