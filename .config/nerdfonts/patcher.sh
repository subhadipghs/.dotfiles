#!/bin/bash

version=$1
indir=$2
outdir=$3
echo $indir, $outdir
# --quiet --no-progressbars \

if [[ $version == '-v1' ]]; then
  echo "Running ghcr.io/cdalvaro/docker-nerd-fonts-patcher:latest docker image"
  docker run --rm \
    --volume $indir:/nerd-fonts/in \
    --volume $outdir:/nerd-fonts/out \
    --user $(id -u):$(id -g) \
    ghcr.io/cdalvaro/docker-nerd-fonts-patcher:latest \
    --mono --adjust-line-height --complete --careful
else
  echo "Running nerdfonts/patcher docker image"
  docker run --rm \
    -v $indir:/in \
    -v $outdir:/out \
    nerdfonts/patcher --mono --adjust-line-height --complete --careful
fi
