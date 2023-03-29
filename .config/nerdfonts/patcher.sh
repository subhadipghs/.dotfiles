#!/bin/bash

indir=$1
outdir=$2

docker run --rm \
    --volume $indir:/nerd-fonts/in \
    --volume $outdir:/nerd-fonts/out \
    --user $(id -u):$(id -g) \
    ghcr.io/cdalvaro/docker-nerd-fonts-patcher:latest \
    --quiet --no-progressbars \
    --mono --adjust-line-height --complete --careful
