#!/usr/bin/bash

org='rancher'
proj='local-path-provisioner'
number=${1:-2}

versions(){
    curl -sL "https://api.github.com/repos/${org}/${proj}/releases" | jq -r ".[].tag_name" | \
        sort -rV | \
        head -n ${number} | \
        sed 's:v::g'
}

versions
