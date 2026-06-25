#!/bin/bash

set -ex;

org='rancher'
proj='local-path-provisioner'

version=$1

docker_build() {
    if [[ -z ${version} ]]; then
        version=$(./versions.sh 1)
    fi
    declare -l builder
    builder="${org}-${proj}-builder"
    local version=${version#v}
    docker build -t ${builder} .
    docker run --rm -v/var/run/docker.sock:/var/run/docker.sock -v$(pwd):/workspace -e LPP_VERSION=${version} ${builder}
    docker rmi ${builder}
}

docker_build
