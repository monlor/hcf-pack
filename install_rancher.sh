#!/bin/bash

KUBECTL_VER="v1.16.4"

RANCHER_VER="v2.3.2"

KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VER}/bin/linux/amd64/kubectl"

RANCHER_URL="https://releases.rancher.com/cli2/${RANCHER_VER}/rancher-linux-amd64-${RANCHER_VER}.tar.gz"

cd /tmp

curl -LO "${RANCHER_URL}" && tar zxvf rancher-linux-amd64-${RANCHER_VER}.tar.gz && chmod +x rancher-${RANCHER_VER}/rancher && cp -rf rancher-${RANCHER_VER}/rancher /usr/bin

curl -LO "${KUBECTL_URL}" && chmod +x ./kubectl && cp -rf ./kubectl /usr/bin

rm -rf ./rancher* && rm -rf ./kubectl*