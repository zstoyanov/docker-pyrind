#!/bin/sh

set -e

echo
echo "========================="
echo " Building Pyrind"
echo "========================="
echo
./pyrind/build.sh $@

echo
echo "========================="
echo " Building Loadbalancer"
echo "========================="
echo
./kaspad_loadbalancer/build.sh $@

echo
echo "========================="
echo " Building Pyrinwallet"
echo "========================="
echo
./pyrinwallet/build.sh $@

echo
echo "========================="
echo " Done"
echo "========================="
echo