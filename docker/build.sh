#!/bin/sh

docker build \
  -f Dockerfile.clone \
  --tag stage/git \
  --build-arg REPO_URL=https://github.com/Pyrinpyi/pyipad \
   .

docker build \
  -f Dockerfile.builder \
  --tag stage/build \
   .

docker build \
  -f Dockerfile.pyrind \
  --tag pyrind:latest \
   .

docker build \
  -f Dockerfile.walletd \
  --tag pyrin-walletd:latest \
   .