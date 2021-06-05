#!/usr/bin/bash

source env

cd layer

mkdir -p volume

docker build -t "$LAMBDA_NAME" .

docker run --rm -v $(pwd)/volume:/volume:z "$LAMBDA_NAME"

aws lambda publish-layer-version --layer-name "$LAMBDA_NAME"-layer \
                                 --description "python3.8 layer for $LAMBDA_NAME" \
                                 --compatible-runtimes python3.8 \
                                 --zip-file fileb://volume/layer.zip | tee log.json

#aws lambda update-function-configuration --function-name "$LAMBDA_NAME" \
#                                         --layers $(jq -r '.LayerVersionArn' log.json)

rm -r volume log.json
