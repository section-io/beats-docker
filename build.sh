#!/bin/bash

build() {
    docker build -t section-io-filebeats -f Dockerfile.build -v
    docker run --rm -it section-io-filebeats > Dockerfile
}

build