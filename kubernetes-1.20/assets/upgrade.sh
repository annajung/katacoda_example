#!/bin/bash


echo "******* Upgrading cluster to v.1.19 *******"

kubeadm config images pull --kubernetes-version 1.19.0 > /dev/null 2>&1

apt-get update -y > /dev/null 2>&1 && apt-get install -y --allow-change-held-packages kubeadm=1.19.0-00 > /dev/null 2>&1
kubeadm upgrade apply v1.19.0 --yes --ignore-preflight-errors=all > /dev/null 2>&1

ssh node01 'kubeadm upgrade node' > /dev/null 2>&1

apt-get install -y kubelet=1.19.0-00 kubectl=1.19.0-00 > /dev/null 2>&1

sleep 15

echo "******* Upgrading cluster to v.1.20 *******"

kubeadm config images pull --kubernetes-version 1.20.0 > /dev/null 2>&1

apt-get update -y > /dev/null 2>&1 && apt-get install -y --allow-change-held-packages kubeadm=1.20.0-00 > /dev/null 2>&1
kubeadm upgrade apply v1.20.0 --yes --ignore-preflight-errors=all > /dev/null 2>&1

ssh node01 'kubeadm upgrade node' > /dev/null 2>&1

apt-get install -y kubelet=1.20.0-00 kubectl=1.20.0-00 > /dev/null 2>&1

sleep 15

echo "Cluster v1.20 Ready"