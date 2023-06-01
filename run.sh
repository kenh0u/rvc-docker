#!/bin/bash

port=7865

while getopts p: OPT; do
  case $OPT in
    p) port=$OPTARG ;;
  esac
done

echo -e '\nURL: http://localhost:'$port'\n'

docker run -it \
           --rm \
           --gpus all \
           -v $(pwd)/data:/data \
           -v $(pwd)/pretrained/hubert_base.pt:/rvc/hubert_base.pt \
           -v $(pwd)/pretrained/pretrained:/rvc/pretrained \
           -v $(pwd)/pretrained/pretrained_v2:/rvc/pretrained_v2 \
           -v $(pwd)/pretrained/uvr5_weights:/rvc/uvr5_weights \
           -v $(pwd)/rvc/weights:/rvc/weights \
           -v $(pwd)/rvc/logs:/rvc/logs \
           -v $(pwd)/rvc/TEMP:/rvc/TEMP \
           -v $(pwd)/rvc/opt:/rvc/opt \
           -p "$port":7865 \
           rvc
